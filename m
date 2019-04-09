From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 3/3] phy: renesas: rcar-gen3-usb2: enable/disable
 independent irqs
Date: Tue, 9 Apr 2019 09:49:42 +0000
Message-ID: <TYAPR01MB4271AFFCCC0B2D1215227746D82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1554120083-29990-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY1PR01MB17706362E3C2AB67C3ABD1E7C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TY1PR01MB17706362E3C2AB67C3ABD1E7C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hello Fabrizio-san,

> From: Fabrizio Castro, Sent: Wednesday, April 3, 2019 7:49 PM
>=20
> Hello Yoshihiro-san,
>=20
> Thank you for your partch!
>=20
> > From: devicetree-owner@vger.kernel.org <devicetree-owner@vger.kernel.or=
g> On Behalf Of Yoshihiro Shimoda
> > Sent: 01 April 2019 13:01
> > Subject: [PATCH 3/3] phy: renesas: rcar-gen3-usb2: enable/disable indep=
endent irqs
> >
> > Since the previous code enabled/disabled the irqs both OHCI and EHCI,
> > it is possible to cause unexpected interruptions. To avoid this,
> > this patch creates multiple phy instances from phandle and
> > enables/disables independent irqs by the instances.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Tested-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thank you for your review and test!

<snip>
> > +static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
> > +{
> > +	enum usb_dr_mode candidate =3D USB_DR_MODE_UNKNOWN, tmp;
> > +	int i;
> > +
> > +	/*
> > +	 * If one of device nodes has other dr_mode except UNKNOWN,
> > +	 * this function returns UNKNOWN.
> > +	 */
> > +	for (i =3D 0; i < NUM_OF_PHYS; i++) {
> > +		tmp =3D of_usb_get_dr_mode_by_phy(np, i);
>=20
> We are calling of_usb_get_dr_mode_by_phy with i =3D=3D 0, but we don't do=
cument it
> in the dt-bindings document?

This (i =3D=3D 0) is for backward compatibility. So, I'll add such a commen=
t on the driver.

Best regards,
Yoshihiro Shimoda
