Return-Path: <SRS0=yCjh=IY=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 0/4] arm64: dts: renesas: r8a77990 and ebisu: Enable
 USB2.0 host
Date: Wed, 6 Jun 2018 09:31:32 +0000
Message-ID: <OSBPR01MB2293C8F61DAE97C1DADF6DFFD8650@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1528268171-19276-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180606091606.ac5lqgknevfrcq57@verge.net.au>
In-Reply-To: <20180606091606.ac5lqgknevfrcq57@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Wednesday, June 6, 2018 6:16 PM
>=20
> On Wed, Jun 06, 2018 at 03:56:07PM +0900, Yoshihiro Shimoda wrote:
> > This patch set is based on renesas-drivers.git /
> > renesas-drivers-2018-06-05-v4.17 tag.
> >
> > About dt-bindings of "renesas,usb2-phy-r8a77990", I submitted a patch:
> > https://patchwork.kernel.org/patch/10449723/
> >
> > But, the phy-rcar-gen3-usb2 driver works on the board without the bindi=
ngs
> > because "renesas,rcar-gen3-usb2-phy" can bind the driver.
> >
> > Also, for now, I don't try to add/enable USB2.0 peripheral on the board
> > because the phy driver needs some modifications.
> >
> > Yoshihiro Shimoda (4):
> >   arm64: dts: renesas: r8a77990: add usb2_phy device node
> >   arm64: dts: renesas: r8a77990: add USB2.0 host device nodes
> >   arm64: dts: renesas: r8a77990: ebisu: enable usb2_phy0
> >   arm64: dts: renesas: r8a77990: ebisu: enable USB2.0 host
> >
> >  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 20 ++++++++++++++
> >  arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 37 ++++++++++++++++++=
++++++++
> >  2 files changed, 57 insertions(+)
>=20
> Hi Shomoda-san,
>=20
> the contents of this series looks good to me.  However, given Olof
> Johansson's recent comments in ("Re: [GIT PULL] Renesas ARM64 Based SoC D=
T
> Updates for v4.18") please consider squashing this series into a single
> patch and reposting.

Sure. I'll resubmit v2 patch as a single patch.

Best regards,
Yoshihiro Shimoda

> Thanks!
