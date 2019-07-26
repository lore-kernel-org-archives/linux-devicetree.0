From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: leds: document new "power-supply" property
Date: Fri, 26 Jul 2019 16:44:13 -0600
Message-ID: <CAL_JsqLhSKi1o-WE=02oz1__F=c5fo1FRH=qrs_1XG7jdz_9Uw@mail.gmail.com>
References: <20190708103547.23528-1-jjhiblot@ti.com> <20190708103547.23528-3-jjhiblot@ti.com>
 <20190724164757.GA3723@bogus> <753b2c8d-e8fc-ec6e-f372-a84d4452fd33@ti.com> <20190726100607.j5bdmuuk33zpwa2r@holly.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726100607.j5bdmuuk33zpwa2r@holly.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Mark Rutland <mark.rutland@arm.com>, Dan Murphy <dmurphy@ti.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 26, 2019 at 4:06 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Jul 25, 2019 at 01:08:46PM +0200, Jean-Jacques Hiblot wrote:
> > Hi Rob,
> >
> > On 24/07/2019 18:47, Rob Herring wrote:
> > > On Mon, Jul 08, 2019 at 12:35:47PM +0200, Jean-Jacques Hiblot wrote:
> > > > Most of the LEDs are powered by a voltage/current regulator. describing in
> > > > the device-tree makes it possible for the LED core to enable/disable it
> > > > when needed.
> > > >
> > > > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > > > ---
> > > >   Documentation/devicetree/bindings/leds/common.txt | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> > > > index 70876ac11367..e093a2b7eb90 100644
> > > > --- a/Documentation/devicetree/bindings/leds/common.txt
> > > > +++ b/Documentation/devicetree/bindings/leds/common.txt
> > > > @@ -61,6 +61,11 @@ Optional properties for child nodes:
> > > >   - panic-indicator : This property specifies that the LED should be used,
> > > >                       if at all possible, as a panic indicator.
> > > > +- power-supply : A voltage/current regulator used to to power the LED. When a
> > > > +          LED is turned off, the LED core disable its regulator. The
> > > > +          same regulator can power many LED (or other) devices. It is
> > > > +          turned off only when all of its users disabled it.
> > > Not sure this should be common. It wouldn't apply to cases where we have
> > > an LED controller parent nor gpio and pwm LEDs and those are most cases.
> >
> > It does make sense for GPIO and PWM bindings if the anode of LED is tied to
> > a regulated voltage and the cathod to the control line.

Okay. Is one of those your case, or you only have regulator control?
The latter would need a new binding. If you want to use power-supply
with either GPIO and PWM LED bindings, then it should still be listed
in those as an applicable property.

> > The same is true for a certain class of true LED controller that do not
> > deliver power but act like current sinks.
> >
> > JJ
> >
> > >
> > > Perhaps what makes sense here is an regulator-led binding.
>
> You didn't comment on this alternative... and I confess I'm not quite
> sure what Rob means by a regulator-led binding so I can't really comment
> either.
>
> Rob, is there any analogous example for a regulator-<something-else> binding
> to compare with?

regulator-haptic is the only one I found in a quick search.

Rob
