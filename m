From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Sun, 3 Aug 2014 19:59:27 +0200
Message-ID: <201408031959.27607.arnd@arndb.de>
References: <20140731192016.GA6869@excalibur.cnev.de> <20140803130430.GY3952@lukather>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140803130430.GY3952@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 03 August 2014, Maxime Ripard wrote:
> Thanks for reporting this.
> 
> From a quick grep, the issue is actually broader than just
> Allwinner. At least the following platforms seem to do the same:
>   - mvebu
>   - axm5516
>   - bcm
>   - berlin
>   - ea3250
>   - ecx-2000
>   - highbank
>   - imx / mxs
>   - lpc32xx
>   - phy3250
>   - picoxcell
>   - shmobile
>   - rockchip
>   - socfpga
>   - spear
>   - ste
>   - zynq
> 
> Would you mind sending a patch to fix all these?

I would actually prefer if we could migrate a lot of these files to BSD license,
provided the original authors agree. We want the dtb blobs to be embeddable into
boot loaders of any license.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
