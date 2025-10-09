<template>
    <!-- Services layout variant: staggered-showcase -->
    <section class="relative overflow-hidden bg-brand-light py-16 sm:py-20">
        <div class="absolute inset-0 pointer-events-none">
            <div class="absolute -top-20 left-1/2 h-64 w-64 -translate-x-1/2 rounded-full bg-brand-primary/18 blur-3xl"></div>
            <div class="absolute bottom-0 right-0 h-44 w-44 rounded-full bg-brand-primary-2/20 blur-2xl"></div>
        </div>

        <div class="relative section-boxed">
            <div class="grid gap-12 lg:grid-cols-[0.85fr,1.15fr] items-start">
                <div class="space-y-6">
                    <span class="chip text-brand-primary bg-white shadow-sm">
                        Electrical Services
                    </span>
                    <h2 class="text-3xl sm:text-4xl text-brand-dark">
                        Smart power solutions for every project.
                    </h2>
                    <p class="text-base text-brand-dark/80 leading-relaxed">
                        We wire, upgrade, and maintain properties across the east metro. Count on licensed technicians who keep projects tidy, code-compliant, and on schedule.
                    </p>
                    <div class="grid gap-4">
                        <NuxtLink to="/services" class="btn-primary w-fit">
                            View all services
                        </NuxtLink>
                        <NuxtLink to="/contact" class="btn-link">
                            Need an estimate? →
                        </NuxtLink>
                    </div>
                </div>

                <div class="space-y-6">
                    <article
                        v-for="(service, index) in featuredServices"
                        :key="service.slug"
                        class="card-box bg-white group transition hover:-translate-y-1"
                        :class="[
                            index === 0 ? 'border-l-[6px] border-brand-primary' : '',
                            index === 1 ? 'border-l-[6px] border-brand-accent' : '',
                            index === 2 ? 'border-l-[6px] border-brand-primary-2' : ''
                        ]"
                    >
                        <NuxtLink :to="`/services/${service.slug}`" class="flex flex-col gap-4">
                            <div class="flex items-center justify-between">
                                <h3 class="text-2xl text-brand-dark">
                                    {{ service.title }}
                                </h3>
                                <span class="btn-link text-xs">
                                    Explore
                                </span>
                            </div>
                            <p class="text-brand-dark/80 leading-relaxed">
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
                        </NuxtLink>
                    </article>
                </div>
            </div>
        </div>
    </section>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { services } from '~/data/services'

const featuredServices = computed(() => services.slice(0, 3))
</script>
