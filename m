From: Liberman Igal <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH] powerpc/fsl: Update fman dt binding with pcs-phy and
 tbi-phy
Date: Tue, 22 Dec 2015 16:10:20 +0000
Message-ID: <DM2PR03MB509A7437BA4A9A28DDE77CFE6E50@DM2PR03MB509.namprd03.prod.outlook.com>
References: <1450757888-14216-1-git-send-email-igal.liberman@freescale.com>
 <1450799843.28718.56.camel@infinera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450799843.28718.56.camel-27rvihrghlNWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joakim Tjernlund <Joakim.Tjernlund-27rvihrghlNWk0Htik3J/w@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Madalin-Cristian Bucur <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Regards,
Igal Liberman

> -----Original Message-----
> From: Joakim Tjernlund [mailto:Joakim.Tjernlund-27rvihrghlNWk0Htik3J/w@public.gmane.org]
> Sent: Tuesday, December 22, 2015 5:57 PM
> To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Liberman Igal-B31950
> <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Wood Scott-B07421 <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>; Xie Shaohui-B21989
> <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>; Bucur Madalin-Cristian-B32716
> <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Subject: Re: [PATCH] powerpc/fsl: Update fman dt binding with pcs-phy=
 and
> tbi-phy
>=20
> On Tue, 2015-12-22 at 06:18 +0200, igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> > From: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >
> > Signed-off-by: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> > =A0.../devicetree/bindings/powerpc/fsl/fman.txt=A0=A0=A0=A0=A0=A0=A0=
|=A0=A0=A039
> > ++++++++++++++++++++
> > =A01 file changed, 39 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> > b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> > index 1fc5328..7a6d7c3 100644
> > --- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> > +++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> > @@ -315,6 +315,16 @@ PROPERTIES
> > =A0		Value type: <phandle>
> > =A0		Definition: A phandle for 1EEE1588 timer.
> >
> > +- pcsphy-handle
> > +		Usage required for "fsl,fman-memac" MACs
> > +		Value type: <phandle>
> > +		Definition: A phandle for pcsphy.
> > +
> > +- tbi-handle
> > +		Usage required for "fsl,fman-dtsec" MACs
> > +		Value type: <phandle>
> > +		Definition: A phandle for tbiphy.
> > +
> > =A0EXAMPLE
> >
> > =A0fman1_tx28: port@a8000 {
> > @@ -340,6 +350,7 @@ ethernet@e0000 {
> > =A0	reg =3D <0xe0000 0x1000>;
> > =A0	fsl,fman-ports =3D <&fman1_rx8 &fman1_tx28>;
> > =A0	ptp-timer =3D <&ptp-timer>;
> > +	tbi-handle =3D <&tbi0>;
> > =A0};
> >
> >
> >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D
> > @@ -415,6 +426,13 @@ PROPERTIES
> > =A0		The settings and programming routines for internal/external
> > =A0		MDIO are different. Must be included for internal MDIO.
> >
> > +For internal PHY device on internal mdio bus, a PHY node should be
> created.
> > +See the definition of the PHY node in booting-without-of.txt for a=
n
> > +example of how to define a PHY (Internal PHY has no interrupt line=
).
> > +- For "fsl,fman-mdio" compatible internal mdio bus, the PHY is TBI=
 PHY.
> > +- For "fsl,fman-memac-mdio" compatible internal mdio bus, the PHY =
is
> > +PCS PHY,
> > +=A0=A0PCS PHY addr must be '0'.
>=20
> Will this replace the need for fixed PHYs ?
>=20

Hi Jocke,

No, this is internal PCS configuration which required for both types of=
 links.
The configuration for fixed links is different, but we use the same met=
hod.

Igal

> =A0 =A0Jocke
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
