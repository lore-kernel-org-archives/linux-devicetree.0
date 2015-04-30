From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [v3] dt/bindings: qoriq-clock: Add binding for FMan clock mux
Date: Wed, 29 Apr 2015 19:30:32 -0500
Message-ID: <1430353832.16357.138.camel@freescale.com>
References: <1429008968-24707-1-git-send-email-igal.liberman@freescale.com>
	 <1429119357.22867.724.camel@freescale.com>
	 <DM2PR03MB38330DBBFFD1BC45D58F447E6E40@DM2PR03MB383.namprd03.prod.outlook.com>
	 <1429249281.32545.52.camel@freescale.com>
	 <DM2PR03MB383E5F67C358CCE2E38EA71E6E00@DM2PR03MB383.namprd03.prod.outlook.com>
	 <1429577504.4352.67.camel@freescale.com>
	 <DM2PR03MB383C35FA5959662DD48D00BE6EE0@DM2PR03MB383.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR03MB383C35FA5959662DD48D00BE6EE0-ufbTtyGzTTRJonC5hhDUuuO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liberman Igal-B31950 <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tang Yuantian-B29983 <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-04-22 at 05:47 -0500, Liberman Igal-B31950 wrote:
>=20
>=20
> Regards,
> Igal Liberman.
>=20
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Tuesday, April 21, 2015 3:52 AM
> > To: Liberman Igal-B31950
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Tang
> > Yuantian-B29983
> > Subject: Re: [v3] dt/bindings: qoriq-clock: Add binding for FMan cl=
ock mux
> >=20
> > On Mon, 2015-04-20 at 06:40 -0500, Liberman Igal-B31950 wrote:
> > >
> > >
> > > Regards,
> > > Igal Liberman.
> > >
> > > > -----Original Message-----
> > > > From: Liberman Igal-B31950
> > > > Sent: Monday, April 20, 2015 2:07 PM
> > > > To: Wood Scott-B07421
> > > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > > > Subject: RE: [v3] dt/bindings: qoriq-clock: Add binding for FMa=
n
> > > > clock mux
> > > >
> > > >
> > > >
> > > > Regards,
> > > > Igal Liberman.
> > > >
> > > > > -----Original Message-----
> > > > > From: Wood Scott-B07421
> > > > > Sent: Friday, April 17, 2015 8:41 AM
> > > > > To: Liberman Igal-B31950
> > > > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > > > > Subject: Re: [v3] dt/bindings: qoriq-clock: Add binding for F=
Man
> > > > > clock mux
> > > > >
> > > > > On Thu, 2015-04-16 at 01:11 -0500, Liberman Igal-B31950 wrote=
:
> > > > > >
> > > > > >
> > > > > > Regards,
> > > > > > Igal Liberman.
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Wood Scott-B07421
> > > > > > > Sent: Wednesday, April 15, 2015 8:36 PM
> > > > > > > To: Liberman Igal-B31950
> > > > > > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlazAvgg39JiuA@public.gmane.org=
=2Eorg
> > > > > > > Subject: Re: [v3] dt/bindings: qoriq-clock: Add binding f=
or
> > > > > > > FMan clock mux
> > > > > > >
> > > > > > > On Tue, 2015-04-14 at 13:56 +0300, Igal.Liberman wrote:
> > > > > > > > From: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > > > > >
> > > > > > > > v3: Addressed feedback from Scott:
> > > > > > > > 	- Removed clock specifier description.
> > > > > > > >
> > > > > > > > v2: Addressed feedback from Scott:
> > > > > > > > 	- Moved the "fman-clk-mux" clock provider details
> > > > > > > > 	  under "clocks" property.
> > > > > > > >
> > > > > > > > Signed-off-by: Igal Liberman <Igal.Liberman@freescale.c=
om>
> > > > > > > > ---
> > > > > > > >  .../devicetree/bindings/clock/qoriq-clock.txt      |  =
 17
