From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v15 4/5] clk: imx: Add imx composite clock
Date: Mon, 03 Dec 2018 10:17:25 -0800
Message-ID: <154386104535.88331.10447848499014532461@swboyd.mtv.corp.google.com>
References: <1543661502-18573-1-git-send-email-abel.vesa@nxp.com>
 <1543661502-18573-5-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543661502-18573-5-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng DONG <aisheng.dong@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Abel Vesa (2018-12-01 02:52:14)
> Since a lot of clocks on imx8m are formed by a mux, gate, predivider and
> divider, the idea here is to combine all of those into one composite cloc=
k,
> but we need to deal with both predivider and divider at the same time and
> therefore we add the imx8m_clk_composite_divider_ops and register
> the composite clock with those.
> =

> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Suggested-by: Sascha Hauer <s.hauer@pengutronix.de>
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---

Applied to clk-next
