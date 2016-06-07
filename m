From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Tue, 7 Jun 2016 10:19:18 -0700
Message-ID: <20160607171918.GA25234@roeck-us.net>
References: <1465204804-31161-1-git-send-email-frank.wang@rock-chips.com>
 <3404512.IukckmNc6l@diego>
 <CABXOdTexRR80Omoryr1e-R=tOYE9cq54Z3f2XU_qPCAJFeT8Yg@mail.gmail.com>
 <1622841.pIRHF5Sh6p@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1622841.pIRHF5Sh6p@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Guenter Roeck <groeck@google.com>, Frank Wang <frank.wang@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, Guenter Roeck <groeck@chromium.org>, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, Kever Yang <kever.yang@rock-chips.com>, huangtao@rock-chips.com, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 07, 2016 at 04:12:29PM +0200, Heiko St=FCbner wrote:
> Hi Guenter,
>=20
> Am Dienstag, 7. Juni 2016, 06:19:45 schrieb Guenter Roeck:
> > On Tue, Jun 7, 2016 at 2:54 AM, Heiko St=FCbner <heiko@sntech.de> w=
rote:
> > > Hi Frank,
> > >=20
> > > Am Montag, 6. Juni 2016, 17:20:04 schrieb Frank Wang:
> > >> The newer SoCs (rk3366, rk3399) take a different usb-phy IP bloc=
k
> > >> than rk3288 and before, and most of phy-related registers are al=
so
> > >> different from the past, so a new phy driver is required necessa=
rily.
> > >>=20
> > >> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> > >> ---
> > >=20
> > > [...]
> > >=20
> > >> +static int rockchip_usb2phy_probe(struct platform_device *pdev)
> > >> +{
> > >> +     struct device *dev =3D &pdev->dev;
> > >> +     struct device_node *np =3D dev->of_node;
> > >> +     struct device_node *child_np;
> > >> +     struct phy_provider *provider;
> > >> +     struct rockchip_usb2phy *rphy;
> > >> +     const struct of_device_id *match;
> > >> +     int index, ret;
> > >> +
> > >> +     rphy =3D devm_kzalloc(dev, sizeof(*rphy), GFP_KERNEL);
> > >> +     if (!rphy)
> > >> +             return -ENOMEM;
> > >> +
> > >> +     match =3D of_match_device(dev->driver->of_match_table, dev=
);
> > >> +     if (!match || !match->data) {
> > >> +             dev_err(dev, "phy configs are not assigned!\n");
> > >> +             return -EINVAL;
> > >> +     }
> > >> +
> > >> +     if (!dev->parent || !dev->parent->of_node)
> > >> +             return -EINVAL;
> > >> +
> > >> +     rphy->grf =3D syscon_node_to_regmap(dev->parent->of_node);
> > >> +     if (IS_ERR(rphy->grf))
> > >> +             return PTR_ERR(rphy->grf);
> > >> +
> > >> +     rphy->dev =3D dev;
> > >> +     rphy->phy_cfg =3D match->data;
> > >> +     platform_set_drvdata(pdev, rphy);
> > >> +
> > >> +     ret =3D rockchip_usb2phy_clk480m_register(rphy);
> > >> +     if (ret) {
> > >> +             dev_err(dev, "failed to register 480m output clock=
\n");
> > >> +             return ret;
> > >> +     }
> > >> +
> > >> +     rphy->vbus_host =3D devm_regulator_get_optional(dev, "vbus=
_host");
> > >> +     if (IS_ERR(rphy->vbus_host)) {
> > >> +             ret =3D PTR_ERR(rphy->vbus_host);
> > >> +             if (ret =3D=3D -EPROBE_DEFER)
> > >> +                     return ret;
> > >> +
> > >> +             dev_info(dev, "vbus_host regulator is not assigned=
!\n");
> > >> +             rphy->vbus_host =3D NULL;
> > >> +     } else {
> > >> +             ret =3D regulator_enable(rphy->vbus_host);
> > >> +             if (ret)
> > >> +                     return ret;
> > >> +     }
> > >> +
> > >> +     index =3D 0;
> > >> +     for_each_available_child_of_node(np, child_np) {
> > >> +             struct rockchip_usb2phy_port *rport =3D &rphy->por=
ts[index];
> > >> +             struct phy *phy;
> > >> +
> > >> +             phy =3D devm_phy_create(dev, child_np,
> > >> &rockchip_usb2phy_ops);
> > >> +             if (IS_ERR(phy)) {
> > >> +                     dev_err(dev, "failed to create phy\n");
> > >> +                     ret =3D PTR_ERR(phy);
> > >> +                     goto put_child;
> > >> +             }
> > >> +
> > >> +             rport->phy =3D phy;
> > >> +
> > >> +             /* initialize otg/host port separately */
> > >> +             if (!of_node_cmp(child_np->name, "host-port")) {
> > >> +                     ret =3D rockchip_usb2phy_host_port_init(rp=
hy, rport,
> > >> +                                                           chil=
d_np);
> > >> +                     if (ret)
> > >> +                             goto put_child;
> > >> +             }
> > >> +
> > >> +             phy_set_drvdata(rport->phy, rport);
> > >> +
> > >> +             /* to prevent out of boundary */
> > >> +             if (++index >=3D rphy->phy_cfg->num_ports)
> > >> +                     break;
> > >> +     }
> > >> +
> > >> +     provider =3D devm_of_phy_provider_register(dev, of_phy_sim=
ple_xlate);
> > >> +     return PTR_ERR_OR_ZERO(provider);
> > >> +
> > >> +put_child:
> > >> +     of_node_put(child_np);
> > >> +     return ret;
> > >> +}
> > >> +
> > >> +static const struct rockchip_usb2phy_cfg rk3366_phy_cfgs =3D {
> > >> +     .num_ports      =3D 2,
> > >> +     .clkout_ctl     =3D { 0x0724, 15, 15, 1, 0 },
> > >> +     .port_cfgs      =3D {
> > >> +             [USB2PHY_PORT_HOST] =3D {
> > >> +                     .phy_sus        =3D { 0x0728, 15, 0, 0, 0x=
1d1 },
> > >> +                     .ls_det_en      =3D { 0x0680, 4, 4, 0, 1 }=
,
> > >> +                     .ls_det_st      =3D { 0x0690, 4, 4, 0, 1 }=
,
> > >> +                     .ls_det_clr     =3D { 0x06a0, 4, 4, 0, 1 }=
,
> > >> +                     .utmi_ls        =3D { 0x049c, 14, 13, 0, 1=
 },
> > >> +                     .utmi_hstdet    =3D { 0x049c, 12, 12, 0, 1=
 }
> > >> +             }
> > >> +     },
> > >> +};
> > >=20
> > > I also realized that the rk3399 has two of those phy-blocks, so I=
 think
> > > we'll need to adapt your data storage mechanism a tiny bit. Maybe
> > > something like the following:
> > >=20
> > > In the dts:
> > >=20
> > > grf: syscon@ff770000 {
> > >=20
> > >        compatible =3D "rockchip,rk3366-grf", "syscon", "simple-mf=
d";
> > >       =20
> > >         ...
> > >       =20
> > >        u2phy: usb2-phy@700 {
> > >       =20
> > >                compatible =3D "rockchip,rk3366-usb2phy";
> > >               =20
> > >                 reg =3D <0x700 0x2c>;
> > >                 ...
> > >       =20
> > >        };
> > >=20
> > > };
> > >=20
> > > In the driver
> > >=20
> > > static const struct rockchip_usb2phy_cfg rk3366_phy_cfgs[] =3D {
> > >=20
> > >         {
> > >        =20
> > >                 .reg =3D 0x700,
> > >                 .num_ports      =3D 2,
> > >                 .clkout_ctl     =3D { 0x0724, 15, 15, 1, 0 },
> > >                 .port_cfgs      =3D {
> > >                =20
> > >                         [USB2PHY_PORT_HOST] =3D {
> > >                        =20
> > >                                 .phy_sus        =3D { 0x0728, 15,=
 0, 0,
> > >                                 0x1d1 },
> > >                                 ...
> > >                        =20
> > >                         }
> > >                =20
> > >                 },
> > >        =20
> > >         },
> > >=20
> > > };
> > >=20
> > > and in _probe then simply use the correct array entry matching th=
e dts reg
> > > property.
> > >=20
> > > On the rk3399 this would then probably be
> > >=20
> > >        u2phy0: phy@e450 {
> > >       =20
> > >                compatible =3D "rockchip,rk3366-usb2phy";
> > >               =20
> > >                 reg =3D <0xe450 0x10>;
> > >                 ...
> > >        =20
> > >         };
> > >       =20
> > >        u2phy1: phy@e460 {
> > >       =20
> > >                compatible =3D "rockchip,rk3366-usb2phy";
> > >               =20
> > >                 reg =3D <0xe460 0x10>;
> > >                 ...
> > >        =20
> > >         };
> > >=20
> > > This is slightly similar to what we do with the emmc-phy. But als=
o as the
> > > usbphys differ in a lot of way, this is really only used to match=
 to the
> > > data block.
> > >=20
> > > This only affects the match-data selection and the rest of the dr=
iver does
> > > not need to be changed for this.
> >=20
> > Would this replace the host-port property ?
>=20
> nope ... each phy-block has two ports (host + otg). Franks rk3366 has=
 one phy-
> block while the rk3399 has two phy blocks (with two ports on each).
>=20
Ah, now I understand. Yes, I think you are right, it would make sense
to add this now.

Guenter
