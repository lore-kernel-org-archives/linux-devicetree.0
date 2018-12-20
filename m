From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] phy: qualcomm: usb: Add Super-Speed PHY driver
Date: Thu, 20 Dec 2018 12:29:53 -0800
Message-ID: <154533779333.79149.17234544366247143930@swboyd.mtv.corp.google.com>
References: <1544176558-7946-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1544176558-7946-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544176558-7946-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jorge.ramirez-ortiz@linaro.org, kishon@ti.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2018-12-07 01:55:58)
> From: Shawn Guo <shawn.guo@linaro.org>
>=20
> Driver to control the Synopsys SS PHY 1.0.0 implemeneted in QCS404
>=20
> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original code.
>=20
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

chain should be swapped?

> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> ---
> diff --git a/drivers/phy/qualcomm/phy-qcom-usb-ss.c b/drivers/phy/qualcom=
m/phy-qcom-usb-ss.c
> new file mode 100644
> index 0000000..7b6a55e
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
> +
> +struct ssphy_priv {
> +       void __iomem *base;
> +       struct device *dev;
> +       struct reset_control *reset_com;
> +       struct reset_control *reset_phy;
> +       struct clk *clk_ref;
> +       struct clk *clk_phy;
> +       struct clk *clk_pipe;

Use bulk clk APIs? And just get and enable all the clks?

> +       struct regulator *vdda1p8;
> +       struct regulator *vbus;
> +       struct regulator *vdd;
> +       unsigned int vdd_levels[LEVEL_NUM];
> +};
> +
> +static inline void qcom_ssphy_updatel(void __iomem *addr, u32 mask, u32 =
val)
> +{
> +       writel((readl(addr) & ~mask) | val, addr);
> +}
> +
> +static int qcom_ssphy_config_vdd(struct ssphy_priv *priv,
> +                                enum phy_vdd_level level)
> +{
> +       return regulator_set_voltage(priv->vdd,
> +                                    priv->vdd_levels[level],
> +                                    priv->vdd_levels[LEVEL_MAX]);

regulator_set_voltage(reg, 0, max) is very suspicious. It's voltage
corners where the voltages are known?

> +}
> +
> +static int qcom_ssphy_ldo_enable(struct ssphy_priv *priv)
> +{
> +       int ret;
> +
> +       ret =3D regulator_set_load(priv->vdda1p8, 23000);

Do you need to do this? Why can't the regulator be in high power mode
all the time and then go low power when it's disabled?

> +       if (ret < 0) {
> +               dev_err(priv->dev, "Failed to set regulator1p8 load\n");
> +               return ret;
> +       }
> +
> +       ret =3D regulator_set_voltage(priv->vdda1p8, 1800000, 1800000);

This looks unnecessary. The 1.8V regulator sounds like it better be 1.8V
so board constraints should enforce that. All that should be here is
enabling the regulator.

> +       if (ret) {
> +               dev_err(priv->dev, "Failed to set regulator1p8 voltage\n"=
);
> +               goto put_vdda1p8_lpm;
> +       }
> +
> +       ret =3D regulator_enable(priv->vdda1p8);
> +       if (ret) {
> +               dev_err(priv->dev, "Failed to enable regulator1p8\n");
> +               goto unset_vdda1p8;
> +       }
> +
> +       return ret;
> +
> +       /* rollback regulator changes */
> +
> +unset_vdda1p8:
> +       regulator_set_voltage(priv->vdda1p8, 0, 1800000);
> +
> +put_vdda1p8_lpm:
> +       regulator_set_load(priv->vdda1p8, 0);
> +
> +       return ret;
> +}
> +
> +static void qcom_ssphy_ldo_disable(struct ssphy_priv *priv)
> +{
> +       regulator_disable(priv->vdda1p8);
> +       regulator_set_voltage(priv->vdda1p8, 0, 1800000);

Urgh why?

> +       regulator_set_load(priv->vdda1p8, 0);
> +}
