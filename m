From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add support for the USB3 PHY on
 Amlogic Meson GXL SoCs
Date: Thu, 5 Oct 2017 15:02:40 -0500
Message-ID: <20171005200240.bdxd4kupapkqlosh@rob-hp-laptop>
References: <20170924195000.13276-1-martin.blumenstingl@googlemail.com>
 <20170924195000.13276-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170924195000.13276-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 24, 2017 at 09:49:59PM +0200, Martin Blumenstingl wrote:
> Amlogic Meson GXL SoCs use a dwc3 controller with two (GXM - a variant
> for GXL, has three) USB2 ports. The first USB2 port supports host and
> peripheral (also called "device") mode.
> While the dwc3 controller has no USB3 port enabled we still need the
> USB3 PHY to be initialized, otherwise some boards (probably those where
> the bootloader does not initialize the USB3 PHY) show errors with
> high-speed USB devices connected to any of the USB2 ports.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
