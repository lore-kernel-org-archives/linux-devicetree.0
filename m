From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/5] improvements and fixes for the phy-meson-gxl-usb2
 driver
Date: Fri, 16 Feb 2018 17:51:54 +0530
Message-ID: <a2971b23-526a-a611-4f22-098e60e1fa74@ti.com>
References: <20180128202245.25021-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180128202245.25021-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Monday 29 January 2018 01:52 AM, Martin Blumenstingl wrote:
> This contains two fixes and two (minor) fixes for the phy-meson-gxl-usb2
> driver:
> - a clock and reset line is used for the PHYs. this was not clear from
>   the Amlogic GPL kernel sources since the clock is enabled very early
>   in the boot process (either because the hardware defaults to "on",
>   the bootrom enables it or a bootloader before BL3-3/u-boot enables it)
> - we don't read the controller's dr_mode anymore because the USB2 PHY
>   can only be switched into host mode if the USB3 PHY knows about it.
>   Thus auto-detecting the mode doesn't work for this PHY so it's removed
>   in patch #3
> - do not log an error message when the phy-supply is not ready yet and
>   we have to return -EPROBE_DEFER
> - improve the naming of some U2P_R2 test mode registers

merged, thanks!

-Kishon
> 
> 
> Martin Blumenstingl (5):
>   dt-bindings: phy: meson-gxl-usb2-phy: add the reset line and clock
>   phy: amlogic: phy-meson-gxl-usb2: support the clock and reset line
>   phy: amlogic: phy-meson-gxl-usb2: default to host mode
>   phy: amlogic: phy-meson-gxl-usb2: don't log an error on -EPROBE_DEFER
>   phy: amlogic: phy-meson-gxl-usb2: rename some of the U2P_R2 registers
> 
>  .../devicetree/bindings/phy/meson-gxl-usb2-phy.txt |  4 ++
>  drivers/phy/amlogic/Kconfig                        |  1 -
>  drivers/phy/amlogic/phy-meson-gxl-usb2.c           | 78 ++++++++++++++++------
>  3 files changed, 61 insertions(+), 22 deletions(-)
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
