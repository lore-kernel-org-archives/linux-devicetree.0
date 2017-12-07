From: Dhaval Rajeshbhai Shah <DSHAH-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] [linux][master][v1] devicetree: misc: Add binding for
 logicoreIP xlnx,vcu
Date: Thu, 7 Dec 2017 03:42:38 +0000
Message-ID: <BY2PR0201MB1879E66CB1934B9A8D7FCDC2C1330@BY2PR0201MB1879.namprd02.prod.outlook.com>
References: <1512472023-3957-1-git-send-email-dshah@xilinx.com>
 <20171206214909.jr2x6cdzs2577aee@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171206214909.jr2x6cdzs2577aee@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Rob Herring' <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Wednesday, December 06, 2017 1:49 PM
> To: Dhaval Rajeshbhai Shah <DSHAH-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org; Hyun Kwon
> <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Dhaval Rajeshbhai Shah <DSHAH-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Subject: Re: [PATCH] [linux][master][v1] devicetree: misc: Add binding fo=
r
> logicoreIP xlnx,vcu
>=20
> On Tue, Dec 05, 2017 at 03:07:03AM -0800, Dhaval Shah wrote:
> > From: Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >
> > Added the txt file which contain the xlnx,vcu DT node properties
> > information. This also provides the information of it's child node as
> > well.
> >
> > Signed-off-by: Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../devicetree/bindings/misc/xlnx,vcu.txt          | 59
> ++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/misc/xlnx,vcu.txt
> >
> > diff --git a/Documentation/devicetree/bindings/misc/xlnx,vcu.txt
> > b/Documentation/devicetree/bindings/misc/xlnx,vcu.txt
> > new file mode 100644
> > index 0000000..e722ff3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/xlnx,vcu.txt
> > @@ -0,0 +1,59 @@
> > +Xilinx VCU init Driver
>=20
> Bindings don't describe drivers. Describe the h/w.
I will take care of this.
>=20
> > +-----------------------------
> > +
> > +General concept
> > +---------------
> > +
> > +Xilinx VCU init driver is developed to handle the LogiCore related
> > +new implementation. In this directory, The DT node of the Xilinx VCU
> > +init driver represents as a top level node.
> > +
> > +Required properties:
> > +- compatible: Must be "xlnx,vcu".
>=20
> Needs to be more specific.
I will resolve this.
>=20
> > +- reg, reg-names: There are two sets of registers need to provide.
> > +	1. vcu slcr
> > +	2. Logicore
> > +	reg-names should contain name for the each register sequence.
> > +- clocks: phandle for aclk and pll_ref clocksource
> > +- clock-names: The identification string, "aclk", is always required f=
or
> > +   the axi clock. "pll_ref" is required for pll.
> > +- ranges
> > +- VCU Init driver node define the following child nodes:
> > +	* Allegro encoder driver node
>=20
> encoder of what?
I have to remove this encoder and decoder nodes. Other team is working on t=
hat. They will extend this once they are done with encoder and decoder.=20
>=20
> > +		- compatible: Must be "al,al5e"
> > +		- reg: There is a one set of register.
>=20
>=20
> > +		- interrupts: interrupt number to the cpu.
> > +		- interrupt-parent: the phandle for the interrupt controller
> > +		  that services interrupts for this device.
> > +	* Allegro decoder driver node
> > +		- compatible: Must be "al,al5d"
> > +		- reg: There is a one set of register.
> > +		- interrupts: interrupt number to the cpu.
> > +		- interrupt-parent: the phandle for the interrupt controller
> > +		  that services interrupts for this device.
> > +Example:
> > +
> > +	xlnx_vcu: vcu@a0040000 {
> > +		compatible =3D "xlnx,vcu";
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
>=20
> There's no reason the child nodes need 64 bits of address or size. Use ra=
nges.
I will take care of this.
>=20
> > +		reg =3D <0x0 0xa0040000 0x0 0x1000>,
> > +			 <0x0 0xa0041000 0x0 0x1000>;
> > +		reg-names =3D "vcu_slcr", "logicore";
> > +		clocks =3D <&si570_1>, <&clkc 71>;
> > +		clock-names =3D "pll_ref", "aclk";
> > +		ranges;
> > +		encoder: al5e@a0000000 {
> > +			compatible =3D "al,al5e";
> > +			reg =3D <0x0 0xa0000000 0x0 0x10000>;
> > +			interrupts =3D <0 89 4>;
> > +			interrupt-parent =3D <&gic>;
> > +		};
> > +
> > +		decoder: al5d@a0020000 {
> > +			compatible =3D "al,al5d";
> > +			reg =3D <0x0 0xa0020000 0x0 0x10000>;
> > +			interrupts =3D <0 89 4>;
>=20
> A shared interrupt? Are these really separate blocks? Seems like this cou=
ld all
> be a single node.
Based on the discussion in the misc/drivers forum, I will remove this encod=
er and decoder node which is of some other team working on. They will exten=
d this once they are done with there work.
>=20
> > +			interrupt-parent =3D <&gic>;
> > +		};
> > +	};
> > --
> > 2.7.4
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree"
> > in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More
> majordomo
> > info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
