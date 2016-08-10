From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: da850: Add basic DTS for the L138/C6748
 Dev Kit
Date: Wed, 10 Aug 2016 13:35:12 -0500
Message-ID: <20160810183512.GA10503@rob-hp-laptop>
References: <20160804144332.4841-1-kbeldan@baylibre.com>
 <20160805141229.20784-1-kbeldan@baylibre.com>
 <20160805141229.20784-2-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160805141229.20784-2-kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, karl.beldan+oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 05, 2016 at 02:12:27PM +0000, Karl Beldan wrote:
> The LCDK is the successor to the late Hawkboard.
> Among the differences are the flash (16bits vs 8bits) and some pins
> (MMC, LEDs, buttons, some external connectors), however the main
> components remain the same (eth. phy, audio codec, video decoder and
> DAC) except for the main PMIC, different and hard-wired on the LCDK (the
> LDOs and DCDCs are always on).
> A DT-only boot with this addition gives functional UART, reboot via
> watchdog, RTC, ethernet and MMC (I added the CD GPIO for the MMC
> although davinci_mmc doesn't call the OF facilities of mmc core).
> 
> Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
> Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/davinci.txt |  4 ++
>  arch/arm/boot/dts/Makefile                        |  1 +
>  arch/arm/boot/dts/da850-lcdk.dts                  | 70 +++++++++++++++++++++++
>  arch/arm/mach-davinci/da8xx-dt.c                  |  1 +
>  4 files changed, 76 insertions(+)
>  create mode 100644 arch/arm/boot/dts/da850-lcdk.dts

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
