From: Lars Poeschel <poeschel@lemonage.de>
Subject: Re: [PATCH v3 2/5] nfc: pn532_uart: Add NXP PN532 to devicetree docs
Date: Fri, 26 Oct 2018 09:59:06 +0200
Message-ID: <20181026075906.GA28338@lem-wkst-02.lemonage>
References: <20181025132937.24405-1-poeschel@lemonage.de>
 <20181025132937.24405-2-poeschel@lemonage.de>
 <20181025215445.GA16550@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181025215445.GA16550@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 04:54:45PM -0500, Rob Herring wrote:
> On Thu, Oct 25, 2018 at 03:29:33PM +0200, Lars Poeschel wrote:
> > Add a simple binding doc for the pn532.
> > 
> > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> > ---
> > Changes in v3:
> > - seperate binding doc instead of entry in trivial-devices.txt
> > 
> >  .../devicetree/bindings/nfc/pn532.txt         | 31 +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nfc/pn532.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/nfc/pn532.txt b/Documentation/devicetree/bindings/nfc/pn532.txt
> > new file mode 100644
> > index 000000000000..a2df72a5f504
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nfc/pn532.txt
> > @@ -0,0 +1,31 @@
> > +NXP PN532 NFC Chip
> 
> What about the PN533?

I read the publicy available docs from NXP a bit and I think this is
wrong. PN533 is the version of the chip with usb. It does not have a i2c
client interface. It only has a i2c master interface, but this serves us
no purpose here and is furthermore not supported by the driver.
PN532 is the version of the chip for "simple" serial protocols. It's
interfaces to the host are uart, i2c and spi.
So I left PN533 out here.

> > +
> > +Required properties:
> > +- compatible: Should be
> > +    - "nxp,pn532" Place a node with this inside the devicetree node of the bus
> > +                  where the NFC chip is connected to.
> > +                  Currently the kernel has phy bindings for uart and i2c.
> > +    - "nxp,pn532-i2c" (DEPRECATED) only works for the i2c binding.
> > +    - "nxp,pn533-i2c" (DEPRECATED) only works for the i2c binding.
> > +
> > +There are no additional properties provided by the driver at the moment.
> 
> I2C requires reg.

I was so deeply focused at my uart part. Sorry, I missed that.
I will wait a bit if I get some more feedback and will address this in
the next version of the patchset.

> > +
> > +Example uart:
> > +
> > +uart4: serial@49042000 {
> > +        compatible = "ti,omap3-uart";
> > +
> > +        pn532: nfc {
> > +                compatible = "nxp,pn532";
> > +        };
> > +};
> > +
> > +Example i2c:
> > +
> > +i2c1: i2c@0 {
> > +        compatible = "ti,omap3-i2c";
> > +
> > +        pn532: nfc {
> > +                compatible = "nxp,pn532";
> > +        };
> > +};
> > -- 
> > 2.19.1
> > 

Thank you for your review,

Lars
