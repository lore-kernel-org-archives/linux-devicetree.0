From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] Documentation: gpio: fix bindings document
Date: Thu, 15 Jan 2015 16:10:54 +0200
Message-ID: <2479604.mfbgZIQjOA@avalon>
References: <1421311960-4120-1-git-send-email-yamada.m@jp.panasonic.com> <CAL_JsqL+0C_wQ26=bdwYGLj0X=vzmn8khFfo_Ryet5O=k-XFzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL+0C_wQ26=bdwYGLj0X=vzmn8khFfo_Ryet5O=k-XFzw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Alexandre Courbot <acourbot@nvidia.com>, Stephen Warren <swarren@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thursday 15 January 2015 08:07:18 Rob Herring wrote:
> On Thu, Jan 15, 2015 at 2:52 AM, Masahiro Yamada
> 
> <yamada.m@jp.panasonic.com> wrote:
> > Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> 
> Perhaps some explanation. You can't just remove properties. Please
> explain to what extent the old/wrong name is used. This patch is only
> okay if there are no users of gpio-phandle.

As far as I understand the patch just fixes a typo. There has never been a 
gpio-phandle for GPIO controllers, only for GPIO consumers.

> > ---
> > 
> >  Documentation/devicetree/bindings/gpio/gpio.txt | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt
> > b/Documentation/devicetree/bindings/gpio/gpio.txt index b9bd1d6..f7a158d
> > 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> > @@ -69,7 +69,8 @@ GPIO pin number, and GPIO flags as accepted by the
> > "qe_pio_e" gpio-controller.> 
> >  ----------------------------------
> >  
> >  A gpio-specifier should contain a flag indicating the GPIO polarity;
> >  active-> 
> > -high or active-low. If it does, the follow best practices should be
> > followed: +high or active-low. If it does, the following best practices
> > should be> 
> > +followed:
> >  The gpio-specifier's polarity flag should represent the physical level at
> >  the GPIO controller that achieves (or represents, for inputs) a
> >  logically asserted> 
> > @@ -147,7 +148,7 @@ contains information structures as follows:
> >         numeric-gpio-range ::=
> >         
> >                         <pinctrl-phandle> <gpio-base> <pinctrl-base>
> >                         <count>
> >         
> >         named-gpio-range ::= <pinctrl-phandle> <gpio-base> '<0 0>'
> > 
> > -       gpio-phandle : phandle to pin controller node.
> > +       pinctrl-phandle : phandle to pin controller node
> > 
> >         gpio-base : Base GPIO ID in the GPIO controller
> >         pinctrl-base : Base pinctrl pin ID in the pin controller
> >         count : The number of GPIOs/pins in this range

-- 
Regards,

Laurent Pinchart

