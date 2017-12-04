From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 11/12] ARM: dts: imx6qdl-nitrogen6_max: Remove unneeded
 unit address
Date: Mon, 4 Dec 2017 09:28:08 -0200
Message-ID: <CAOMZO5C77f9mQQWJ5GJH3J+cj4Fxu3H-3yQYeFNDxm3xfpe8Gw@mail.gmail.com>
References: <1512156285-18451-1-git-send-email-festevam@gmail.com>
 <1512156285-18451-11-git-send-email-festevam@gmail.com> <20171204111954.v7jexbtkjyaa6mhe@t450s.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171204111954.v7jexbtkjyaa6mhe-gtbVdJvtf7D/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gary,

On Mon, Dec 4, 2017 at 9:19 AM, Gary Bisson
<gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:

> What about naming it i2c2mux and i2c3mux so it is clearer those mux
> happen respectively for i2c2 and i2c3?
>
> Then I'd rename the sub-nodes i2cXmux@Y instead of i2cX@Y currently.
>
> Let me know your thoughts.

Is this what you suggest?

--- a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
@@ -172,7 +172,7 @@
                };
        };

-       i2cmux@2 {
+       i2c2mux {
                compatible = "i2c-mux-gpio";
                pinctrl-names = "default";
                pinctrl-0 = <&pinctrl_i2c2mux>;
@@ -183,20 +183,20 @@
                i2c-parent = <&i2c2>;
                idle-state = <0>;

-               i2c2@1 {
+               i2c2mux@1 {
                        reg = <1>;
                        #address-cells = <1>;
                        #size-cells = <0>;
                };

-               i2c2@2 {
+               i2c2mux@2 {
                        reg = <2>;
                        #address-cells = <1>;
                        #size-cells = <0>;
                };
        };

-       i2cmux@3 {
+       i2c3mux {
                compatible = "i2c-mux-gpio";
                pinctrl-names = "default";
                pinctrl-0 = <&pinctrl_i2c3mux>;
@@ -206,7 +206,7 @@
                i2c-parent = <&i2c3>;
                idle-state = <0>;

-               i2c3@1 {
+               i2c3mux@1 {
                        reg = <1>;
                        #address-cells = <1>;
                        #size-cells = <0>;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
