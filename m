From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] irqchip: add support for Sigma Designs SMP86xx interrupt controller
Date: Fri, 20 Nov 2015 12:15:06 +0000
Message-ID: <yw1x7flceuk5.fsf@unicorn.mansr.com>
References: <1447958026-3015-1-git-send-email-mans@mansr.com>
	<1447958026-3015-3-git-send-email-mans@mansr.com>
	<564F0BFD.3090703@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <564F0BFD.3090703-GANU6spQydw@public.gmane.org> (Mason's message of "Fri, 20 Nov 2015
	13:03:09 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Mason <slash.tmp-GANU6spQydw@public.gmane.org> writes:

> On 19/11/2015 19:33, Mans Rullgard wrote:
>
>> This adds support for the secondary interrupt controller used in Sig=
ma
>> Designs SMP86xx and SMP87xx chips.
>>=20
>> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/irqchip/Kconfig      |   5 +
>>  drivers/irqchip/Makefile     |   1 +
>>  drivers/irqchip/irq-tangox.c | 232 ++++++++++++++++++++++++++++++++=
+++++++++++
>>  3 files changed, 238 insertions(+)
>>  create mode 100644 drivers/irqchip/irq-tangox.c
>>=20
>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>> index 4d7294e..baf3345 100644
>> --- a/drivers/irqchip/Kconfig
>> +++ b/drivers/irqchip/Kconfig
>> @@ -193,3 +193,8 @@ config IRQ_MXS
>>  	def_bool y if MACH_ASM9260 || ARCH_MXS
>>  	select IRQ_DOMAIN
>>  	select STMP_DEVICE
>> +
>> +config TANGOX_IRQ
>
> Question: Kevin Hilman said I should use tango instead of tangox
> for the arch directory. Does that advice extend to Kconfig names?

I suppose the same logic applies to all names.

--=20
M=E5ns Rullg=E5rd
mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
