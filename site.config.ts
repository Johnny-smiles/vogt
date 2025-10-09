// site.config.ts
export type BusinessType = 'LocalBusiness' | 'HVACBusiness' | 'AutoRepair'

export const siteConfig = {
    siteName: "Vogt Electric",
    siteUrl: 'https://www.vogtelectric.com',

    // Contact
    phone: '+1-651-470-9491',
    phoneDisplay: '(651) 470-9491',
    email: 'info@vogtelectric.com',

    // Location
    location: {
        street: '2950 Ideal Ave S',
        city: 'Oakdale',
        state: 'MN',
        zip: '55128',
        country: 'US',
        latitude: '',
        longitude: ''
    },

    // Business meta
    description: 'Vogt Electric is a locally owned electrical contractor serving homeowners and businesses across the Twin Cities. From panel upgrades to lighting and EV charger installations, we deliver safe, reliable, and efficient electrical solutions.',
    hours: 'Mo–Fr 07:00–17:00',
    businessType: 'LocalBusiness',

    // Assets
    socialImage: '/og-image.jpg',
    favicon: '/favicon.png',

    // Theme
    theme: {
        primaryColor: '#4A592E',
        secondaryColor: '#F8F8F8',
        accentColor: '#6B6B6B',
        fontFamily: "'Russo One','Inter',sans-serif",
        borderRadius: '24px'
    },

    // Hero copy (consumed by HeroSection.vue)
    hero: {
        eyebrow: 'Licensed • Bonded • Insured',
        headline: 'Reliable electrical upgrades for Oakdale properties',
        subheadline: 'Panel, lighting, and EV installs handled tidily with up-front guidance.',
        ctaPrimaryLabel: 'Call (651) 470-9491',
        ctaSecondaryLabel: 'Schedule service',
        ctaBandLabel: 'Explore services'
    },

    // Services summary
    services: [
        {
            title: 'Residential Electrical',
            blurb: 'Upgrades, troubleshooting, and lighting that keep your home safe.',
            bullets: [
                'Panel replacements and capacity planning',
                'Interior, exterior, and landscape lighting design',
                'Whole-home surge and safety upgrades'
            ]
        },
        {
            title: 'Commercial Electrical',
            blurb: 'Reliable contracting for tenant improvements and light industrial work.',
            bullets: [
                'Build-outs, retrofits, and code corrections',
                'Lighting upgrades and energy management',
                'Maintenance plans that prevent downtime'
            ]
        },
        {
            title: 'EV Charger Installation',
            blurb: 'Level 2 charging stations for homes, fleets, and workplaces.',
            bullets: [
                'Load calculations and permitting handled in-house',
                'Wallbox, ChargePoint, and manufacturer integrations',
                'Post-install testing and walk-through training'
            ]
        }
    ],

    // Why choose us
    valueProps: [
        { title: 'Code-Perfect Work', text: 'Projects documented and inspected so every upgrade meets Minnesota code.' },
        { title: 'Respectful Scheduling', text: 'We arrive when promised and keep job sites neat from start to finish.' },
        { title: 'Transparent Pricing', text: 'Clear options and pricing before we pull a wire or open a panel.' }
    ],

    // Reviews (short social proof)
    reviews: [
        { name: 'Jessica L.', text: 'Vogt Electric rewired our kitchen remodel, coordinated inspections, and left the space spotless.' },
        { name: 'Marcus T.', text: 'Their crew upgraded our service panel and EV charger in one day with zero surprises.' },
        { name: 'Trina P.', text: 'Great communication and tidy work on our shop lighting retrofit. Highly recommend.' }
    ],

    // FAQs surfaced on the homepage
    faqs: [
        {
            q: 'Do you handle small repair calls?',
            a: 'Yes. We help with tripped breakers, faulty outlets, and minor troubleshooting for homes and businesses.'
        },
        {
            q: 'Can you work with my general contractor?',
            a: 'Absolutely. We coordinate schedules, permitting, and inspections to keep renovations moving.'
        },
        {
            q: 'Do you install customer-supplied fixtures?',
            a: 'We can install fixtures you provide once we verify compatibility and safety requirements.'
        },
        {
            q: 'What areas do you serve?',
            a: 'We handle projects across Oakdale, Woodbury, Maplewood, Stillwater, and the east side of St Paul.'
        }
    ],

    // Service areas
    serviceAreas: ['Oakdale', 'Woodbury', 'Maplewood', 'Stillwater', 'St Paul'],

    // Social links
    social: {
        website: 'https://www.vogtelectric.com',
        gbp: 'https://www.google.com/maps/place/Vogt+Electric/@44.981,-92.974',
        facebook: 'https://www.facebook.com/VogtElectricLLC',
        nextdoor: 'https://nextdoor.com/pages/vogt-electric-llc-woodbury-mn/',
        instagram: '',
        yelp: ''
    }
}
