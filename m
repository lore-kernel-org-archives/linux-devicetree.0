From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v2 8/8] dt-binding: mtd: Document gpio-addr-flash
Date: Wed, 26 Sep 2018 08:33:58 +0200
Message-ID: <CAPybu_3ZpE43X9W919k1KD-F3waBkwBdUFFamwZnHcRLWo-_5w@mail.gmail.com>
References: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
 <20180905143643.9871-9-ricardo.ribalda@gmail.com> <20180925204813.GA6450@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180925204813.GA6450@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob
On Tue, Sep 25, 2018 at 10:48 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 05, 2018 at 04:36:43PM +0200, Ricardo Ribalda Delgado wrote:
> > Add documentation for gpio-addr-flash. This binding allow creating
> > flash devices that are paged using GPIOs.
> >
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
> >  .../bindings/mtd/gpio-addr-flash.txt          | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt b/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
> > new file mode 100644
> > index 000000000000..4279e8cad09b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
> > @@ -0,0 +1,46 @@
> > +Memory Mapped flash with some address lines addressed using GPIOs
> > +
> > +Handle the case where a flash device is mostly addressed using physical
> > +line and supplemented by GPIOs.  This way you can hook up say a 8MiB flash
> > +to a 2MiB memory range and use the GPIOs to select a particular range.
> > +
> > + - compatible : "cfi-gpio-addr-flash"
> > + - reg : Address range of the mtd chip that is memory mapped, this is,
> > +   on the previous example 2MiB.
> > + - bank-width : Width (in bytes) of the bank.  Equal to the
> > +   device width times the number of interleaved chips.
> > + - probe-type : (optional) "cfi_probe", "jedec_probe". How the mtd chip
> > +   is going to be probed. If omitted, assumed to be equal to "cfi_probe".
>
> Why not just a bool prop for jedec mode? As-is, the '_probe' part is
> redundant.

I wanted to mimic gpio-addr-flash. Which btw does not document this
property. Shall I send a patch adding it?

>
> > + - #address-cells, #size-cells : Must be present if the device has
> > +   sub-nodes representing partitions (see below).  In this case
> > +   both #address-cells and #size-cells must be equal to 1.
>
> Perhaps most importantly, where's 'gpios' property?
>
> > +
> > +The device tree may optionally contain sub-nodes describing partitions of the
> > +address space. See partition.txt for more detail.
> > +
> > +Example:
> > +
> > +     cfi_flash_0: cfi_flash {
>
> flash@300000
>
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             compatible = "cfi-gpio-addr-flash";
> > +             bank-width = <2>;
> > +             reg = < 0x00300000 0x00200000 >;
> > +             gpios = <&gpio_0 3 0>, <&gpio_0 4 0>;
> > +             partition@0 {
>
> All these under a partitions node is now recommended.
>
> > +                     reg = < 0x0 0x200000 >;
> > +                     label = "Golden Bitstream";
> > +             };
> > +             partition@200000 {
> > +                     reg = < 0x200000 0x200000 >;
> > +                     label = "User Bitstream";
> > +             };
> > +             partition@400000 {
> > +                     reg = < 0x400000 0x200000 >;
> > +                     label = "V4L Controls";
> > +             };
> > +             partition@600000 {
> > +                     reg = < 0x600000 0x200000 >;
> > +                     label = "Production Data";
> > +             };
> > +     } ;
> > --
> > 2.18.0
> >



-- 
Ricardo Ribalda
