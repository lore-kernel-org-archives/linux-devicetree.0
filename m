From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC next v1 0/5] stmmac: honor the GPIO flags for the PHY reset GPIO
Date: Mon, 10 Jun 2019 17:51:25 +0200
Message-ID: <CAFBinCAy=YR+qV=vYtAV4p5ftcR-VuYTJz3wuMY-k6PWcmbDQQ@mail.gmail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609204510.GB8247@lunn.ch> <20190610114700.tymqzzax334ahtz4@flea>
 <CAFBinCCs5pa1QmaV32Dk9rOADKGXXFpZsSK=LUk4CGWMrG5VUQ@mail.gmail.com> <20190610135109.7alkvruvw2jbtwph@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610135109.7alkvruvw2jbtwph@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, linux-kernel@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 3:51 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi Martin,
>
> On Mon, Jun 10, 2019 at 02:31:17PM +0200, Martin Blumenstingl wrote:
> > On Mon, Jun 10, 2019 at 1:47 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > Hi Andrew,
> > >
> > > On Sun, Jun 09, 2019 at 10:45:10PM +0200, Andrew Lunn wrote:
> > > > > Patch #1 and #4 are minor cleanups which follow the boyscout rule:
> > > > > "Always leave the campground cleaner than you found it."
> > > >
> > > > > I
> > > > > am also looking for suggestions how to handle these cross-tree changes
> > > > > (patch #2 belongs to the linux-gpio tree, patches #1, 3 and #4 should
> > > > > go through the net-next tree. I will re-send patch #5 separately as
> > > > > this should go through Kevin's linux-amlogic tree).
> > > >
> > > > Patches 1 and 4 don't seem to have and dependencies. So i would
> > > > suggest splitting them out and submitting them to netdev for merging
> > > > independent of the rest.
> > >
> > > Jumping on the occasion of that series. These properties have been
> > > defined to deal with phy reset, while it seems that the PHY core can
> > > now handle that pretty easily through generic properties.
> > >
> > > Wouldn't it make more sense to just move to that generic properties
> > > that already deals with the flags properly?
> > thank you for bringing this up!
> > if anyone else (just like me) doesn't know about it, there are generic
> > bindings defined here: [0]
> >
> > I just tested this on my X96 Max by defining the following properties
> > inside the PHY node:
> >   reset-delay-us = <10000>;
> >   reset-assert-us = <10000>;
> >   reset-deassert-us = <10000>;
> >   reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
> >
> > that means I don't need any stmmac patches which seems nice.
>
> I'm glad it works for you :)
>
> > instead I can submit a patch to mark the snps,reset-gpio properties in
> > the dt-bindings deprecated (and refer to the generic bindings instead)
> > what do you think?
>
> I already did as part of the binding reworks I did earlier today:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2019-June/658427.html
great, thank you - you have my Reviewed-by!
