export type Service = {
  slug: string
  title: string
  summary: string
  bullets: string[]
  schemaType?: 'Service' | 'HVACBusiness' | 'Contractor'
  metaDescription?: string
  keywords?: string[]
  content?: string
}

export const services: Service[] = [
  { slug: 'residential-electrical', title: 'Residential Electrical', summary: 'Wiring, lighting, and upgrades that keep your home safe and efficient.', bullets: [
    'Panel replacements and service upgrades',
    'Indoor and outdoor lighting installation',
    'Whole-home surge protection',
  ] },
  { slug: 'commercial-electrical', title: 'Commercial Electrical', summary: 'Reliable electrical contracting for offices, shops, and new construction.', bullets: [
    'Tenant improvements and build-outs',
    'LED retrofits and energy audits',
    'Preventive maintenance programs',
  ] },
  { slug: 'ev-charger-installation', title: 'EV Charger Installation', summary: 'Professional EV charging station installation for homes and workplaces.', bullets: [
    'Level 2 charger setup and wiring',
    'Panel evaluation and load balancing',
    'Permitting and inspection handled in-house',
  ] }
]
