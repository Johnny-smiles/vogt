<template>
    <main class="bg-brand-light min-h-screen">
        <section class="bg-brand-gradient text-white py-16 sm:py-20">
            <div class="section-boxed space-y-4">
                <h1 class="text-4xl sm:text-5xl max-w-3xl">
                    Commercial Electrical Contracting
                </h1>
                <p class="max-w-2xl text-white/85">
                    Powering offices, retail, and light industrial spaces with clean installs, proactive maintenance, and responsive troubleshooting across the east metro.
                </p>
            </div>
        </section>

        <section class="section-boxed py-16 sm:py-20 grid gap-12 lg:grid-cols-[1.2fr,0.8fr] items-start">
            <div class="space-y-6">
                <p class="text-brand-dark/80 leading-relaxed">
                    Vogt Electric supports tenant improvements, new construction, and retrofits with detailed planning, clear communication, and crews that respect your schedule. We collaborate with property managers and general contractors to keep projects on time, handle permitting, and deliver code-compliant work that keeps customers safe.
                </p>
                <ul class="space-y-3 text-brand-dark/75">
                    <li class="flex gap-3">
                        <span class="text-brand-primary">▹</span>
                        <span>Tenant build-outs, code corrections, and retrofit planning</span>
                    </li>
                    <li class="flex gap-3">
                        <span class="text-brand-primary">▹</span>
                        <span>Lighting upgrades, controls, and energy management strategies</span>
                    </li>
                    <li class="flex gap-3">
                        <span class="text-brand-primary">▹</span>
                        <span>Preventive maintenance schedules and emergency response on standby</span>
                    </li>
                </ul>
                <p class="text-brand-dark font-semibold">
                    Book your commercial electrical consultation today.
                </p>
                <div class="flex flex-wrap gap-4">
                    <a :href="`tel:${siteConfig.phone}`" class="btn-primary">
                        Call {{ siteConfig.phoneDisplay || siteConfig.phone }}
                    </a>
                    <NuxtLink to="/contact" class="btn-accent">
                        Request a proposal
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
                        Need an electrical partner for your facility?
                    </h2>
                    <p class="text-brand-dark/70">
                        Share plans or maintenance needs and we’ll tailor a scope that protects uptime and budgets.
                    </p>
                </div>
                <NuxtLink to="/contact" class="btn-primary">
                    Start the conversation
                </NuxtLink>
            </div>
        </section>
    </main>
</template>

<script setup lang="ts">
import { useHead } from '#imports'
import { siteConfig } from '~/site.config'

const pageUrl = `${siteConfig.siteUrl.replace(/\/$/, '')}/services/commercial-electrical`

const faqs = [
    {
        q: 'Can you work after hours to avoid downtime?',
        a: 'Yes. We schedule night or weekend shifts so your staff and customers are not disrupted.'
    },
    {
        q: 'Do you provide ongoing maintenance plans?',
        a: 'We offer preventive maintenance and inspection packages tailored to your facility’s usage and equipment.'
    },
    {
        q: 'Can you assist with permitting for new tenants?',
        a: 'We prepare drawings, submit permit applications, and meet inspectors to keep tenant openings on schedule.'
    }
]

const serviceSchema = {
    '@context': 'https://schema.org',
    '@type': 'Service',
    '@id': `${pageUrl}#service`,
    name: 'Commercial Electrical Services',
    description:
        'Commercial electrical contracting for tenant build-outs, lighting upgrades, maintenance, and troubleshooting across Oakdale, MN and the Twin Cities east metro.',
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
    serviceType: 'Commercial electrical contracting',
    url: pageUrl
}

useHead({
    title: `Commercial Electrical | ${siteConfig.siteName}`,
    meta: [
        {
            name: 'description',
            content:
                'Commercial electrical services from Vogt Electric covering tenant build-outs, lighting controls, maintenance, and emergency response for businesses across Oakdale and surrounding cities.'
        }
    ],
    script: [{ type: 'application/ld+json', children: JSON.stringify(serviceSchema) }]
})
</script>
