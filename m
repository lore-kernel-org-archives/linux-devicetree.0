From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 1/2] clk: imx8mq: add GPIO clocks to clock tree
Date: Tue, 26 Feb 2019 10:00:17 -0800
Message-ID: <155120401746.260864.13314128182651447991@swboyd.mtv.corp.google.com>
References: <1550891665-29082-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550891665-29082-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "agx@sigxcpu.org" <agx@sigxcpu.org>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Ab
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2019-02-22 19:19:03)
> i.MX8MQ has clock gate for each GPIO bank, add them
> into clock tree for GPIO driver to manage.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No change since V1, just drop 1 patch from V1 patch series.

This doesn't apply to clk-imx branch or clk-next. Please rebase and
resend.
