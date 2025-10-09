<template>
    <main class="flex flex-col bg-brand-light">
        <HeroSection />

        <!-- Intro -->
        <section class="section-boxed py-16 sm:py-20">
            <div class="grid gap-12 lg:grid-cols-[1.1fr,0.9fr] items-start">
                <div class="space-y-6">
                    <h2 class="text-3xl sm:text-4xl text-brand-dark">
                        {{ homeCopy.headline }}
                    </h2>
                    <p class="text-base sm:text-lg text-brand-dark/80 leading-relaxed">
                        {{ homeCopy.intro }}
                    </p>
                </div>
                <div class="card-box bg-white">
                    <p class="uppercase tracking-[0.35em] text-xs text-brand-accent">
                        Why neighbors call Vogt Electric
                    </p>
                    <ul class="mt-6 space-y-4">
                        <li
                            v-for="point in homeCopy.bullets"
                            :key="point"
                            class="flex gap-3 text-brand-dark/80"
                        >
                            <span class="mt-1 h-2 w-2 rounded-full bg-brand-primary"></span>
                            <span>{{ point }}</span>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Services -->
        <HomepageServices />

        <!-- Value props -->
        <section class="section-boxed py-16 sm:py-20">
            <div class="text-center max-w-2xl mx-auto space-y-3 mb-12">
                <span class="chip text-brand-primary bg-white">
                    Why Choose {{ siteConfig.siteName }}
                </span>
                <h2 class="text-3xl sm:text-4xl text-brand-dark">
                    Power pros focused on safety, clarity, and respect.
                </h2>
            </div>
            <div class="grid gap-8 md:grid-cols-3">
                <article
                    v-for="(value, index) in siteConfig.valueProps"
                    :key="`value-${index}`"
                    class="card-box bg-white"
                >
                    <h3 class="text-2xl text-brand-dark mb-4">
                        {{ value.title }}
                    </h3>
                    <p class="text-brand-dark/75 leading-relaxed">
                        {{ value.text }}
                    </p>
                </article>
            </div>
        </section>

        <!-- About -->
        <section class="relative overflow-hidden bg-white py-16 sm:py-20">
            <div class="absolute inset-0 pointer-events-none">
                <div class="absolute top-0 right-0 h-56 w-56 rounded-full bg-brand-primary/15 blur-3xl"></div>
            </div>
            <div class="section-boxed relative grid gap-12 lg:grid-cols-2 items-center">
                <div class="space-y-6">
                    <span class="chip text-brand-primary bg-brand-light">
                        About {{ siteConfig.siteName }}
                    </span>
                    <h2 class="text-3xl sm:text-4xl text-brand-dark">
                        Local electricians who treat every job like it’s their own building.
                    </h2>
                    <p class="text-base sm:text-lg text-brand-dark/80 leading-relaxed">
                        From service upgrades and remodel wiring to EV charging stations, we keep projects tidy, code compliant, and on schedule. Our licensed crew coordinates permits, inspections, and walk-throughs so property owners never feel left in the dark.
                    </p>
                    <div class="flex flex-wrap gap-4">
                        <a :href="`tel:${siteConfig.phone}`" class="btn-primary">
                            Call {{ displayPhone }}
                        </a>
                        <NuxtLink to="/contact" class="btn-accent">
                            Request an estimate
                        </NuxtLink>
                    </div>
                </div>
                <div class="card-box bg-brand-primary text-white space-y-6">
                    <p class="uppercase tracking-[0.35em] text-xs text-white/70">
                        Recent wins
                    </p>
                    <ul class="space-y-4 text-sm sm:text-base">
                        <li class="flex gap-3">
                            <span class="text-brand-light">▹</span>
                            <span>200-amp service upgrade with EV-ready panel in Oakdale split-level.</span>
                        </li>
                        <li class="flex gap-3">
                            <span class="text-brand-light">▹</span>
                            <span>LED retrofit and occupancy sensors for Woodbury retail build-out.</span>
                        </li>
                        <li class="flex gap-3">
                            <span class="text-brand-light">▹</span>
                            <span>Exterior lighting overhaul and surge protection for Maplewood HOA.</span>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Reviews -->
        <section class="section-boxed py-16 sm:py-20">
            <div class="text-center max-w-2xl mx-auto space-y-3 mb-12">
                <span class="chip text-brand-primary bg-white">
                    Client Feedback
                </span>
                <h2 class="text-3xl sm:text-4xl text-brand-dark">
                    Tidy, transparent, and on time — every single visit.
                </h2>
            </div>
            <div class="grid gap-8 md:grid-cols-3">
                <article
                    v-for="(review, index) in siteConfig.reviews"
                    :key="`review-${index}`"
                    class="card-box bg-white"
                >
                    <p class="text-brand-dark/75 leading-relaxed">“{{ review.text }}”</p>
                    <p class="mt-4 text-sm font-semibold text-brand-dark/70">— {{ review.name }}</p>
                </article>
            </div>
        </section>

        <!-- CTA -->
        <section class="py-16 sm:py-20">
            <div class="section-boxed">
                <div class="bg-brand-gradient rounded-[32px] px-8 py-10 md:px-12 md:py-12 text-white flex flex-col lg:flex-row gap-8 lg:items-center lg:justify-between">
                    <div class="space-y-3 max-w-xl">
                        <h2 class="text-3xl sm:text-4xl">
                            Ready for safer, smarter power?
                        </h2>
                        <p class="text-white/85">
                            We’ll walk your project, explain the options, and deliver work that passes inspection the first time.
                        </p>
                    </div>
                    <div class="flex flex-wrap gap-4">
                        <a :href="`tel:${siteConfig.phone}`" class="btn-primary">
                            Call {{ displayPhone }}
                        </a>
                        <NuxtLink to="/contact" class="btn-accent">
                            Book an appointment
                        </NuxtLink>
                    </div>
                </div>
            </div>
        </section>

        <!-- FAQs -->
        <section class="section-boxed py-16 sm:py-20">
            <div class="text-center max-w-2xl mx-auto space-y-3 mb-12">
                <span class="chip text-brand-primary bg-white">
                    FAQs
                </span>
                <h2 class="text-3xl sm:text-4xl text-brand-dark">
                    Quick answers before we roll a truck.
                </h2>
            </div>
            <div class="grid gap-6 md:grid-cols-2">
                <article
                    v-for="(faq, index) in siteConfig.faqs"
                    :key="`faq-${index}`"
                    class="card-box bg-white"
                >
                    <h3 class="text-xl text-brand-dark mb-3">
                        {{ faq.q }}
                    </h3>
                    <p class="text-brand-dark/75 leading-relaxed">
                        {{ faq.a }}
                    </p>
                </article>
            </div>
        </section>

        <!-- Service areas -->
        <section class="bg-white py-16 sm:py-20">
            <div class="section-boxed text-center space-y-6">
                <span class="chip text-brand-primary bg-brand-light">
                    Service Areas
                </span>
                <h2 class="text-3xl sm:text-4xl text-brand-dark">
                    Proudly keeping the east metro powered.
                </h2>
                <div class="flex flex-wrap gap-3 justify-center">
                    <span
                        v-for="(area, index) in siteConfig.serviceAreas"
                        :key="`area-${index}`"
                        class="chip bg-white text-brand-dark border-brand-primary/20"
                    >
                        {{ area }}
                    </span>
                </div>
            </div>
        </section>
    </main>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useHead } from '#imports'
