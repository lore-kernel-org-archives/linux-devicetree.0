From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ARM-i.MX6Q-dts : Added USB_OTG Support
Date: Fri, 24 Jan 2014 15:34:08 +0000
Message-ID: <20140124153407.GA4758@e106331-lin.cambridge.arm.com>
References: <1390555724-9779-1-git-send-email-ashutosh.s@phytec.in>
 <20140124115005.GG814@e106331-lin.cambridge.arm.com>
 <CAOMZO5B=2mYWeoj1snSMpDzxHK8H3_DKevuaA4T4bXiV=64vkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5B=2mYWeoj1snSMpDzxHK8H3_DKevuaA4T4bXiV=64vkg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Ashutosh singh <ashuleapyear@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Ashutosh singh <ashutosh.s@phytec.in>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 24, 2014 at 12:15:08PM +0000, Fabio Estevam wrote:
> Hi Mark,
> 
> On Fri, Jan 24, 2014 at 9:50 AM, Mark Rutland <mark.rutland@arm.com> wrote:
> 
> >> +
> >> +     regulators {
> >> +             compatible = "simple-bus";
> >
> > This is _not_ a simple bus. It doesn't have the required ranges
> > property.
> >
> > Why do these need to be in a regulators container node? We don't group
> > dma controllers under a dmas node, or uarts under a uarts node.
> 
> It seems we have this same issue on several imx6 dts files.
> 
> Would the below address your suggestion?

The below patch looks good to me.

In general there seems to be a misunderstanding of the purpose of
simple-bus, as an annotation that children of a node should be probed,
rather than as a representation of a simple bus (which is of the same
type as the parent-bus, which requires no programming, where children
can be used without knowledge of the simple-bus).

There seem to be a lot of cases where simple-bus is used as a fallback
compatible string, when in reality the node's children make no sense
without information from and/or programming of the node with the
simple-bus property. Those cases are completely wrong, and a complete
abuse of simple-bus.

There are other cases where simple-bus nodes are used to group nodes
from a commonly reused block. As long as these have the requisite
ranges, #address-cells, and #size-cells, then they are valid, and make
sense for translating / widening addresses for common groups of
peripherals even if they're not on a different physical bus.

I don't see the point in grouping together nodes in an artificial
container because of their functionality rather than their topology, it
seems to breed confusion. 

Cheers,
Mark.

> 
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-
> index e75e11b..ba35560 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -15,33 +15,29 @@
>                 reg = <0x10000000 0x40000000>;
>         };
> 
> -       regulators {
> -               compatible = "simple-bus";
> -
> -               reg_usb_otg_vbus: usb_otg_vbus {
> -                       compatible = "regulator-fixed";
> -                       regulator-name = "usb_otg_vbus";
> -                       regulator-min-microvolt = <5000000>;
> -                       regulator-max-microvolt = <5000000>;
> -                       gpio = <&gpio3 22 0>;
> -                       enable-active-high;
> -               };
> +       reg_usb_otg_vbus: regulator@0 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usb_otg_vbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               gpio = <&gpio3 22 0>;
> +               enable-active-high;
> +       };
> 
> -               reg_usb_h1_vbus: usb_h1_vbus {
> -                       compatible = "regulator-fixed";
> -                       regulator-name = "usb_h1_vbus";
> -                       regulator-min-microvolt = <5000000>;
> -                       regulator-max-microvolt = <5000000>;
> -                       gpio = <&gpio1 29 0>;
> -                       enable-active-high;
> -               };
> +       reg_usb_h1_vbus: regulator@1 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usb_h1_vbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               gpio = <&gpio1 29 0>;
> +               enable-active-high;
> +       };
> 
> -               reg_audio: wm8962_supply {
> -                       compatible = "regulator-fixed";
> -                       regulator-name = "wm8962-supply";
> -                       gpio = <&gpio4 10 0>;
> -                       enable-active-high;
> -               };
> +       reg_audio: regulator@2 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "wm8962-supply";
> +               gpio = <&gpio4 10 0>;
> +               enable-active-high;
>         };
> 
>         gpio-keys {
> 
> If so, I will prepare some patches to update other dts files.
> 
> Thanks,
> 
> Fabio Estevam
> 
