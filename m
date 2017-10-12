From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v5 2/4] phy: rcar-gen3-usb2: use enum phy_mode in the
 role_store()
Date: Thu, 12 Oct 2017 10:47:27 +0000
Message-ID: <TY1PR06MB0992CD58C946C8C78191ACA1D84B0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1507628490-7944-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1507628490-7944-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <743b1a5b-7c5b-1974-b5d3-a75a17d6b27a@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <743b1a5b-7c5b-1974-b5d3-a75a17d6b27a@ti.com>
Content-Language: ja-JP
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

> From: Kishon Vijay Abraham I [mailto:kishon@ti.com], Sent: Wednesday, Oct=
ober 11, 2017 5:28 PM
>=20
> Hi,
>=20
> On Tuesday 10 October 2017 03:11 PM, Yoshihiro Shimoda wrote:
> > This patch modifies the role_store() to use "enum phy_mode" instead
> > of the local "bool" for host/device mode selection.
>=20
> looks good except for one minor comment..

Thank you for your review!

> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 29 ++++++++++++++++++------=
-----
> >  1 file changed, 18 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/ren=
esas/phy-rcar-gen3-usb2.c
> > index e00e99a..7314b49 100644
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > @@ -219,33 +219,40 @@ static bool rcar_gen3_is_host(struct rcar_gen3_ch=
an *ch)
> >  	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
> >  }
> >
> > +static enum phy_mode rcar_gen3_get_phy_mode(struct rcar_gen3_chan *ch)
> > +{
> > +	if (rcar_gen3_is_host(ch))
> > +		return PHY_MODE_USB_HOST;
> > +	else
>=20
> the else here is not required.

I got it. I sent v6 patch set a few hour ago.

Best regards,
Yoshihiro Shimoda

> Thanks
> Kishon