> > > > > +++++++++++++++--
> > > > > > > >  1 file changed, 15 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git
> > > > > > > > a/Documentation/devicetree/bindings/clock/qoriq-clock.t=
xt
> > > > > > > > b/Documentation/devicetree/bindings/clock/qoriq-clock.t=
xt
> > > > > > > > index b0d7b73..2bb3b38 100644
> > > > > > > > ---
> > > > > > > > a/Documentation/devicetree/bindings/clock/qoriq-clock.t=
xt
> > > > > > > > +++ b/Documentation/devicetree/bindings/clock/qoriq-clo=
ck.tx
> > > > > > > > +++ t
> > > > > > > > @@ -65,9 +65,10 @@ Required properties:
> > > > > > > >  		It takes parent's clock-frequency as its clock.
> > > > > > > >  	* "fsl,qoriq-platform-pll-1.0" for the platform PLL c=
lock (v1.0)
> > > > > > > >  	* "fsl,qoriq-platform-pll-2.0" for the platform PLL c=
lock
> > > > > > > > (v2.0)
> > > > > > > > +	* "fsl,fman-clk-mux" for the Frame Manager clock.
> > > > > > > >  - #clock-cells: From common clock binding. The number =
of cells in
> > a
> > > > > > > > -	clock-specifier. Should be <0> for "fsl,qoriq-sysclk-=
[1,2].0"
> > > > > > > > -	clocks, or <1> for "fsl,qoriq-core-pll-[1,2].0" clock=
s.
> > > > > > > > +	clock-specifier. Should be <0> for "fsl,qoriq-sysclk-=
[1,2].0"
> > > > and
> > > > > > > > +	"fsl,fman-clk-mux" clocks or <1> for "fsl,qoriq-core-=
pll-
> > > > [1,2].0".
> > > > > > > >  	For "fsl,qoriq-core-pll-1.0" clocks, the single
> > > > > > > >  	clock-specifier cell may take the following values:
> > > > > > > >  	* 0 - equal to the PLL frequency @@ -145,6 +146,18 @@
> > > > Example
> > > > > > > > for clock block and clock provider:
> > > > > > > >  			clocks =3D <&sysclk>;
> > > > > > > >  			clock-output-names =3D "platform-pll",
> > > > "platform-pll-
> > > > > > > div2";
> > > > > > > >  		};
> > > > > > > > +
> > > > > > > > +		fm0clk: fm0-clk-mux {
> > > > > > > > +			#clock-cells =3D <0>;
> > > > > > > > +			reg =3D <0x10 4>
> > > > > > > > +			compatible =3D "fsl,fman-clk-mux";
> > > > > > > > +			clocks =3D <&pll0 0>, <&pll0 1>, <&pll0 2>,
> > > > <&pll0 3>,
> > > > > > > > +				 <&platform_pll 0>, <&pll1 1>, <&pll1
> > > > 2>;
> > > > > > > > +			clock-names =3D "pll0", "pll0-div2", "pll0-div3",
> > > > > > > > +				      "pll0-div4", "platform-pll", "pll1-
> > > > div2",
> > > > > > > > +				      "pll1-div3";
> > > > > > > > +			clock-output-names =3D "fm0-clk";
> > > > > > > > +		};
> > > > > > > >  	};
> > > > > > > >  };
> > > > > > > >
> > > > > > >
> > > > > > > I don't see this register in the manuals for older DPAA c=
hips,
> > > > > > > such as
> > > > > > > p4080 or p3041.  Is it present but undocumented?  Should =
I be
> > > > > > > looking somewhere other than "Clocking Memory Map"?
> > > > > > >
> > > > > >
> > > > > > It's available only in part of the new chips (T4, T2, B4).
> > > > > > In T1024/T1040 there's only one option for FMan clock so th=
is
> > > > > > register is not
> > > > > available.
> > > > >
> > > > > So it's part of the 2.0 chassis?  I'd stick a 2.0 in there, t=
hen.
> > > > > Who knows what we may see in the future.
> > > > >
> > > >
> > > > OK,
> > > > We can go with "fsl,fman-clk-mux-1/2-0.".
> > > > In that case, we need to update FMan nodes and the clock driver=
:
> > > > https://patchwork.ozlabs.org/patch/443973/
> > > > https://patchwork.ozlabs.org/patch/461813/
> > > > I will update those patches separately.
> > > >
> > >
> > > Scott,
> > > There are 2 options:
> > > Use "fsl,fman-clk-mux-1.0" for SoC without CLKCGnHWACSR register.
> > > Use "fsl,fman-clk-mux-2.0" for SoC with CLKCGnHWACSR register.
> > > Or
> > > Use "fsl,fman-clk-mux-1.0" for SoC which support FMan V2 (Pxxxx) =
Use
> > > "fsl,fman-clk-mux-2.0" for SoC which support FMan V3 (B/T)
> >=20
> > 1.0/2.0 in the clockgen node refers to chassis version.  It has not=
hing to do
> > with FMan version.
> >=20
>=20
> I know. However there's a match: 1.0 chassis used in SoC with FMan v2=
 and 2.0 chassis in SoC with FMan v3.
