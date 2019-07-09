MIME-Version: 1.0
Date: Tue, 9 Jul 2019 10:08:24 -0600
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
	<CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com>
	<06c95f15-d577-e43d-e046-ee222f86c406@mentor.com>
In-Reply-To: <06c95f15-d577-e43d-e046-ee222f86c406@mentor.com>
Message-ID: <CAL_JsqLQvjtnfUsZ2RP4eozvdwMLzNxtgmT+XFaxW4xzoFjL=w@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Harish Jenny K N <harish_kandiga@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 8, 2019 at 11:25 PM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:
>
> Hi Rob,
>
>
> On 09/07/19 4:06 AM, Rob Herring wrote:
> > On Fri, Jun 28, 2019 at 3:31 AM Harish Jenny K N
> > <harish_kandiga@mentor.com> wrote:
> >> Document the device tree binding for the inverter gpio
> >> controller to configure the polarity of the gpio pins
> >> used by the consumers.
> >>
> >> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> >> ---
> >>  .../devicetree/bindings/gpio/gpio-inverter.txt     | 29 ++++++++++++++++++++++
> >>  1 file changed, 29 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpio/gpio-inverter.txt b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> >> new file mode 100644
> >> index 0000000..8bb6b2e
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> >> @@ -0,0 +1,29 @@
> >> +GPIO-INVERTER
> >> +======
> >> +This binding defines the gpio-inverter. The gpio-inverter is a driver that
> >> +allows to properly describe the gpio polarities on the hardware.
> > I don't understand. Please explain this in terms of the hardware, not a driver.
>
>
> gpio inverters can be used on different hardware to alter the polarity of gpio chips.
> The polarity of pins can change from hardware to hardware with the use of inverters.

Yes, I know what an inverter is.

> This device tree binding models gpio inverters in the device tree to properly describe the hardware.

We already define the active state of GPIOs in the consumers. If
there's an inverter in the middle, the consumer active state is simply
inverted. I don't agree that that is a hack as Linus said without some
reasoning why an inverter needs to be modeled in DT. Anything about
what 'userspace' needs is not a reason. That's a Linux thing that has
little to do with hardware description.

Rob
