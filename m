From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: Add pinctrl bindings for mt65xx/mt81xx.
Date: Fri, 28 Nov 2014 17:12:44 +0100
Message-ID: <CACRpkdbMdJT6y-NL36RgQe0-CAFAVGqKiwY9+yFcwA7JDLmA+Q@mail.gmail.com>
References: <1415709535-31515-1-git-send-email-hongzhou.yang@mediatek.com>
	<1415709535-31515-3-git-send-email-hongzhou.yang@mediatek.com>
	<CACRpkdYSe_BH_qiHma2BA+c2otEi3wd0TBXy83t8vwrNL+3U2g@mail.gmail.com>
	<20141127101830.GP30369@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141127101830.GP30369-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, alan.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, toby.liu@med
List-Id: devicetree@vger.kernel.org

On Thu, Nov 27, 2014 at 11:18 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Thu, Nov 27, 2014 at 09:44:42AM +0100, Linus Walleij wrote:
>> On Tue, Nov 11, 2014 at 1:38 PM, Hongzhou Yang
>> <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

>> > +- mediatek,pins: 2 integers array, represents gpio pinmux number and config
>> > +  setting. The format as following
>> > +
>> > +    node {
>> > +     mediatek,pins = <PIN_NUMBER_PINMUX>;
>> > +                     GENERIC_PINCONFIG;
>> > +    };
>>
>> As suggested by Sacha, use just "pins" and define the binding as a patch
>> to Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> that is generic for multiplexing, so we get some order here.
>>
>> I want you however to put pin multiplexing and pin configuration into
>> different nodes if possible. I don't like combines muxing and config
>> nodes. If necessary tag the node with something.
>
> Why? I think the properties can live happily together, even when the
> parsing functions go to the pinctrl core.

I'm worried about the semantic ambiguity between the pins = <...>;
property on different pin controllers, whether they are based on
function+group or per-pin. It's not even up to me to decide,
this is for the DT binding people.

In this case:

pins = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
          <MT8135_PIN_101_SCL0__FUNC_SCL0>;

Each element is a 32bit unsigned where the lower and higher
16 bits have different meanings.

In some other pin controller (using generic bindings and
already merged! arch/arm/boot/dts/ste-href-ab8500.dtsi):

gpio39 {
      gpio39_default_mode: gpio39_default {
             default_mux {
                      function = "gpio";
                      groups = "gpio39_a_1";
             };
             default_cfg {
                      pins = "GPIO39_E16";
                      input-enable;
                      bias-pull-down;
             };
     };
};

Can we get away with using the same core parser with this
as well, here the nodes are split and using strings to identify
pins, not 32bit numbers.

I am worried about semantic coexistance...

>> > +               i2c0_pins_a: i2c0@0 {
>> > +                       pins1 {
>> > +                               mediatek,pins = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
>> > +                                               <MT8135_PIN_101_SCL0__FUNC_SCL0>;
>> > +                               bias-disable;
>> > +                       };
>> > +               };
>>
>> I would split it up.
>>
>> i2c0_pins_a: i2c0@0 {
>>         pins1 {
>>                 pins = <MT8135_PIN_100_SDA0>;
>>                 function = <MT8135_PIN_100_FUNC_SDA0>;
>>         };
>
> The reason to put this in a single define was to make writing the device
> trees less error prone. When you have two arrays you must correlate the
> entries.

I see the upside. I'm just worried about ambiguity when comparing
different device trees to each other, because they should be about
readability and understanding, not confusing...

>> One node for the multiplexing, one node for the config. This is the
>> pattern used by most drivers, so I want to have this structure.
>>
>> It is also easy to tell one node from the other: if it contains "function"
>> we know it's a multiplexing node, if it doesn't, it's a config node.
>
> So when merging these together a node is always multiplexing and
> configuration. But do we really win anything if both are separated? When
> both are separated you still need an array of pins in the nodes to
> tell which pins this node is for. If this array also contains the
> mux information then this won't hurt. You can still ignore it.

Well we definately have to support the case with split config and
muxing nodes at least. I am very worried that we would get into
ambguities where that is not possible.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
