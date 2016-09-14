From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v2 3/6] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Wed, 14 Sep 2016 23:30:06 +0200
Message-ID: <CAFBinCAJnhOSt8KHcPn4Wpc1DL6S3EUWViQxbsjw7Cv0TDNBPg@mail.gmail.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160911134111.31141-1-martin.blumenstingl@googlemail.com> <20160911134111.31141-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160911134111.31141-4-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 11, 2016 at 3:41 PM, Martin Blumenstingl
<martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> This is a new driver for the USB PHY found in Meson8b and GXBB SoCs.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/phy/Kconfig          |  11 ++
>  drivers/phy/Makefile         |   1 +
>  drivers/phy/phy-meson-usb2.c | 280 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 292 insertions(+)
>  create mode 100644 drivers/phy/phy-meson-usb2.c
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 19bff3a..6ad87ec 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -453,4 +453,15 @@ config PHY_NS2_PCIE
>         help
>           Enable this to support the Broadcom Northstar2 PCIe PHY.
>           If unsure, say N.
> +
> +config PHY_MESON_USB2
> +       tristate "Meson USB2 PHY driver"
> +       default ARCH_MESON
> +       depends on OF && (ARCH_MESON || COMPILE_TEST)
> +       select GENERIC_PHY
as pointed out by Arnd Bergmann (see [0]) this is missing a "select
USB_COMMON", just like the PHY_SUN4I_USB and PHY_SUN9I_USB drivers as
we use of_usb_get_dr_mode_by_phy() to get the mode of the USB
controller (as the PHY needs special configuration for host-mode).

I will send an update on Sunday.


Regards,
Martin


[0] http://marc.info/?l=linux-usb&m=147386117604824&w=2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