>=20
> > In fact, fman should not be in the compatible because, now that I f=
ound the
> > documentation for this, I see that it's more generic than that.
> > "fman-clk-mux" should be replaced with "qoriq-hwacsr".
> >=20
> > > Using the 1st option might be confusing because core pll/mux 2.0
> > represents B/T devices and 1.0 represent Pxxxx.
> > > In this case, T1040 uses "fsl,qoriq-core-pll/mux-2.0" and "fsl,fm=
an-clk-mux-
> > 1.0".
> > > On the other hand, the second option doesn't distinguishes betwee=
n T4
> > and T1 (for example), as T1 doesn't have reg property while T4 has.
> >=20
> > How would t1040 have a so-called "fman-clk-mux" node at all if it d=
oesn't
> > have this register?
> >=20
> > I think we've made a mess of the clock bindings and this is only go=
ing to make
> > it worse.  We need to stay compatible with the mess we've made, but=
 I'm
> > inclined to say that we shouldn't add more nodes to it.
> >=20
> > Instead, have the toplevel clockgen node have a chip-based compatib=
le in
> > addition to version (e.g. compatible =3D "fsl,t4240-clockgen",
> > "fsl,qoriq-clockgen-2.0") and have the toplevel node export whateve=
r clocks
> > are needed.  Put the logic to deal with all the different dividers,=
 register
> > values, and such in code, not the device tree.  The binding should =
be focused
> > on how to encode the specifier of the exported clocks.
> >=20
>=20
> We have 2 cases:
> 	- Devices (T2/T4/B4) with CLKCG1HWACSR register.
> 	- Devices (Pxxxx, T1) without CLKCG1HWACSR register (Pxxxx devices h=
ave many options, T1 has only one option)
>=20
> For the first group, we can have " qoriq-hwacsr" property in the cloc=
k node.

No, we're not going to describe every register with its own property.
Describe the chip and let the driver be the place with the knowledge of
what each chip is like.

> Currently T4 FMan clock mux node is the following:
> 	fm1clk: fm1-clk-mux {
> 		#clock-cells =3D <0>;
> 		compatible =3D "fsl,fman-clk-mux";
> 		clocks =3D <&pll1 1>, <&pll1 2>, <&pll1 3>,
> 			 <&platform_pll 0>, <&pll0 1>, <&pll0 2>;
> 		clock-names =3D "pll1-div2", "pll1-div3", "pll1-div4",
> 			      "platform-pll", "pll0-div2", "pll0-div3";
> 		clock-output-names =3D "fm1-clk";
> 	};
> As far as I understand we need to move the node to the top level cloc=
k node.
> In addition we need to add reg property and change the name of the no=
de and the compatible.
> In that case, the driver can read this register instead of parsing th=
e RCW.

I'm having a hard time following.  What I'm suggesting is eliminating
the above and having the clockgen node itself (which already has a reg
property) be a clock source with a clock specifier encoding that
distinguishes the fman clock from other clocks.

> What about the devices of the second group?
> In this case we don't have a register to determine the source clock. =
So we need access to guts registers,=20

I never suggested taking away access to the guts registers.

> like we have currently.
> The suggestion above doesn=E2=80=99t suit for those devices.=20

How is the clock determined on those chips?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
