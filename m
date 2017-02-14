From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM64: dts: Prepare Realtek RTD1295 and Zidoo X9S
Date: Tue, 14 Feb 2017 05:56:44 +0100
Message-ID: <0970cfc6-24e1-b290-87f1-02e9911e6405@suse.de>
References: <20170214033440.18667-1-afaerber@suse.de>
 <20170214033440.18667-5-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170214033440.18667-5-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, service-qoVzM6YEWSw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 14.02.2017 um 04:34 schrieb Andreas Färber:
> A list of memory reservations is adopted from v1.2.11 vendor device tree:
> 0x02200000 can be used for an initrd, 0x01b00000 is audio-related;
> ion-related 0x02600000, 0x02c00000 and 0x11000000 are left out; others
> remain to be investigated.
[...]
> diff --git a/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts b/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts
> new file mode 100644
> index 0000000..a86c97a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts
[...]
> +/memreserve/	0x0000000000000000 0x0000000000030000;
> +/memreserve/	0x000000000001f000 0x0000000000001000;
> +/memreserve/	0x0000000000030000 0x00000000000d0000;
> +/memreserve/	0x0000000001b00000 0x00000000004be000;
> +/memreserve/	0x0000000001ffe000 0x0000000000004000;

> +/memreserve/	0x0000000010000000 0x0000000000014000;
[snip]

This region appears to be used for exporting/importing the U-Boot
environment between AArch32 and AArch64, thus could be dropped here.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
