<template>
    <main class="bg-brand-light min-h-screen">
        <section class="bg-brand-gradient text-white py-16 sm:py-20">
            <div class="section-boxed space-y-4">
                <h1 class="text-4xl sm:text-5xl max-w-3xl">
                    Residential Electrical Upgrades
                </h1>
                <p class="max-w-2xl text-white/85">
                    Reliable wiring, lighting, and safety upgrades for Oakdale homes, handled by licensed electricians who tidy up when the job is done.
                </p>
            </div>
        </section>

        <section class="section-boxed py-16 sm:py-20 grid gap-12 lg:grid-cols-[1.2fr,0.8fr] items-start">
            <div class="space-y-6">
                <p class="text-brand-dark/80 leading-relaxed">
                    Our crew tackles service upgrades, remodel wiring, lighting design, and troubleshooting with the care your home deserves. We map every circuit, coordinate inspections, and leave your space as clean as we found it—whether we are replacing a dated panel or adding kitchen task lighting.
                </p>
                <ul class="space-y-3 text-brand-dark/75">
                    <li class="flex gap-3">
                        <span class="text-brand-primary">▹</span>
                        <span>Panel replacements, capacity planning, and code corrections</span>
                    </li>
                    <li class="flex gap-3">
                        <span class="text-brand-primary">▹</span>
                        <span>Interior, exterior, and landscape lighting layouts and installs</span>
                    </li>
                    <li class="flex gap-3">
                        <span class="text-brand-primary">▹</span>
                        <span>Whole-home surge, smoke detector, and smart safety upgrades</span>
                    </li>
                </ul>
                <p class="text-brand-dark font-semibold">
                    Schedule your residential electrical visit today.
                </p>
                <div class="flex flex-wrap gap-4">
                    <a :href="`tel:${siteConfig.phone}`" class="btn-primary">
                        Call {{ siteConfig.phoneDisplay || siteConfig.phone }}
                    </a>
                    <NuxtLink to="/contact" class="btn-accent">
                        Request an estimate
                    </NuxtLink>
                </div>
            </div>
            <div class="card-box bg-white space-y-4">
                <h2 class="text-2xl text-brand-dark">FAQs</h2>
                <div v-for="faq in faqs" :key="faq.q" class="border-b border-brand-primary/10 pb-4 last:border-none last:pb-0">
                    <p class="font-semibold text-brand-dark">{{ faq.q }}</p>
                    <p class="text-brand-dark/75 mt-1 leading-relaxed">{{ faq.a }}</p>
                </div>
            </div>
        </section>

        <section class="bg-white py-16 sm:py-20">
            <div class="section-boxed flex flex-col gap-6 md:flex-row md:items-center md:justify-between">
                <div class="space-y-2">
                    <h2 class="text-3xl text-brand-dark">
                        Let’s make your home safer and smarter.
                    </h2>
                    <p class="text-brand-dark/70">
                        Share your punch list or plans and we’ll review options, pricing, and timelines in one quick call.
                    </p>
                </div>
                <NuxtLink to="/contact" class="btn-primary">
                    Book a walkthrough
                </NuxtLink>
            </div>
        </section>
    </main>
</template>

<script setup lang="ts">
import { useHead } from '#imports'
import { siteConfig } from '~/site.config'

const pageUrl = `${siteConfig.siteUrl.replace(/\/$/, '')}/services/residential-electrical`

const faqs = [
    {
        q: 'Can you work on older homes?',
        a: 'Yes. We evaluate existing wiring, update grounding, and plan upgrades that preserve finishes while meeting current code.'
    },
    {
        q: 'Do you coordinate permits and inspections?',
        a: 'We handle permitting, schedule inspections, and stay on site until everything passes.'
    },
    {
        q: 'Can you install fixtures I provide?',
        a: 'We can install homeowner-supplied fixtures after verifying they are safe and compatible with your wiring.'
    }
]

const serviceSchema = {
    '@context': 'https://schema.org',
    '@type': 'Service',
    '@id': `${pageUrl}#service`,
    name: 'Residential Electrical Services',
    description:
        'Licensed residential electrical services including panel upgrades, lighting design, troubleshooting, and whole-home safety improvements in Oakdale, MN.',
    provider: {
        '@type': 'LocalBusiness',
        name: siteConfig.siteName,
        telephone: siteConfig.phone,
        areaServed: siteConfig.serviceAreas,
        address: {
            '@type': 'PostalAddress',
            streetAddress: siteConfig.location.street,
            addressLocality: siteConfig.location.city,
            addressRegion: siteConfig.location.state,
            postalCode: siteConfig.location.zip,
            addressCountry: siteConfig.location.country
        }
    },
    areaServed: siteConfig.serviceAreas,
    serviceType: 'Residential electrical contracting',
    url: pageUrl
}

useHead({
    title: `Residential Electrical | ${siteConfig.siteName}`,
    meta: [
        {
            name: 'description',
            content:
                'Residential electrical services from Vogt Electric covering panel upgrades, lighting, troubleshooting, and surge protection for homes across Oakdale and the east metro.'
        }
    ],
    script: [{ type: 'application/ld+json', children: JSON.stringify(serviceSchema) }]
})
</script>
