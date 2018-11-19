MIME-Version: 1.0
Date: Mon, 19 Nov 2018 16:10:02 -0600
References: <cover.1541174814.git.kblaiech@mellanox.com>
	<894b09ec9b4a18c91c3573145c59b8ff41c8ea04.1541174814.git.kblaiech@mellanox.com>
	<5bea0e9e.1c69fb81.dad72.3ca2@mx.google.com>
	<VI1PR05MB4271E85F07AF47B7D7FA8398A6C30@VI1PR05MB4271.eurprd05.prod.outlook.com>
In-Reply-To: <VI1PR05MB4271E85F07AF47B7D7FA8398A6C30@VI1PR05MB4271.eurprd05.prod.outlook.com>
Message-ID: <CAL_Jsq+sDcMLHhk3D=Cptk3kY2zJdeD4ZwzvGhzQMqS7JFjuKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: i2c: I2C binding for Mellanox BlueField SoC
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Khalil Blaiech <kblaiech@mellanox.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Woods <dwoods@mellanox.com>, Linux I2C <linux-i2c@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 14, 2018 at 5:53 PM Khalil Blaiech <kblaiech@mellanox.com> wrote:
>
> Rob,
>
> Thank you, for having taken the time to review this change and providing
> feedback.
>
> > On Fri, Nov 02, 2018 at 12:53:11PM -0400, Khalil Blaiech wrote:
> > > Added device tree bindings documentation for Mellanox BlueField I2C
> > > SMBus controller.
> > >
> > > Reviewed-by: David Woods <dwoods@mellanox.com>
> > > Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
> > > ---
> > >  .../devicetree/bindings/i2c/mellanox,i2c-mlx.txt   | 58
> > ++++++++++++++++++++++
> > >  1 file changed, 58 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt
> > > b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt
> > > new file mode 100644
> > > index 0000000..49c9e2f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt
> > > @@ -0,0 +1,58 @@
> > > +Device tree configuration for the Mellanox I2C SMBus on BlueField
> > > +SoCs
> > > +
> > > +Required Properties:
> > > +- reg        : address offset and range of bus device registers
> >
> > Need to enumerate the exact list.
>
> Okay.
>
> >
> > > +- compatible : should be "mellanox,i2c-mlx"
> >
> > Kind of generic.
>
> Please note that we do not provide identifier/serial number for our I2C
> device. I can think of  "mellanox,i2c-mlxbf" instead where "bf" refers to
> our SoC.  Is this less generic?
>
> >
> > > +- interrupts : interrupt number
> > > +- bus        : hardware bus identifier. BlueField ARM side has three bus
> > > +               controllers; thus, values might be 0, 1, or 2
> >
> > We don't do bus indexes in DT.
>
> Actually, it is critical for us to know what bus we are using and/or exposing
> to user space; we rely on the bus identifier to match the hardware block.
> On the other hand, we don't want to put complex logic in the driver because
> it may require hardcoding memory region addresses. And we don't want to
> do that, right?

'i2cN' alias should work for you. That's what others do.


> > > +i2c0 {
> > > +   compatible = "mellanox,i2c-mlx";
> > > +   reg = <0x02804000 0x800>,       /* Smbus[0]        */
> > > +              <0x02801200 0x020>,  /* Cause Master[0] */
> > > +              <0x02801260 0x020>,  /* Cause Slave[0]  */
> > > +              <0x02801300 0x010>,  /* Cause Coalesce  */
> >
> > > +              <0x02802000 0x100>,  /* GPIO 0          */
> > > +              <0x02800358 0x008>;  /* CorePll         */
> >
> > Are these 2 really part of the I2C block?
>
> Our hardware design is quite complex, roughly, we have kind of
> centralized block which contains multiple sub-blocks. These regs
> are shared among the I2C controllers (i.e., sub-blocks).  These
> are needed during device initialization.
> You'll also notice the "Cause Coalesce" above.
Okay, as long as these addresses don't also appear somewhere else in
the DT it is fine. It's not something we check currently, but I want
to and we have to work-around the kernel's resource tracking because
of that problem.

Rob
