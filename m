From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dts: bcm283x: Reserve first page for firmware
Date: Sun, 14 May 2017 14:50:07 +0200
Message-ID: <bb27bf8d-497e-6d1d-40da-828b04032eb4@suse.de>
References: <b6aef857-1454-7931-2c60-6d7b55b7a0a8@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b6aef857-1454-7931-2c60-6d7b55b7a0a8-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 09.05.2017 um 11:04 schrieb Phil Elwell:
> The Raspberry Pi startup stub files for multi-core BCM27XX processors

Curiously, while this V2 was rebased to apply against the bcm283x rather
than bcm2710 file, it changed the text from BCM283X to BCM27XX.

> make the secondary CPUs spin until the corresponding mailbox is
> written. These stubs are loaded at physical address 0x00000xxx (as seen
> by the ARMs), but this page will be reused by the kernel unless it is
> explicitly reserved, causing the waiting cores to execute random code.
> 
> Use the /memreserve/ Device Tree directive to mark the first page as
> off-limits to the kernel.
> 
> See: https://github.com/raspberrypi/linux/issues/1989
> 
> Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
> ---
> 
> Changes in V2:
> - Rebase against linux-next
> - Drop downstream-only patch
> 
>  arch/arm/boot/dts/bcm283x.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

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
