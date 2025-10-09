<template>
    <footer class="bg-brand-light text-brand-dark pt-14 pb-8">
        <div class="max-w-7xl mx-auto grid gap-10 px-6 text-center md:text-left md:grid-cols-2 lg:grid-cols-4">
            <!-- Brand -->
            <div class="space-y-3">
                <img src="/logo.png" :alt="`${siteConfig.siteName} Logo`" class="w-16 h-16 rounded object-cover mx-auto md:mx-0" />
                <p class="font-semibold text-lg">{{ brandName }}</p>
                <p>
                    <a :href="`tel:${phoneE164}`" class="hover:text-brand-primary">{{ phoneDisplay }}</a>
                </p>
                <p>
                    <a :href="`mailto:${email}`" class="hover:text-brand-primary">{{ email }}</a>
                </p>
                <p v-if="addressLine" class="text-sm text-neutral-600">
                    {{ addressLine }}
                </p>
                <p class="text-sm text-neutral-600">
                    {{ siteConfig.hours }}
                </p>
            </div>

            <!-- Company -->
            <div>
                <h3 class="text-lg font-semibold mb-3 uppercase tracking-wide">Company</h3>
                <ul class="list-none space-y-2">
                    <li><NuxtLink to="/"            class="hover:text-brand-primary">Home</NuxtLink></li>
                    <li><NuxtLink to="/about"       class="hover:text-brand-primary">About</NuxtLink></li>
                    <li><NuxtLink to="/services"    class="hover:text-brand-primary">Services</NuxtLink></li>
                    <li><NuxtLink to="/contact"     class="hover:text-brand-primary">Contact</NuxtLink></li>
                </ul>
            </div>

            <!-- Services -->
            <div>
                <h3 class="text-lg font-semibold mb-3 uppercase tracking-wide">Core Services</h3>
                <ul class="list-none space-y-2">
                    <li
                        v-for="service in serviceLinks"
                        :key="service.slug"
                    >
                        <NuxtLink :to="`/services/${service.slug}`" class="hover:text-brand-primary">
                            {{ service.title }}
                        </NuxtLink>
                    </li>
                </ul>
            </div>

            <!-- Connect -->
            <div class="space-y-4">
                <h3 class="text-lg font-semibold uppercase tracking-wide">Connect</h3>
                <a :href="`tel:${phoneE164}`" class="btn-primary inline-flex w-full justify-center">
                    Call {{ phoneDisplay }}
                </a>
                <ul class="list-none space-y-2 text-sm">
                    <li v-for="link in socialLinks" :key="link.label">
                        <a :href="link.url" class="hover:text-brand-primary" target="_blank" rel="noopener">
                            {{ link.label }}
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <p class="text-center text-sm mt-10 border-t border-brand-dark/10 pt-6">
            © {{ new Date().getFullYear() }} {{ brandName }}. All rights reserved.
        </p>
    </footer>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { siteConfig } from '~/site.config'
import { services } from '~/data/services'

const brandName = computed(() => siteConfig.siteName || 'Vogt Electric')
const email = computed(() => siteConfig.email || 'info@vogtelectric.com')

const phoneDisplay = computed(() => {
    // prefer a display value if present
    const disp = (siteConfig as any).phoneDisplay
    if (disp) return disp
    const raw = (siteConfig.phone || '').replace(/[^0-9]/g, '')
    if (raw.length === 11 && raw.startsWith('1')) return `(${raw.slice(1,4)}) ${raw.slice(4,7)}-${raw.slice(7)}`
    if (raw.length === 10) return `(${raw.slice(0,3)}) ${raw.slice(3,6)}-${raw.slice(6)}`
    return siteConfig.phone || ''
})
const phoneE164 = computed(() => {
    const raw = (siteConfig.phone || '').replace(/[^0-9]/g, '')
    if (!raw) return ''
    if (raw.startsWith('1') && raw.length === 11) return `+${raw}`
    if (raw.length === 10) return `+1${raw}`
    return `+${raw}`
})

const addressLine = computed(() => {
    const loc = siteConfig.location || {}
    if (loc.street) return `${loc.street}, ${loc.city}, ${loc.state} ${loc.zip}`
    if (loc.city && loc.state) return `${loc.city}, ${loc.state} ${loc.zip || ''}`.trim()
    return ''
})

const serviceLinks = computed(() =>
    services.map((service) => ({
        title: service.title,
        slug: service.slug
    }))
)

const socialLinks = computed(() => {
    const links = siteConfig.social || {}
    const entries: { label: string; url: string }[] = []
    if (links.facebook) entries.push({ label: 'Facebook', url: links.facebook })
    if (links.nextdoor) entries.push({ label: 'Nextdoor', url: links.nextdoor })
    if (links.gbp) entries.push({ label: 'Google Business Profile', url: links.gbp })
    if (links.website) entries.push({ label: 'Website', url: links.website })
    return entries
})
</script>
