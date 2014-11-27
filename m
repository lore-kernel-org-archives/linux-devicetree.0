From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: Add pinctrl bindings for
 mt65xx/mt81xx.
Date: Thu, 27 Nov 2014 11:18:30 +0100
Message-ID: <20141127101830.GP30369@pengutronix.de>
References: <1415709535-31515-1-git-send-email-hongzhou.yang@mediatek.com>
 <1415709535-31515-3-git-send-email-hongzhou.yang@mediatek.com>
 <CACRpkdYSe_BH_qiHma2BA+c2otEi3wd0TBXy83t8vwrNL+3U2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYSe_BH_qiHma2BA+c2otEi3wd0TBXy83t8vwrNL+3U2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Heiko =?iso-8859-15?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 27, 2014 at 09:44:42AM +0100, Linus Walleij wrote:
> On Tue, Nov 11, 2014 at 1:38 PM, Hongzhou Yang
> <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> 
> > +* Mediatek MT65XX Pin Controller
> > +
> > +The Mediatek's Pin controller is used to control GPIO pins.
> 
> It's not GPIO pins, since they are not always general purpose. It's just
> pins. Say "control SoC pins".
> 
> > +Required properties:
> > +- compatible: value should be either of the following.
> > +    (a) "mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.
> > +- mediatek,pctl-regmap: Should be a phandle of the syscfg node.
> > +- gpio-controller : Marks the device node as a gpio controller.
> > +- #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO
> > +  binding is used, the amount of cells must be specified as 2. See the below
> > +  mentioned gpio binding representation for description of particular cells.
> > +
> > +       Eg: <&pio 6 0>
> > +       <[phandle of the gpio controller node]
> > +       [pin number within the gpio controller]
> 
> It's not a pin number really, it is a GPIO offset. But incidentally it's
> the same as the pin number. (This is OK...)
> 
> > +- mediatek,pins: 2 integers array, represents gpio pinmux number and config
> > +  setting. The format as following
> > +
> > +    node {
> > +     mediatek,pins = <PIN_NUMBER_PINMUX>;
> > +                     GENERIC_PINCONFIG;
> > +    };
> 
> As suggested by Sacha, use just "pins" and define the binding as a patch
> to Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> that is generic for multiplexing, so we get some order here.
> 
> I want you however to put pin multiplexing and pin configuration into
> different nodes if possible. I don't like combines muxing and config
> nodes. If necessary tag the node with something.

Why? I think the properties can live happily together, even when the
parsing functions go to the pinctrl core.

> In the end we can also move the parsing functions to the pinctrl core, as
> long as the bindings are correct (possibly as a refactoring later).



> 
> > +               i2c0_pins_a: i2c0@0 {
> > +                       pins1 {
> > +                               mediatek,pins = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
> > +                                               <MT8135_PIN_101_SCL0__FUNC_SCL0>;
> > +                               bias-disable;
> > +                       };
> > +               };
> 
> I would split it up.
> 
> i2c0_pins_a: i2c0@0 {
>         pins1 {
>                 pins = <MT8135_PIN_100_SDA0>;
>                 function = <MT8135_PIN_100_FUNC_SDA0>;
>         };

The reason to put this in a single define was to make writing the device
trees less error prone. When you have two arrays you must correlate the
entries.

>         pins2 {
>                pins = <MT8135_PIN_100_SDA0>;
>                bias-disable;
>         };

Here we repeat what we've already written above just to add the pinctrl.

Let's have a look at a real world example, here a eMMC controller node
from the i.MX6 riotboard converted to generic pinconf, first your
suggestion, then mine:

emmc_pins: emmc@0 {
	pins1 {
		pins = <MX6QDL_PAD_SD3_CMD
			MX6QDL_PAD_SD3_CLK
			MX6QDL_PAD_SD3_DAT0
			MX6QDL_PAD_SD3_DAT1
			MX6QDL_PAD_SD3_DAT2
			MX6QDL_PAD_SD3_DAT3
			MX6QDL_PAD_SD3_DAT4
			MX6QDL_PAD_SD3_DAT5
			MX6QDL_PAD_SD3_DAT6
			MX6QDL_PAD_SD3_DAT7>;
		function = <MX6QDL_PAD_SD3_CMD__SD3_CMD
			MX6QDL_PAD_SD3_CLK__SD3_CLK
			MX6QDL_PAD_SD3_DAT0__SD3_DATA0
			MX6QDL_PAD_SD3_DAT1__SD3_DATA1
			MX6QDL_PAD_SD3_DAT2__SD3_DATA2
			MX6QDL_PAD_SD3_DAT3__SD3_DATA3
			MX6QDL_PAD_SD3_DAT4__SD3_DATA4
			MX6QDL_PAD_SD3_DAT5__SD3_DATA5
			MX6QDL_PAD_SD3_DAT6__SD3_DATA6
			MX6QDL_PAD_SD3_DAT7__SD3_DATA7>;
	};

	pins2 {
		pins = <MX6QDL_PAD_SD3_CLK>;
		drive-strength = <87>; /* in OHM */
	};

	pins3 {
		pins = <MX6QDL_PAD_SD3_CMD
			MX6QDL_PAD_SD3_DAT0
			MX6QDL_PAD_SD3_DAT1
			MX6QDL_PAD_SD3_DAT2
			MX6QDL_PAD_SD3_DAT3
			MX6QDL_PAD_SD3_DAT4
			MX6QDL_PAD_SD3_DAT5
			MX6QDL_PAD_SD3_DAT6
			MX6QDL_PAD_SD3_DAT7
		>;
		drive-strength = <87>; /* in OHM */
		bias-pull-up = <47000>;
	};
};

emmc_pins: emmc@0 {
	pins1 {
		pins = <MX6QDL_PAD_SD3_CMD__SD3_CMD
			MX6QDL_PAD_SD3_DAT0__SD3_DATA0
			MX6QDL_PAD_SD3_DAT1__SD3_DATA1
			MX6QDL_PAD_SD3_DAT2__SD3_DATA2
			MX6QDL_PAD_SD3_DAT3__SD3_DATA3
			MX6QDL_PAD_SD3_DAT4__SD3_DATA4
			MX6QDL_PAD_SD3_DAT5__SD3_DATA5
			MX6QDL_PAD_SD3_DAT6__SD3_DATA6
			MX6QDL_PAD_SD3_DAT7__SD3_DATA7>;
		drive-strength = <87>; /* in OHM */
		bias-pull-up = <47000>;
	};

	pins2 {
		pins = <MX6QDL_PAD_SD3_CLK__SD3_CLK>;
		drive-strength = <87>; /* in OHM */
	};
};

So this is not even half as big. Also it provides less opportunities for
introducing bugs like: Do all pins have a valid configuration setting?
Do the pins/function arrays have both the same number of entries and do
the entries in both arrays match?

> 
> One node for the multiplexing, one node for the config. This is the
> pattern used by most drivers, so I want to have this structure.
> 
> It is also easy to tell one node from the other: if it contains "function"
> we know it's a multiplexing node, if it doesn't, it's a config node.

So when merging these together a node is always multiplexing and
configuration. But do we really win anything if both are separated? When
both are separated you still need an array of pins in the nodes to
tell which pins this node is for. If this array also contains the
mux information then this won't hurt. You can still ignore it.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
