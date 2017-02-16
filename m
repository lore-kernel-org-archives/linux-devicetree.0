From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 00/11] ARM: Initial Actions Semi S500 and S900 enablement
Date: Thu, 16 Feb 2017 14:46:00 +0100
Message-ID: <3039198.1W6tLqk8Fp@wuerfel>
References: <20170215165528.10052-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170215165528.10052-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, info-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, contact-CO9UH4nLugWa1hIE42aguQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday, February 15, 2017 5:55:17 PM CET Andreas Färber wrote:
> Hello,
> 
> Based on earlier work of mine for the LeMaker Guitar, this series adds initial
> support for the Actions Semiconductor S500 (ARMv7) and S900 (ARMv8) SoCs.
> 
> Despite Actions Semi being a Linaro member since 2015, sadly I have not seen
> a single upstream kernel patch submission since. Nor has the XApple community
> taken any such initiative.
> 
> The GitHub LeMaker/linux-actions and xapp-le/kernel trees have 3.10 based S500
> drivers in arch/arm/mach-owl/, whereas the 96boards-bubblegum/linux tree has
> new-style but still 3.10 based S900 drivers. I also spotted GPLv2+ vs. GPLv2
> license differences.
> 
> This series therefore provides a proof of concept for a combined S500 and S900
> mainline implementation. Only earlycon serial output is available for now.
> 
> Focusing on Bubblegum-96, no S500 clocksource implementation is provided yet,
> thus output on Guitar is less than on Bubblegum-96, but still it demonstrates
> that a single driver can be shared for both, using compatible strings for
> future differentiation.

Thanks for getting this started! It's unfortunately too late for 4.11 now,
but there should be no problem getting this merged into arm-soc early on
after the coming merge window.

I'd suggest keeping it as a set of patches for the moment, and we'll apply
them to the respective arm-soc branches as needed, with the exception of
the tty patch that should go through Greg's tree.

When you have addressed the review comments, please send the updated series
to arm-DgEjT+Ai2yi4UlQgPVntAg@public.gmane.org

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
