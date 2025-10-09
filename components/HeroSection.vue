<template>
    <!-- Hero layout variant: with-cta-band -->
    <section class="relative overflow-hidden bg-brand-gradient text-white">
        <div class="absolute inset-0 pointer-events-none">
            <div class="absolute -top-24 -right-20 h-72 w-72 rounded-full bg-white/10 blur-3xl"></div>
            <div class="absolute bottom-0 left-0 h-40 w-full bg-gradient-to-t from-black/20 to-transparent"></div>
        </div>

        <div class="relative section-boxed py-20 sm:py-24 lg:py-28">
            <div class="grid gap-12 lg:grid-cols-[1.15fr,0.85fr] items-center">
                <div class="space-y-6 lg:space-y-8 text-left">
                    <div class="flex flex-wrap gap-3 items-center" v-if="heroContent.eyebrow || cityRegion">
                        <span v-if="heroContent.eyebrow" class="chip bg-white/10 text-white/90 border-white/30">
                            {{ heroContent.eyebrow }}
                        </span>
                        <span v-if="cityRegion" class="chip bg-white/10 text-white/80 border-white/20">
                            Serving {{ cityRegion }}
                        </span>
                    </div>

                    <h1 class="text-4xl sm:text-5xl lg:text-6xl drop-shadow-xl">
                        {{ heroContent.headline }}
                    </h1>

                    <p class="text-base sm:text-lg text-white/90 max-w-2xl leading-relaxed">
                        {{ heroContent.subheadline }}
                    </p>

                    <div class="flex flex-wrap gap-4">
                        <a :href="`tel:${siteConfig.phone}`" class="btn-primary">
                            {{ heroContent.ctaPrimary }}
                        </a>
                        <NuxtLink to="/contact" class="btn-accent">
                            {{ heroContent.ctaSecondary }}
                        </NuxtLink>
                    </div>

                    <div v-if="displayAreas.length" class="flex flex-wrap gap-2 pt-4">
                        <span
                            v-for="area in displayAreas"
                            :key="area"
                            class="px-4 py-1 rounded-full bg-white/10 text-xs font-semibold tracking-wide uppercase"
                        >
                            {{ area }}
                        </span>
                    </div>
                </div>

                <div class="card-box bg-white/90 text-brand-primary shadow-2xl shadow-black/30 space-y-6">
                    <p class="uppercase tracking-[0.3em] text-xs text-brand-accent">
                        Licensed • Insured • Local
                    </p>
                    <h2 class="text-2xl sm:text-3xl text-brand-dark">
                        Dependable electricians for Oakdale and the east metro.
                    </h2>
                    <div class="border-t border-brand-primary/20 pt-6 space-y-4 text-brand-dark">
                        <div class="flex items-center gap-4 text-lg font-medium">
                            <span class="inline-flex h-12 w-12 items-center justify-center rounded-full bg-brand-primary text-white text-xl">
                                ⚡
                            </span>
                            <div>
                                <p class="text-sm uppercase tracking-wide text-brand-accent">Call or Text</p>
                                <a :href="`tel:${siteConfig.phone}`" class="text-2xl font-semibold text-brand-dark hover:text-brand-primary">
                                    {{ prettyPhone }}
                                </a>
                            </div>
                        </div>
                        <div>
                            <p class="text-sm uppercase tracking-wide text-brand-accent">Hours</p>
                            <p class="text-lg font-medium">{{ siteConfig.hours || 'Monday – Friday 7am to 5pm' }}</p>
                        </div>
                        <div>
                            <p class="text-sm uppercase tracking-wide text-brand-accent">Email</p>
                            <a :href="`mailto:${siteConfig.email}`" class="text-lg font-medium hover:text-brand-primary">
                                {{ siteConfig.email }}
                            </a>
                        </div>
                    </div>
                    <NuxtLink to="/services" class="btn-outline w-full justify-center">
                        {{ heroContent.ctaBand }}
                    </NuxtLink>
                </div>
            </div>

            <div class="mt-12 lg:mt-16">
                <div class="w-full rounded-[32px] border border-white/15 bg-white/10 px-6 py-5 sm:px-10 sm:py-7 flex flex-col md:flex-row md:items-center md:justify-between gap-4 backdrop-blur">
                    <div class="text-sm uppercase tracking-[0.25em] text-white/70">
                        Fast troubleshooting • Clean installs • Respectful pros
                    </div>
                    <div class="flex flex-wrap gap-3">
                        <NuxtLink to="/services/residential-electrical" class="btn-accent">
                            Residential
                        </NuxtLink>
                        <NuxtLink to="/services/commercial-electrical" class="btn-accent">
                            Commercial
                        </NuxtLink>
                        <NuxtLink to="/services/ev-charger-installation" class="btn-accent">
                            EV Chargers
                        </NuxtLink>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { siteConfig } from '~/site.config'

const cityRegion = computed(() => {
    const city = siteConfig.location?.city
    const state = siteConfig.location?.state
    if (city && state) return `${city}, ${state}`
    return city || state || ''
})

const displayAreas = computed(() => {
    const areas = siteConfig.serviceAreas
    if (Array.isArray(areas)) return areas
    if (typeof areas === 'string') {
        return areas
            .split(',')
            .map((area) => area.trim())
            .filter(Boolean)
    }
    return []
})

const heroContent = computed(() => {
    const hero = siteConfig.hero || {}
    return {
        eyebrow: hero.eyebrow || 'Power for every project',
        headline: hero.headline || 'Reliable electrical upgrades that last',
        subheadline: hero.subheadline || 'Licensed electricians delivering tidy installs, fast diagnostics, and code-perfect results.',
        ctaPrimary: hero.ctaPrimaryLabel || 'Call Now',
        ctaSecondary: hero.ctaSecondaryLabel || 'Book an Estimate',
        ctaBand: hero.ctaBandLabel || 'Explore services'
    }
})

const prettyPhone = computed(() => {
    const digits = (siteConfig.phone || '').replace(/[^0-9]/g, '')
    if (digits.length === 11 && digits.startsWith('1')) return `(${digits.slice(1,4)}) ${digits.slice(4,7)}-${digits.slice(7)}`
    if (digits.length === 10) return `(${digits.slice(0,3)}) ${digits.slice(3,6)}-${digits.slice(6)}`
    return siteConfig.phone
})
</script>
