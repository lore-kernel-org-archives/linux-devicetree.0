From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 0/8] ARM: Conexant Digicolor CX92755 SoC support
Date: Thu, 08 Jan 2015 23:46:46 +0100
Message-ID: <5966468.GiJYdzCvnt@wuerfel>
References: <cover.1420744368.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1420744368.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 08 January 2015 21:39:56 Baruch Siach wrote:
> This series adds initial support for the Conexant CX92755 SoC. The CX92755 is
> one of the Digicolor series of SoCs, all sharing many of the same peripherals.
> The code was tested on the CX92755 evaluation kit, AKA Equinox.
> 
> Uses attempting to try this code will most likely also want the UART/console
> driver available from https://patchwork.kernel.org/patch/5515861/.
 
Looks great overall now.

I have just two more comments in one patch, and one general request:

Please add a patch description for every patch. The text above would
be a good start for the first patch, but it would be lost in the git
history if it's only in the cover letter.

other than that, feel free to add my

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Once there are no more review comments, please submit the first three
patches to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, and send the other patches as separate
series to the respective maintainers for irqchip and clocksource.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
