From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add support for the USB3 PHY on
 Amlogic Meson GXL SoCs
Date: Mon, 29 Jan 2018 10:08:29 -0600
Message-ID: <20180129160829.aufpw7cyfbiu3yly@rob-hp-laptop>
References: <20180128201554.23889-1-martin.blumenstingl@googlemail.com>
 <20180128201554.23889-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180128201554.23889-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 28, 2018 at 09:15:53PM +0100, Martin Blumenstingl wrote:
> Amlogic Meson GXL SoCs use a dwc3 controller with two (GXM - a variant
> for GXL, has three) USB2 ports. The first USB2 port supports host and
> peripheral (also called "device") mode.
> While the dwc3 controller has no USB3 port enabled we still need the
> USB3 PHY to be initialized. Otherwise high-speed USB transfers (for
> example with a USB flash drive) may time out (most often seen on boards
> with mainline u-boot, where the bootloader does not initialize the USB3
> PHY registers).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
