From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH] gpio: dwapb: Add support for 32 interrupts
Date: Tue, 10 Apr 2018 06:24:24 +0000
Message-ID: <TY1PR01MB1769EC6963CFB3D720D1B9EEF5BE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1522246950-9110-1-git-send-email-phil.edworthy@renesas.com>
 <20180409192013.5rytwgoixtyraow3@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180409192013.5rytwgoixtyraow3@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 09 April 2018 20:20 Rob Herring wrote:
> On Wed, Mar 28, 2018 at 03:22:30PM +0100, Phil Edworthy wrote:
> > The DesignWare GPIO IP can be configured for either 1 or 32
> > interrupts, but the driver currently only supports 1 interrupt. See
> > the DesignWare DW_apb_gpio Databook description of the
> 'GPIO_INTR_IO' parameter.
>=20
> Someday h/w designers will realize this does nothing to optimize interrup=
t
> handling...
I can imagine some software where the isr is written to handle a specific G=
PIO
interrupt _could_ be faster, though no sane software would be designed like
that.

> > This change allows the driver to work with up to 32 interrupts, it
> > will get as many interrupts as specified in the DT 'interrupts' propert=
y.
> > It doesn't do anything clever with the different interrupts, it just
> > calls the same handler used for single interrupt hardware.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > ---
> > Note: There are a few lines over 80 chars, but this is just guidance, r=
ight?
> >       Especially as there are already some lines over 80 chars.
>=20
> Code, yes, but not for paragraphs of text in DT bindings.
Good, that's what I did.

> > ---
> >  .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   | 10 ++++-
> >  drivers/gpio/gpio-dwapb.c                          | 44 ++++++++++++++=
+++-----
> >  include/linux/platform_data/gpio-dwapb.h           |  3 +-
> >  3 files changed, 45 insertions(+), 12 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> > b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> > index 4a75da7..e343581 100644
> > --- a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> > +++ b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> > @@ -26,8 +26,14 @@ controller.
> >    the second encodes the triger flags encoded as described in
> >
> > Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> >  - interrupt-parent : The parent interrupt controller.
> > -- interrupts : The interrupt to the parent controller raised when
> > GPIOs
> > -  generate the interrupts.
> > +- interrupts : The interrupts to the parent controller raised when
> > +GPIOs
> > +  generate the interrupts. If the controller provides one combined
> > +interrupt
> > +  for all GPIOs, specify a single interrupt. If the controller
> > +provides one
> > +  interrupt for each GPIO, provide a list of interrupts that
> > +correspond to each
> > +  of the GPIO pins. When specifying multiple interrupts, if any of
> > +the GPIOs are
> > +  not connected to an interrupt, use the interrupt-mask property.
> > +- interrupt-mask : a 32-bit bit mask that specifies which interrupts
> > +in the list
> > +  of interrupts is valid, bit is 1 for a valid irq.
>=20
> This is not a standard property and would need a vendor prefix. However, =
I'd
> prefer you just skip any not connected interrupts with an invalid interru=
pt
> number. Then the GPIO number is the index into "interrupts".
Makes sense, I'll rework it to do this.

> >  - snps,nr-gpios : The number of pins in the port, a single cell.
>=20
> This BTW should be deprecated to use "nr-gpios" instead, but that's anoth=
er
> patch.

Thanks for your comments,
Phil
