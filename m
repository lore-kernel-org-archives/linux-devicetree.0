From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree support
Date: Thu, 2 May 2019 15:23:33 +0900
Message-ID: <CA+Ln22HLqnbbY37FG6CwjZvZH7G35Z+0kNq7XFU4WtZyk_EqZQ@mail.gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com> <20190502015408.GA11612@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502015408.GA11612@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, bbrezillon@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, David Woodhouse <dwmw2@infradead.org>, computersforpeace@gmail.com, marek.vasut@gmail.com, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2019=E5=B9=B45=E6=9C=882=E6=97=A5(=E6=9C=A8) 10:54 Rob Herring <robh@kernel=
.org>:
>
> On Fri, Apr 26, 2019 at 06:42:23PM +0200, Pawe=C5=82 Chmiel wrote:
> > From: Tomasz Figa <tomasz.figa@gmail.com>
> >
> > This patch adds dt-bindings for Samsung OneNAND driver.
> >
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> > Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> > ---
> >  .../bindings/mtd/samsung-onenand.txt          | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/samsung-onena=
nd.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/samsung-onenand.txt =
b/Documentation/devicetree/bindings/mtd/samsung-onenand.txt
> > new file mode 100644
> > index 000000000000..341d97cc1513
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/samsung-onenand.txt
> > @@ -0,0 +1,46 @@
> > +Device tree bindings for Samsung SoC OneNAND controller
> > +
> > +Required properties:
> > + - compatible : value should be either of the following.
> > +   (a) "samsung,s3c6400-onenand" - for onenand controller compatible w=
ith
> > +       S3C6400 SoC,
> > +   (b) "samsung,s3c6410-onenand" - for onenand controller compatible w=
ith
> > +       S3C6410 SoC,
> > +   (c) "samsung,s5pc100-onenand" - for onenand controller compatible w=
ith
> > +       S5PC100 SoC,
> > +   (d) "samsung,s5pv210-onenand" - for onenand controller compatible w=
ith
> > +       S5PC110/S5PV210 SoCs.
> > +
> > + - reg : two memory mapped register regions:
> > +   - first entry: control registers.
> > +   - second and next entries: memory windows of particular OneNAND chi=
ps;
> > +     for variants a), b) and c) only one is allowed, in case of d) up =
to
> > +     two chips can be supported.
> > +
> > + - interrupt-parent : phandle of interrupt controller to which the One=
NAND
> > +   controller is wired,
>
> This is implied and can be removed.
>
> > + - interrupts : specifier of interrupt signal to which the OneNAND con=
troller
> > +   is wired; should contain just one entry.
> > + - clock-names : should contain two entries:
> > +   - "bus" - bus clock of the controller,
> > +   - "onenand" - clock supplied to OneNAND memory.
>
> If the clock just goes to the OneNAND device, then it should be in the
> nand device node rather than the controller node.
>

(Trying hard to recall the details about this hardware.)
AFAIR the clock goes to the controller and the controller then feeds
it to the memory chips.

Also I don't think we should have any nand device nodes here, since
the memory itself is only exposed via the controller, which offers
various queries to probe the memory at runtime, so there is no need to
describe it in DT.

> > + - clock: should contain list of phandles and specifiers for all clock=
s listed
> > +   in clock-names property.
> > + - #address-cells : must be 1,
> > + - #size-cells : must be 1.
>
> This implies some child nodes. What are the child nodes?
>

I can't recall the reason for this unfortunately.

Best regards,
Tomasz
