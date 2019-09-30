From: Lars Poeschel <poeschel@lemonage.de>
Subject: Re: [PATCH v8 2/7] nfc: pn532: Add uart phy docs and rename it
Date: Mon, 30 Sep 2019 09:47:37 +0200
Message-ID: <20190930074737.GA24353@lem-wkst-02.lemonage>
References: <20190919091645.16439-1-poeschel@lemonage.de>
 <20190919091645.16439-2-poeschel@lemonage.de>
 <20190927155209.GA6261@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190927155209.GA6261@bogus>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, "open list:NFC SUBSYSTEM" <netdev@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Simon Horman <horms@verge.net.au>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 10:52:09AM -0500, Rob Herring wrote:
> On Thu, Sep 19, 2019 at 11:16:39AM +0200, Lars Poeschel wrote:
> > This adds documentation about the uart phy to the pn532 binding doc. As
> > the filename "pn533-i2c.txt" is not appropriate any more, rename it to
> > the more general "pn532.txt".
> > This also documents the deprecation of the compatible strings ending
> > with "...-i2c".
> > 
> > Cc: Johan Hovold <johan@kernel.org>
> > Cc: Simon Horman <horms@verge.net.au>
> > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> > ---
> > Changes in v8:
> > - Update existing binding doc instead of adding a new one:
> >   - Add uart phy example
> >   - Add general "pn532" compatible string
> >   - Deprecate "...-i2c" compatible strings
> >   - Rename file to a more general filename
> > - Intentionally drop Rob's Reviewed-By as I guess this rather big change
> >   requires a new review
> > 
> > Changes in v7:
> > - Accidentally lost Rob's Reviewed-By
> > 
> > Changes in v6:
> > - Rebased the patch series on v5.3-rc5
> > - Picked up Rob's Reviewed-By
> > 
> > Changes in v4:
> > - Add documentation about reg property in case of i2c
> > 
> > Changes in v3:
> > - seperate binding doc instead of entry in trivial-devices.txt
> > 
> >  .../devicetree/bindings/net/nfc/pn532.txt     | 46 +++++++++++++++++++
> >  .../devicetree/bindings/net/nfc/pn533-i2c.txt | 29 ------------
> >  2 files changed, 46 insertions(+), 29 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/net/nfc/pn532.txt
> >  delete mode 100644 Documentation/devicetree/bindings/net/nfc/pn533-i2c.txt
> 
> In the future, use '-M' option (I recommend making this the default).

As David already requested a next version of the patchset, I will do it
in v9.

> > 
> > diff --git a/Documentation/devicetree/bindings/net/nfc/pn532.txt b/Documentation/devicetree/bindings/net/nfc/pn532.txt
> > new file mode 100644
> > index 000000000000..f0591f160bee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/nfc/pn532.txt
> > @@ -0,0 +1,46 @@
> > +* NXP Semiconductors PN532 NFC Controller
> > +
> > +Required properties:
> > +- compatible: Should be
> > +    - "nxp,pn532" Place a node with this inside the devicetree node of the bus
> > +                  where the NFC chip is connected to.
> > +                  Currently the kernel has phy bindings for uart and i2c.
> > +    - "nxp,pn532-i2c" (DEPRECATED) only works for the i2c binding.
> > +    - "nxp,pn533-i2c" (DEPRECATED) only works for the i2c binding.
> 
> No more pm533 support?

If you ask me, no. NXP sells more or less two versions of this chip:
pn532 and pn533. The pn532 is the version with i2c and uart interface,
the pn533 only has an usb interface. So I would say "nxp,pn533-i2c" was
wrong and I dropped it.

> > +
> > +Required properties if connected on i2c:
> > +- clock-frequency: I²C work frequency.
> > +- reg: for the I²C bus address. This is fixed at 0x24 for the PN532.
> > +- interrupts: GPIO interrupt to which the chip is connected
> 
> UART attached case has no irq? I guess it could just start sending 
> data...

Well, the chip has it (as said above, it is the same as the i2c chip)
but it is not an use case for me. At the moment I have no hardware to
test this with. So I did not implement it in the uart phy driver.
Solution is: If the chip is in sleep mode, send it some special
"wake-up" paket over uard and wait until it actually wakes up.

> > +
> > +Optional SoC Specific Properties:
> > +- pinctrl-names: Contains only one value - "default".
> > +- pintctrl-0: Specifies the pin control groups used for this controller.
> > +
> > +Example (for ARM-based BeagleBone with PN532 on I2C2):
> > +
> > +&i2c2 {
> > +
> > +
> > +	pn532: pn532@24 {
> 
> nfc@24

Ok.

> > +
> > +		compatible = "nxp,pn532";
> > +
> > +		reg = <0x24>;
> > +		clock-frequency = <400000>;
> > +
> > +		interrupt-parent = <&gpio1>;
> > +		interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
> > +
> > +	};
> > +};
> > +
> > +Example (for PN532 connected via uart):
> > +
> > +uart4: serial@49042000 {
> > +        compatible = "ti,omap3-uart";
> > +
> > +        pn532: nfc {
> > +                compatible = "nxp,pn532";
> > +        };
> > +};
