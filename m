From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 1/3] clk: imx7d: correct enet phy ref clock gates
Date: Fri, 01 Jun 2018 12:18:00 -0700
Message-ID: <152788068032.225090.8543051846810232845@swboyd.mtv.corp.google.com>
References: <1526605266-18464-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526605266-18464-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>, adriana.reus@nxp.com, fabio.estevam@nxp.com, kernel@pengutronix.de, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, rui.silva@linaro.org, shawnguo@kernel.org, stefan@agner.ch
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2018-05-17 18:01:04)
> IMX7D_ENET_PHY_REF_ROOT_DIV supplies clock for PHY directly,
> there is no clock gate after it, rename it to
> IMX7D_ENET_PHY_REF_ROOT_CLK to avoid device tree change.
> =

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Applied to clk-next
