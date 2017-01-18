From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: DTS: Fix broken GICv2 register maps
Date: Wed, 18 Jan 2017 13:07:30 +0000
Message-ID: <16613dbe-08b9-98d8-c747-a977e78601b1@arm.com>
References: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
 <2966702.djJyWhCMlK@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2966702.djJyWhCMlK@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tsahee Zidenberg <tsahee-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias
List-Id: devicetree@vger.kernel.org

On 18/01/17 12:34, Arnd Bergmann wrote:
> On Wednesday, January 18, 2017 10:53:29 AM CET Marc Zyngier wrote:
>> For a GICv2 (which happens to be virtualization capable), the
>> architecture mandates the following regions:
>>
>> 	     GICD: 4kB
>> 	     GICC: 8kB
>> 	     GICH: 8kB
>> 	     GICV: 8kB
>>
>> Unfortunately, I made a mistake in one of the examples contained in
>> the DT binding document, and everyone duplicated that same mistake all
>> over the map.
>>
>> This small series fixes the DT binding, and hopefully updates all the
>> offending DTs to be compliant with the architecture.
>>
> 
> Looks good to me, can you send this as a pull request to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
> once you have collected a reasonable number of Acks?

Sure, will do.

> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
