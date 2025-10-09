<template>
    <main class="bg-brand-light min-h-screen">
        <section class="bg-brand-gradient text-white py-16 sm:py-20">
            <div class="section-boxed text-center space-y-4">
                <h1 class="text-4xl sm:text-5xl">
                    Electrical services built for safe, efficient power.
                </h1>
                <p class="max-w-3xl mx-auto text-white/85">
                    From residential upgrades to commercial retrofits, Vogt Electric delivers licensed craftsmanship, tidy job sites, and solutions that keep your property powered for the long haul.
                </p>
            </div>
        </section>

        <section class="section-boxed py-16 sm:py-20">
            <div class="grid gap-8 lg:grid-cols-3">
                <article
                    v-for="service in services"
                    :key="service.slug"
                    class="card-box bg-white flex flex-col justify-between"
                >
                    <div class="space-y-4">
                        <h2 class="text-2xl text-brand-dark">
                            {{ service.title }}
                        </h2>
                        <p class="text-brand-dark/75 leading-relaxed">
                            {{ service.summary }}
                        </p>
                        <ul class="space-y-2 text-sm text-brand-dark/70">
                            <li
                                v-for="bullet in service.bullets"
                                :key="bullet"
                                class="flex gap-2"
                            >
                                <span class="text-brand-primary">▹</span>
                                <span>{{ bullet }}</span>
                            </li>
                        </ul>
                    </div>
                    <NuxtLink :to="`/services/${service.slug}`" class="btn-primary mt-6 w-full justify-center">
                        View {{ service.title }}
                    </NuxtLink>
                </article>
            </div>
        </section>

        <section class="bg-white py-16 sm:py-20">
            <div class="section-boxed grid gap-8 lg:grid-cols-[1.1fr,0.9fr] items-center">
                <div class="space-y-4">
                    <h2 class="text-3xl sm:text-4xl text-brand-dark">
                        Need a custom electrical plan?
                    </h2>
                    <p class="text-brand-dark/75 leading-relaxed">
                        We collaborate with homeowners, business owners, and general contractors to design, engineer, and install systems that meet code and budget. Bring us into your project early for faster approvals and smoother inspections.
                    </p>
                </div>
                <div class="card-box bg-brand-primary text-white space-y-4">
                    <p class="uppercase tracking-[0.35em] text-xs text-white/70">
                        Start your project
                    </p>
                    <p class="text-lg">
                        Call <a :href="`tel:${siteConfig.phone}`" class="underline hover:text-brand-light">{{ siteConfig.phoneDisplay || siteConfig.phone }}</a> or send your plans and we’ll line up a walkthrough.
                    </p>
                    <div class="flex flex-wrap gap-3">
                        <a :href="`tel:${siteConfig.phone}`" class="btn-accent bg-white text-brand-dark">
                            Call now
                        </a>
                        <NuxtLink to="/contact" class="btn-outline">
                            Request a quote
                        </NuxtLink>
                    </div>
                </div>
            </div>
        </section>
    </main>
</template>

<script setup lang="ts">
import { useHead } from '#imports'
import { services } from '~/data/services'
import { siteConfig } from '~/site.config'

useHead({
    title: `Services | ${siteConfig.siteName}`,
    meta: [
        {
            name: 'description',
            content: 'Explore residential electrical, commercial electrical, and EV charger installation services from Vogt Electric in Oakdale, MN.'
        }
    ]
})
</script>
