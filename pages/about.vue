<template>
    <main>
        <section class="max-w-5xl mx-auto px-6 py-20">
            <h1 class="text-4xl md:text-5xl font-bold mb-8">About {{ siteConfig.siteName }}</h1>

            <p class="mb-4 text-lg leading-relaxed">
                {{ siteConfig.siteName }} is a family-run electrical contractor based in {{ siteConfig.location.city }}, {{ siteConfig.location.state }}. We believe clients deserve trustworthy advice, tidy workmanship, and wiring that performs flawlessly long after the inspection sticker is signed.
            </p>

            <p class="mb-4 leading-relaxed">
                Founder Matt Vogt built the company on straightforward communication and deep respect for the communities we serve. Our licensed electricians bring decades of combined experience across residential upgrades, tenant improvements, remodels, and fleet charging infrastructure. Every project starts with listening—understanding how you use your space, future-proofing for growth, and mapping the safest path to get there.
            </p>

            <p class="mb-6 leading-relaxed">
                We coordinate permitting, meet inspectors, and keep job sites clean so you can stay focused on daily life or running your business. From swapping out a worn breaker to redesigning a power distribution system, we show up prepared and finish when we say we will.
            </p>

            <div class="bg-white border border-brand-primary/20 rounded-2xl p-6 md:p-8 shadow-sm space-y-3">
                <h2 class="text-2xl font-semibold text-brand-dark">Core commitments</h2>
                <ul class="list-disc pl-6 space-y-2 text-brand-dark/80">
                    <li>Licensed, bonded, and insured electricians on every job.</li>
                    <li>Meticulous documentation and testing for code compliance.</li>
                    <li>Respect for your schedule, property, and budget.</li>
                </ul>
            </div>

            <p class="mt-8">
                Ready to talk through your project? <NuxtLink to="/contact" class="underline text-brand-primary">Reach out</NuxtLink> and the Vogt Electric team will line up a site visit.
            </p>
        </section>
    </main>
</template>

<script setup>
import { siteConfig } from '~/site.config'
</script>
