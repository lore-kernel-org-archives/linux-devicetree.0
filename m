From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v7 1/2] mtd: arasan: Add device tree binding
 documentation
Date: Tue, 10 Jan 2017 06:03:25 +0000
Message-ID: <03CA77BA8AF6F1469AEDFBDA1322A7B76424ECD2@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1483930734-10309-1-git-send-email-punnaia@xilinx.com>
 <20170110053605.yqclykdgi3tgndnp@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170110053605.yqclykdgi3tgndnp@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,
   =20
   Thanks for the review.

> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Tuesday, January 10, 2017 11:06 AM
> To: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org; computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
> boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org; marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
> richard-/L3Ra7n9ekc@public.gmane.org; cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; Punnaiah
> Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Subject: Re: [PATCH v7 1/2] mtd: arasan: Add device tree binding
> documentation
>=20
> On Mon, Jan 09, 2017 at 08:28:53AM +0530, Punnaiah Choudary Kalluri wrote=
:
> > This patch adds the dts binding document for arasan nand flash
> > controller.
> >
> > Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v7:
> > - Corrected the acronyms those should be in caps
> > changes in v6:
> > - Removed num-cs property
> > - Separated nandchip from nand controller
> > changes in v5:
> > - None
> > Changes in v4:
> > - Added num-cs property
> > - Added clock support
> > Changes in v3:
> > - None
> > Changes in v2:
> > - None
> > ---
> >  .../devicetree/bindings/mtd/arasan_nfc.txt         | 38
> ++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> > new file mode 100644
> > index 0000000..f20adfc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> > @@ -0,0 +1,38 @@
> > +Arasan NAND Flash Controller with ONFI 3.1 support
> > +
> > +Required properties:
> > +- compatible: Should be "arasan,nfc-v3p10"
>=20
> Needs a note that it must also have an SoC specific compatible string.
>=20
  Sorry, I couldn't understand this comment. Could you elaborate it?

> > +- reg: Memory map for module access
> > +- interrupt-parent: Interrupt controller the interrupt is routed throu=
gh
> > +- interrupts: Should contain the interrupt for the device
> > +- clock-name: List of input clocks - "clk_sys", "clk_flash"
>=20
> clk_ is redundant.
>=20
 =20
 I have defined these clock names as per the controller data sheet.
 So, I feel it is fine to have them in sync with the datasheet.
  Please let me know if you still want me to change this.

Regards,
Punnaiah

> > +	      (See clock bindings for details)
> > +- clocks: Clock phandles (see clock bindings for details)
> > +
> > +Optional properties:
> > +- arasan,has-mdma: Enables DMA support
> > +
> > +For NAND partition information please refer the below file
> > +Documentation/devicetree/bindings/mtd/partition.txt
> > +
> > +Example:
> > +	nand0: nand@ff100000 {
> > +		compatible =3D "arasan,nfc-v3p10"
> > +		reg =3D <0x0 0xff100000 0x1000>;
> > +		clock-name =3D "clk_sys", "clk_flash"
> > +		clocks =3D <&misc_clk &misc_clk>;
> > +		interrupt-parent =3D <&gic>;
> > +		interrupts =3D <0 14 4>;
> > +		arasan,has-mdma;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>
> > +
> > +		nand@0 {
> > +			reg =3D <0>
> > +			partition@0 {
> > +				label =3D "filesystem";
> > +				reg =3D <0x0 0x0 0x1000000>;
> > +			};
> > +			(...)
> > +		};
> > +	};
> > --
> > 2.7.4
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
