From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/2] phy: rockchip-emmc: should be a child device of the GRF
Date: Thu, 24 Mar 2016 16:35:16 +0100
Message-ID: <3125740.3yK6gzbokn@diego>
References: <1458825774-9957-1-git-send-email-heiko@sntech.de> <1458825774-9957-2-git-send-email-heiko@sntech.de> <56F3ED45.40107@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56F3ED45.40107@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: kishon@ti.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, ykk@rock-chips.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

Am Donnerstag, 24. M=C3=A4rz 2016, 21:36:05 schrieb Shawn Lin:
> =E5=9C=A8 2016/3/24 21:22, Heiko Stuebner =E5=86=99=E9=81=93:
> > The emmc-phy is fully enclosed in the general register files (GRF).
> > Therefore as seen from the device-tree it shouldn't be a separate
> > platform-
> > device but instead a sub-device of the GRF - using the simply-mfd
> > mechanism.
> >=20
> > The driver entered the kernel in the current merge-window, so we ca=
n still
> > adapt the binding without needing a fallback, as the binding hasn't=
 been
> > released with a full kernel yet.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> > Hi Shawn, Kishon,
> >=20
> > I didn't see this new phy driver until now, so I'd really like to g=
et
> > this sorted before the old binding solidifies :-).
> >=20
> > I'll convert the usbphy as well, but that has to have the fallback =
for
> > the old binding, so is not as urgent as these two.
> >=20
> > As mentioned in the patch description above, this is meant as a fix=
up for
> > kernel 4.6.
> >=20
> >=20
> > One thing I noticed, the emmc phy is occupying the range 0xf780-0xf=
7a0,
> > so shouldn't the reg property reflect that, like
> >=20
> >      reg =3D <0xf780 0x20>;
> >=20
> > to stay with common conventions?
>=20
> yes, and I had a fix[0] for it waiting for Kishon's reviewing.

please try to always include both me and the linux-rockchip list for Ro=
ckchip=20
specific changes in the future :-) .

In any case, I do think going with a reg property might be more standar=
d=20
conformant, once it is under the GRF. Of course only for sub-devices th=
at=20
actually occupy a real block inside the GRF like your emmc phy or the n=
ew=20
usbphy blocks.

So I guess the dts should probably look like:


grf: syscon@ff770000 {
	compatible =3D "rockchip,rk3399-grf", "syscon", "simple-mfd";
	#address-cells =3D <1>;
	#size-cells =3D <1>;

	emmcphy: phy@f780 {
		compatible =3D "rockchip,rk3399-emmc-phy";
		reg =3D <0xf780 0x20>;
		#phy-cells =3D <0>;
	};
 };


> [0]:
> http://lkml.org/lkml/2016/3/8/114
>=20
> >   .../devicetree/bindings/phy/rockchip-emmc-phy.txt     | 19
> >   ++++++++++++------- drivers/phy/phy-rockchip-emmc.c              =
     =20
> >     |  5 ++++-
> >   2 files changed, 16 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/rockchip-emmc-ph=
y.txt
> > b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt index
> > 61916f1..d711259 100644
> > --- a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
> > +++ b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
> > @@ -3,17 +3,22 @@ Rockchip EMMC PHY
> >=20
> >   Required properties:
> >    - compatible: rockchip,rk3399-emmc-phy
> >=20
> > - - rockchip,grf : phandle to the syscon managing the "general
> > -   register files"
> >=20
> >    - #phy-cells: must be 0
> >    - reg: PHY configure reg address offset in "general
> >   =20
> >      register files"
> >  =20
> >   Example:
> > -emmcphy: phy {
> > -	compatible =3D "rockchip,rk3399-emmc-phy";
> > -	rockchip,grf =3D <&grf>;
> > -	reg =3D <0xf780>;
> > -	#phy-cells =3D <0>;
> > +
> > +grf: syscon@ff770000 {
> > +	compatible =3D "rockchip,rk3399-grf", "syscon", "simple-mfd";
> > +
> > +...
> > +
> > +	emmcphy: phy@f780 {
> > +		compatible =3D "rockchip,rk3399-emmc-phy";
> > +		rockchip,grf =3D <&grf>;

I just saw I missed to remove that now obsolete rockchip,grf property.


> > +		reg =3D <0xf780>;
> > +		#phy-cells =3D <0>;
> > +	};
> >=20
> >   };
> >=20
> > diff --git a/drivers/phy/phy-rockchip-emmc.c
> > b/drivers/phy/phy-rockchip-emmc.c index 887b4c2..6ebcf3e 100644
> > --- a/drivers/phy/phy-rockchip-emmc.c
> > +++ b/drivers/phy/phy-rockchip-emmc.c
> > @@ -176,7 +176,10 @@ static int rockchip_emmc_phy_probe(struct
> > platform_device *pdev)>=20
> >   	struct regmap *grf;
> >   	unsigned int reg_offset;
> >=20
> > -	grf =3D syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,g=
rf");
> > +	if (!dev->parent || !dev->parent->of_node)
> > +		return -ENODEV;
> > +
> > +	grf =3D syscon_node_to_regmap(dev->parent->of_node);
> >=20
> >   	if (IS_ERR(grf)) {
> >   =09
> >   		dev_err(dev, "Missing rockchip,grf property\n");
> >   		return PTR_ERR(grf);
