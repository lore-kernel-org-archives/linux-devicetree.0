From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 3/3] phy: renesas: rcar-gen3-usb2: enable/disable
 independent irqs
Date: Tue, 9 Apr 2019 09:47:49 +0000
Message-ID: <TYAPR01MB4271AF6C14F4A99902FAFA2FD82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1554120083-29990-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190403091939.qguys2dftombenpb@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403091939.qguys2dftombenpb@verge.net.au>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon-san,

> From: Simon Horman, Sent: Wednesday, April 3, 2019 6:20 PM
>=20
> Hi Shimoda-san,
>=20
> On Mon, Apr 01, 2019 at 09:01:23PM +0900, Yoshihiro Shimoda wrote:
> > Since the previous code enabled/disabled the irqs both OHCI and EHCI,
> > it is possible to cause unexpected interruptions. To avoid this,
> > this patch creates multiple phy instances from phandle and
> > enables/disables independent irqs by the instances.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> I noted a few nits below but overall this looks good to me.
>=20
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thank you for your review!

<snip>
> > +#define NUM_OF_PHYS			4
> > +#define PHY_INDEX_BOTH_HC		0
> > +#define PHY_INDEX_OHCI			1
> > +#define PHY_INDEX_EHCI			2
> > +#define PHY_INDEX_HSUSB			3
>=20
> nit: I think the above #defines would be better expressed as an enum.

I'll modify it.

<snip>
> > +static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
> > +{
> > +	enum usb_dr_mode candidate =3D USB_DR_MODE_UNKNOWN, tmp;
>=20
> nit: I think that there could be a better name for tmp, f.e. mode
> nit: The scope of tmp could be limited to inside the for loop.

I'll modify it.

Best regards,
Yoshihiro Shimoda
