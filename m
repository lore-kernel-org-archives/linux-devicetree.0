From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] phy: qualcomm: usb: Add Super-Speed PHY driver
Date: Thu, 03 Jan 2019 15:30:06 -0800
Message-ID: <154655820653.15366.12989225525562032193@swboyd.mtv.corp.google.com>
References: <1544176558-7946-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1544176558-7946-3-git-send-email-jorge.ramirez-ortiz@linaro.org> <154533779333.79149.17234544366247143930@swboyd.mtv.corp.google.com> <2f38642e-27a0-0fd7-928e-8e782d0bc7c6@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2f38642e-27a0-0fd7-928e-8e782d0bc7c6@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, gregkh@linuxfoundation.org, kishon@ti.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jorge Ramirez (2018-12-26 09:53:08)
> On 12/20/18 21:29, Stephen Boyd wrote:
> > Quoting Jorge Ramirez-Ortiz (2018-12-07 01:55:58)
> >=20
> >> +       struct regulator *vdda1p8;
> >> +       struct regulator *vbus;
> >> +       struct regulator *vdd;
> >> +       unsigned int vdd_levels[LEVEL_NUM];
> >> +};
> >> +
> >> +static inline void qcom_ssphy_updatel(void __iomem *addr, u32 mask, u=
32 val)
> >> +{
> >> +       writel((readl(addr) & ~mask) | val, addr);
> >> +}
> >> +
> >> +static int qcom_ssphy_config_vdd(struct ssphy_priv *priv,
> >> +                                enum phy_vdd_level level)
> >> +{
> >> +       return regulator_set_voltage(priv->vdd,
> >> +                                    priv->vdd_levels[level],
> >> +                                    priv->vdd_levels[LEVEL_MAX]);
> >=20
> > regulator_set_voltage(reg, 0, max) is very suspicious. It's voltage
> > corners where the voltages are known?
>=20
> sorry I dont understand the question
>=20
> this regulator on the ss phy wold be
> vreg_l3_1p05: l3 {
>                 regulator-min-microvolt =3D <976000>;
>                 regulator-max-microvolt =3D <1160000>;

Is this also the CX or MX voltage for the SoC? There would be a pin like
VDDCX or VDDMX on the SoC part that is connected to this regulator if
that's the case. Because you have "LEVEL" in the code it makes it sounds
like it's voltage corners here so I suspect this is mapping into the
voltage corner stuff that qcom has.

> };
> >=20
> >> +}
> >> +
> >> +static int qcom_ssphy_ldo_enable(struct ssphy_priv *priv)
> >> +{
> >> +       int ret;
> >> +
> >> +       ret =3D regulator_set_load(priv->vdda1p8, 23000);
> >=20
> > Do you need to do this? Why can't the regulator be in high power mode
> > all the time and then go low power when it's disabled?
>=20
> this regulator is shared with the usb hs phy and each (ss/hs) have=20
> different load requirements. why would it be wrong for the ss phy to=20
> announce its needs (which will differ from those of the hs phy)?

Yes they have different load requirements, but in the end I would guess
they always push the regulator into high power mode when the device is
active and drop the load requirement when it's inactive. If it matches
the enable state of the regulator then there isn't much need for setting
a load explicitly besides stating that when the regulator is on it
should be in high power mode and when it's off it should be in low power
mode and off.
