From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 1/4] phy: sun4i-usb: support PHY0 on H3 in
 MUSB mode
Date: Tue, 17 Jan 2017 09:26:54 +0800
Message-ID: <20170117042714.R8fi09wn@smtp2p.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB67F6XBQKGQEJOQXQGI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B41=E6=9C=8817=E6=97=A5 06:57=E4=BA=8E Ond=C5=99ej Jirman <megou=
s@megous.com>=E5=86=99=E9=81=93=EF=BC=9A
>
> Dne 16.1.2017 v 20:14 Icenowy Zheng napsal(a):=20
> > The PHY0 on H3 can be wired either to MUSB controller or OHCI/EHCI=20
> > controller.=20
> >=20
> > The original driver wired it to OHCI/EHCI controller; however, as the=
=20
> > code to use PHY0 as OHCI/EHCI is missing, it makes the PHY fully=20
> > unusable.=20
> >=20
> > Rename the register (according to its function and the name in BSP=20
> > driver), and remove the code which wires the PHY0 to OHCI/EHCI, as MUSB=
=20
> > can support both peripheral and host mode (although the host mode of=20
> > MUSB is buggy).=20
> >=20
> > The register that is renamed is now unused, as its initial value is jus=
t=20
> > MUSB mode. However, when OHCI/EHCI mode support is added, the register=
=20
> > can be used again.=20
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > ---=20
> >=C2=A0 drivers/phy/phy-sun4i-usb.c | 25 +++++++++----------------=20
> >=C2=A0 1 file changed, 9 insertions(+), 16 deletions(-)=20
> >=20
> > diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c=
=20
> > index bf28a0fdd569..6b193a635c6b 100644=20
> > --- a/drivers/phy/phy-sun4i-usb.c=20
> > +++ b/drivers/phy/phy-sun4i-usb.c=20
> > @@ -49,7 +49,7 @@=20
> >=C2=A0 #define REG_PHYBIST 0x08=20
> >=C2=A0 #define REG_PHYTUNE 0x0c=20
> >=C2=A0 #define REG_PHYCTL_A33 0x10=20
> > -#define REG_PHY_UNK_H3 0x20=20
> > +#define REG_PHY_OTGCTL 0x20=20
>
> You have added REG_PHY_OTGCTL, but it is not used below.=20

See the commit message.

I know it's now unused :-) It's just because the default mode is musb.

>
> regards,=20
> =C2=A0 o.=20
>
> >=C2=A0 #define REG_PMU_UNK1 0x10=20
> >=C2=A0=20
> > @@ -269,23 +269,16 @@ static int sun4i_usb_phy_init(struct phy *_phy)=
=20
> >=C2=A0 writel(val & ~2, phy->pmu + REG_PMU_UNK1);=20
> >=C2=A0 }=20
> >=C2=A0=20
> > - if (data->cfg->type =3D=3D sun8i_h3_phy) {=20
> > - if (phy->index =3D=3D 0) {=20
> > - val =3D readl(data->base + REG_PHY_UNK_H3);=20
> > - writel(val & ~1, data->base + REG_PHY_UNK_H3);=20
> > - }=20
> > - } else {=20
> > - /* Enable USB 45 Ohm resistor calibration */=20
> > - if (phy->index =3D=3D 0)=20
> > - sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);=20
> > + /* Enable USB 45 Ohm resistor calibration */=20
> > + if (phy->index =3D=3D 0)=20
> > + sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);=20
> >=C2=A0=20
> > - /* Adjust PHY's magnitude and rate */=20
> > - sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE, 0x14, 5);=20
> > + /* Adjust PHY's magnitude and rate */=20
> > + sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE, 0x14, 5);=20
> >=C2=A0=20
> > - /* Disconnect threshold adjustment */=20
> > - sun4i_usb_phy_write(phy, PHY_DISCON_TH_SEL,=20
> > - =C2=A0=C2=A0=C2=A0 data->cfg->disc_thresh, 2);=20
> > - }=20
> > + /* Disconnect threshold adjustment */=20
> > + sun4i_usb_phy_write(phy, PHY_DISCON_TH_SEL,=20
> > + =C2=A0=C2=A0=C2=A0 data->cfg->disc_thresh, 2);=20
> >=C2=A0=20
> >=C2=A0 sun4i_usb_phy_passby(phy, 1);=20
> >=C2=A0=20
> >=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
