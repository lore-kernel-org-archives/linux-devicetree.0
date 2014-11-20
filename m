From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 2/8] dt-bindings: Document Broadcom Cygnus SoC and clocks
Date: Wed, 19 Nov 2014 17:05:34 -0800
Message-ID: <20141120010534.12298.10042@quantum>
References: <Scott Branden <sbranden@broadcom.com>
 <1414538111-11668-1-git-send-email-sbranden@broadcom.com>
 <1414538111-11668-3-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414538111-11668-3-git-send-email-sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>
Cc: JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Scott Branden (2014-10-28 16:15:05)
> From: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> 
> Reviewed-by: Arun Parameswaran <aparames-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Tested-by: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: JD (Jiandong) Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Acked-by: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  .../devicetree/bindings/arm/bcm/cygnus.txt         |   31 ++++++++++++++++++
>  .../devicetree/bindings/clock/bcm-cygnus-clock.txt |   34 ++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/cygnus.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/bcm-cygnus-clock.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/cygnus.txt b/Documentation/devicetree/bindings/arm/bcm/cygnus.txt
> new file mode 100644
> index 0000000..4c77169
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/bcm/cygnus.txt
> @@ -0,0 +1,31 @@
> +Broadcom Cygnus device tree bindings
> +------------------------------------
> +
> +
> +Boards with Cygnus SoCs shall have the following properties:
> +
> +Required root node property:
> +
> +BCM11300
> +compatible = "brcm,bcm11300", "brcm,cygnus";
> +
> +BCM11320
> +compatible = "brcm,bcm11320", "brcm,cygnus";
> +
> +BCM11350
> +compatible = "brcm,bcm11350", "brcm,cygnus";
> +
> +BCM11360
> +compatible = "brcm,bcm11360", "brcm,cygnus";
> +
> +BCM58300
> +compatible = "brcm,bcm58300", "brcm,cygnus";
> +
> +BCM58302
> +compatible = "brcm,bcm58302", "brcm,cygnus";
> +
> +BCM58303
> +compatible = "brcm,bcm58303", "brcm,cygnus";
> +
> +BCM58305
> +compatible = "brcm,bcm58305", "brcm,cygnus";
> diff --git a/Documentation/devicetree/bindings/clock/bcm-cygnus-clock.txt b/Documentation/devicetree/bindings/clock/bcm-cygnus-clock.txt
> new file mode 100644
> index 0000000..00d26ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/bcm-cygnus-clock.txt
> @@ -0,0 +1,34 @@
> +Broadcom Cygnus Clocks
> +
> +This binding uses the common clock binding:
> +Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Currently various "fixed" clocks are declared for peripheral drivers that use
> +the common clock framework to reference their core clocks. Proper support of
> +these clocks will be added later
> +
> +Device tree example:
> +
> +       clocks {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               osc: oscillator {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <1>;
> +                       clock-frequency = <25000000>;
> +               };
> +
> +               apb_clk: apb_clk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <1000000000>;
> +               };
> +
> +               periph_clk: periph_clk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <500000000>;
> +               };
> +       };
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
