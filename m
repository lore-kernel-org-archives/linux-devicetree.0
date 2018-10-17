From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 6/7] clk: imx6q: add mmdc0 ipg clock
Date: Wed, 17 Oct 2018 11:16:57 -0700
Message-ID: <153980021754.5275.12236034739532021121@swboyd.mtv.corp.google.com>
References: <1535701998-20443-1-git-send-email-Anson.Huang@nxp.com>
 <1535701998-20443-7-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535701998-20443-7-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>, aisheng.dong@nxp.com, clement.peron@devialet.com, colin.didier@devialet.com, devicetree@vger.kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, matteo.lisi@engicam.com, michael@amarulasolutions.com, mturquette@baylibre.com, ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, shengjiu.wang@nxp.com
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2018-08-31 00:53:17)
> i.MX6Q has MMDC0 ipg clock in CCM CCGR, add it into
> clock tree for clock management.
> =

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Applied to clk-next
