From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 3/3] phy: qcom-qmp: Add SM8150 QMP UFS PHY support
Date: Wed, 04 Sep 2019 16:23:05 -0700
Message-ID: <5d70475a.1c69fb81.650ed.0ad0@mx.google.com>
References: <20190904100835.6099-1-vkoul@kernel.org> <20190904100835.6099-4-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904100835.6099-4-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-09-04 03:08:35)
> @@ -878,6 +883,93 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pc=
s_tbl[] =3D {
>         QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
>  };
> =20
> +static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] =3D {
> +       QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_SYSCLK_EN_SEL, 0xD9),

Can you use lowercase hex?

> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_HSCLK_SEL, 0x11),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_HSCLK_HS_SWITCH_SEL, 0x00),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_LOCK_CMP_EN, 0x01),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_VCO_TUNE_MAP, 0x02),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_PLL_IVCO, 0x0F),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_VCO_TUNE_INITVAL2, 0x00),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_BIN_VCOCAL_HSCLK_SEL, 0x11),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_DEC_START_MODE0, 0x82),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_CP_CTRL_MODE0, 0x06),

Gotta love the pile of numbers and register writes...
