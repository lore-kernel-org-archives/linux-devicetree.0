From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 2/3] clk: imx7d: correct enet clock CCGR registers
Date: Fri, 01 Jun 2018 12:18:02 -0700
Message-ID: <152788068298.225090.12195731726234176520@swboyd.mtv.corp.google.com>
References: <1526605266-18464-1-git-send-email-Anson.Huang@nxp.com>
 <1526605266-18464-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526605266-18464-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>, adriana.reus@nxp.com, fabio.estevam@nxp.com, kernel@pengutronix.de, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, rui.silva@linaro.org, shawnguo@kernel.org, stefan@agner.ch
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2018-05-17 18:01:05)
> Correct enet clock gates as below:
> =

> CCGR6: IMX7D_ENET_AXI_ROOT_CLK (enet1 and enet2 bus clocks)
> CCGR112: IMX7D_ENET1_TIME_ROOT_CLK, IMX7D_ENET1_IPG_ROOT_CLK
> CCGR113: IMX7D_ENET2_TIME_ROOT_CLK, IMX7D_ENET2_IPG_ROOT_CLK
> =

> Just rename unused IMX7D_ENETx_REF_ROOT_CLK for
> IMX7D_ENETx_IPG_ROOT_CLK instead of adding new clocks.
> =

> Based on Andy Duan's patch from the NXP kernel tree.
> =

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Applied to clk-next
