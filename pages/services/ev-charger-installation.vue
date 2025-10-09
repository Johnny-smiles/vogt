<template>
    <main class="bg-brand-light min-h-screen">
        <section class="bg-brand-gradient text-white py-16 sm:py-20">
            <div class="section-boxed space-y-4">
                <h1 class="text-4xl sm:text-5xl max-w-3xl">
                    EV Charger Installation
                </h1>
                <p class="max-w-2xl text-white/85">
                    Dependable Level 2 charging solutions for homes, fleets, and workplaces with clean installs, load calculations, and driver training.
                </p>
            </div>
        </section>

        <section class="section-boxed py-16 sm:py-20 grid gap-12 lg:grid-cols-[1.2fr,0.8fr] items-start">
            <div class="space-y-6">
                <p class="text-brand-dark/80 leading-relaxed">
                    Vogt Electric designs and installs EV charging stations sized for current and future vehicles. We evaluate your service capacity, handle permitting, manage cable routing, and commission every unit so charging is fast, safe, and effortless.
                </p>
                <ul class="space-y-3 text-brand-dark/75">
                    <li class="flex gap-3">
                        <span class="text-brand-primary">▹</span>
                        <span>Site assessments, load calculations, and full permitting support</span>
                    </li>
                    <li class="flex gap-3">
                        <span class="text-brand-primary">▹</span>
                        <span>Tesla, Wallbox, ChargePoint, and fleet-ready charger integrations</span>
                    </li>
                    <li class="flex gap-3">
                        <span class="text-brand-primary">▹</span>
                        <span>Cable management, labeling, and owner walk-through training</span>
                    </li>
                </ul>
                <p class="text-brand-dark font-semibold">
                    Schedule your EV charger installation today.
                </p>
                <div class="flex flex-wrap gap-4">
                    <a :href="`tel:${siteConfig.phone}`" class="btn-primary">
                        Call {{ siteConfig.phoneDisplay || siteConfig.phone }}
                    </a>
                    <NuxtLink to="/contact" class="btn-accent">
                        Request a site visit
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
                        Ready to charge faster?
                    </h2>
                    <p class="text-brand-dark/70">
                        We’ll recommend the right charger, prep your electrical panel, and deliver a seamless installation.
                    </p>
                </div>
                <NuxtLink to="/contact" class="btn-primary">
                    Plan your install
                </NuxtLink>
            </div>
        </section>
    </main>
</template>

<script setup lang="ts">
import { useHead } from '#imports'
import { siteConfig } from '~/site.config'

const pageUrl = `${siteConfig.siteUrl.replace(/\/$/, '')}/services/ev-charger-installation`

const faqs = [
    {
        q: 'Do you help choose the right charger?',
        a: 'Yes. We review your vehicle lineup, mileage, and electrical capacity to recommend equipment that fits today and tomorrow.'
    },
    {
        q: 'How long does installation take?',
        a: 'Most single-port installs wrap in one day. Fleet installations are scheduled in phases to minimize downtime.'
    },
    {
        q: 'Can you add a charger to an older panel?',
        a: 'We calculate available capacity, upgrade the panel if needed, and ensure the circuit is safe and code compliant.'
    }
]

const serviceSchema = {
    '@context': 'https://schema.org',
    '@type': 'Service',
    '@id': `${pageUrl}#service`,
    name: 'EV Charger Installation Services',
    description:
        'Professional EV charger installation including site assessments, permitting, and commissioning for residential and commercial properties in Oakdale, MN.',
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
    serviceType: 'EV charger installation',
    url: pageUrl
}

useHead({
    title: `EV Charger Installation | ${siteConfig.siteName}`,
    meta: [
        {
            name: 'description',
            content:
                'EV charger installation by Vogt Electric featuring load calculations, permitting, and commissioning for homes, workplaces, and fleets across Oakdale and the east metro.'
        }
    ],
    script: [{ type: 'application/ld+json', children: JSON.stringify(serviceSchema) }]
})
</script>
