From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v15 5/5] clk: imx: Add clock driver for i.MX8MQ CCM
Date: Mon, 03 Dec 2018 10:18:12 -0800
Message-ID: <154386109297.88331.12375261013738475965@swboyd.mtv.corp.google.com>
References: <1543661502-18573-1-git-send-email-abel.vesa@nxp.com>
 <1543661502-18573-6-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543661502-18573-6-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng DONG <aisheng.dong@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <anson.huang@nxp.com>, Jacky Bai <ping.bai@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Abel Vesa (2018-12-01 02:52:15)
> Add driver for the Clock Control Module found on i.MX8MQ.
> =

> Signed-off-by: Anson Huang <anson.huang@nxp.com>
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---

Applied to clk-next

but checkpatch complains about the parent arrays being const char *
const instead of const char *. Can you send a followup to fix that?
