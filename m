From: hongzhou yang <hongzhou.yang@mediatek.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: Add pinctrl bindings for
 mt65xx/mt81xx.
Date: Fri, 28 Nov 2014 12:19:13 +0800
Message-ID: <1417148353.25975.2.camel@mhfsdcap03>
References: <1415709535-31515-1-git-send-email-hongzhou.yang@mediatek.com>
 <1415709535-31515-3-git-send-email-hongzhou.yang@mediatek.com>
 <CACRpkdYSe_BH_qiHma2BA+c2otEi3wd0TBXy83t8vwrNL+3U2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYSe_BH_qiHma2BA+c2otEi3wd0TBXy83t8vwrNL+3U2g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, dandan.he@mediatek.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, alan.cheng@mediatek.com, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, toby.liu@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Joe.C" <yingjoe.chen@mediatek.com>, huang eddie <eddie.huang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-11-27 at 09:44 +0100, Linus Walleij wrote:
> On Tue, Nov 11, 2014 at 1:38 PM, Hongzhou Yang
> <hongzhou.yang@mediatek.com> wrote:
> 
> > +* Mediatek MT65XX Pin Controller
> > +
> > +The Mediatek's Pin controller is used to control GPIO pins.
> 
> It's not GPIO pins, since they are not always general purpose. It's just
> pins. Say "control SoC pins".

Ok, I'll modify it, thanks.

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

Yes, you're right, I will modify it. Thanks.

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
> 
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
>         pins2 {
>                pins = <MT8135_PIN_100_SDA0>;
>                bias-disable;
>         };
> };
> 
> One node for the multiplexing, one node for the config. This is the
> pattern used by most drivers, so I want to have this structure.
> 
> It is also easy to tell one node from the other: if it contains "function"
> we know it's a multiplexing node, if it doesn't, it's a config node.
> 
> Yours,
> Linus Walleij
