From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] phy: amlogic: add USB3 PHY support for Meson GXL and
 GXM
Date: Tue, 7 Nov 2017 11:23:18 +0530
Message-ID: <463fae8a-4b6d-1111-7ac2-1d3f1f31b9b1@ti.com>
References: <20170924195000.13276-1-martin.blumenstingl@googlemail.com>
 <20170924195000.13276-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170924195000.13276-3-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 25 September 2017 01:20 AM, Martin Blumenstingl wrote:
> This adds a new driver for the USB3 PHY found on Meson GXL and GXM SoCs
> (both SoCs are using the same USB PHY register layout).
> 
> Unfortunately there is no documentation for this PHY in the public S905X
> datasheet (published for example by Khadas). What we know so far about
> this PHY:
> - even though the Meson GXL and GXM SoCs do not expose an USB3 port (the
>   dwc3 controller only has USB2 ports enabled) we need to initialize the
>   USB3 PHY (specifically USB_R1_U3H_FLADJ_30MHZ_REG_MASK). Without this
>   initialization high-speed USB devices (especially USB hard disks and
>   thumb drives, slower devices like mice do not seem to be affected)
> - it is responsible for the OTG detection and for switching the first
>   USB2 PHY between host and peripheral (aka device) mode. an interrupt
>   can be used to detect changes between host and device mode.
> 
> The whole OTG detection logic is currently not implemented.

Is this an independent instance of the phy? The programming model looks similar
to phy-meson-gxl-usb2.c..

I'm just thinking if we should have only a phy-meson-gxl-usb.c and have both
usb2 and usb3 phy programming there?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
