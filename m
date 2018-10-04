From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v6 09/10] dt-binding: mtd: Document gpio-addr-flash
Date: Thu, 4 Oct 2018 16:32:43 +0200
Message-ID: <CAPybu_02nJf3JusnBrBZhEU4QvsDFWidEgZ_Teuv9ZqedCek1Q@mail.gmail.com>
References: <20181004130110.8496-1-ricardo.ribalda@gmail.com>
 <20181004130110.8496-9-ricardo.ribalda@gmail.com> <20181004160207.3b0403d7@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004160207.3b0403d7@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Boris
On Thu, Oct 4, 2018 at 4:02 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Thu,  4 Oct 2018 15:01:09 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>
> > Add documentation for gpio-addr-flash. This binding allow creating
> > flash devices that are paged using GPIOs.
> >
> > Cc: devicetree@vger.kernel.org
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
> >  .../bindings/mtd/mtd,gpio-addr-flash.txt      | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/mtd,gpio-addr-flash.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/mtd,gpio-addr-flash.txt b/Documentation/devicetree/bindings/mtd/mtd,gpio-addr-flash.txt
> > new file mode 100644
> > index 000000000000..304a33880f9e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/mtd,gpio-addr-flash.txt
> > @@ -0,0 +1,25 @@
> > +Memory Mapped flash with some address lines addressed using GPIOs
> > +
> > +Handle the case where a flash device is mostly addressed using physical
> > +line and supplemented by GPIOs.  This way you can hook up say a 8MiB flash
> > +to a 2MiB memory range and use the GPIOs to select a particular range.
> > +
> > + - compatible :  must be "mtd,gpio-addr-flash", "cfi-flash";
>
> I keep thinking you don't need a specific binding, just add an optional
> addr-gpios property to the generic physmap binding and that should do
> the trick. Plus, "*mtd*,gpio-addr-flash" is a linux-ism, and DT
> bindings should be OS-agnostic.
>

That is a very good point. Please take a look to v10, and tell me what
do you think.

It does not require a specific binding and also it can be build optionally.

Regards!

> > + - reg : Address range of the mtd chip that is memory mapped, this is,
> > +   on the previous example 2MiB.
> > + - addr-gpios: List of GPIO specifiers that will be used to address the MSBs
> > +   address lines. The order goes from LSB to MSB.
> > +
> > +For the rest of the properties, see mtd-physmap.txt.
> > +
> > +The device tree may optionally contain sub-nodes describing partitions of the
> > +address space. Check partition.txt for more details.
> > +
> > +Example:
> > +
> > +     flash@300000 {
> > +             compatible = "mtd,gpio-addr-flash", "cfi-flash";
> > +             bank-width = <2>;
> > +             reg = < 0x00300000 0x00200000 >;
> > +             addr-gpios = <&gpio_0 3 0>, <&gpio_0 4 0>;
> > +     } ;
>


-- 
Ricardo Ribalda
