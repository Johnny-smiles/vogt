<template>
    <div>
        <!-- Google Tag Manager -->
        <ClientOnly>
            <GoogleTagManager />
        </ClientOnly>

        <NavBar />
        <NuxtPage />
        <Footer />
    </div>
</template>

<script setup>
import NavBar from '~/components/NavBar.vue'
import Footer from '~/components/Footer.vue'
import GoogleTagManager from '~/components/GoogleTagManager.vue'

useHead({
  link: [
    { rel: 'icon', type: 'image/png', href: '/logo.png' }
  ]
})
</script>
