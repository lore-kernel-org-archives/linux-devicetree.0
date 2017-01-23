From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v2 0/9] ARM: dts: support I2SE Duckbill devices
Date: Mon, 23 Jan 2017 18:05:04 +0100
Message-ID: <2d2cf6f5-f264-7744-a5ec-35c47d58e39f@i2se.com>
References: <1485123764-14754-1-git-send-email-mhei@heimpold.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485123764-14754-1-git-send-email-mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, fabio.estevam-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 22.01.2017 um 23:22 schrieb Michael Heimpold:
> This series updates/adds Device Tree support for I2SE's Duckbill
> device family.
>
> The Duckbill devices are small, pen-drive sized boards based on
> NXP's i.MX28 SoC. While the initial variants (Duckbill series) were
> equipped with a micro SD card slot only, the latest generation
> (Duckbill 2 series) have an additional internal eMMC onboard.
>
> Both device generations consists of four "family members":
>
> - Duckbill/Duckbill 2: generic board, intended to be used as
>   baseboard for custom designs and/or as development board
>
> - Duckbill EnOcean/Duckbill 2 EnOcean: come with an EnOcean
>   daugther board equipped with the popular TCM310 module
>
> - Duckbill 485/Duckbill 2 485: as the name implies, these
>   devices are intended to be used as Ethernet - RS485 converters
>
> - Duckbill SPI/Duckbill 2 SPI: not sold separately, but used
>   in I2SE's development kits for Green PHY HomePlug Powerline
>   communication
>
> Because the Duckbill series is EOL, this patch series only adds
> support for the latest Duckbill 2 series devices. However,
> support for the generic Duckbill board was already mainline,
> so update it to match vendor tree DT.

Acked-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>

for patches 1,2,3,5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