import HeroSection from '~/components/HeroSection.vue'
import HomepageServices from '~/components/HomepageServices.vue'
import { siteConfig } from '~/site.config'

const homeCopy = {
    headline: 'Reliable electrical upgrades for Oakdale properties',
    subheadline: 'Licensed electricians delivering safe installs and quick diagnostics.',
    intro: 'Vogt Electric keeps homes and small businesses in Oakdale powered safely. From panel upgrades and service troubleshooting to lighting design and EV charger installs, our licensed team handles projects cleanly and on schedule. When you need an electrician near you, expect quick communication, tidy work, and upfront guidance. We bring the same care to Maplewood remodels as we do to Woodbury storefronts, always meeting code and respecting your space. Count on precise workmanship, transparent pricing, and a crew that leaves every job site spotless.',
    bullets: [
        'Licensed, bonded, and insured electricians',
        'Code-compliant installs, upgrades, and repairs',
        'Respectful scheduling with clean job sites',
        'Transparent pricing and clear recommendations'
    ]
}

const displayPhone = computed(() => siteConfig.phoneDisplay || siteConfig.phone)

const structuredData = {
    '@context': 'https://schema.org',
    '@type': siteConfig.businessType || 'LocalBusiness',
    name: siteConfig.siteName,
    url: siteConfig.siteUrl,
    telephone: siteConfig.phone,
    description: siteConfig.description,
    image: siteConfig.socialImage || undefined,
    address: {
        '@type': 'PostalAddress',
        streetAddress: siteConfig.location.street || undefined,
        addressLocality: siteConfig.location.city,
        addressRegion: siteConfig.location.state,
        postalCode: siteConfig.location.zip,
        addressCountry: siteConfig.location.country
    },
    openingHours: siteConfig.hours,
    geo:
        siteConfig.location.latitude && siteConfig.location.longitude
            ? {
                  '@type': 'GeoCoordinates',
                  latitude: siteConfig.location.latitude,
                  longitude: siteConfig.location.longitude
              }
            : undefined,
    areaServed: siteConfig.serviceAreas
}

useHead({
    script: [{ type: 'application/ld+json', children: JSON.stringify(structuredData) }]
})
</script>
