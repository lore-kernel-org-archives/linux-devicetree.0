From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RESEND V2 1/2] clk: imx8mq: add GPIO clocks to clock tree
Date: Thu, 28 Feb 2019 10:28:33 -0800
Message-ID: <155137851395.260864.14415827055284077946@swboyd.mtv.corp.google.com>
References: <1551230622-30660-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551230622-30660-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <anson.huang@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2019-02-26 17:28:26)
> i.MX8MQ has clock gate for each GPIO bank, add them
> into clock tree for GPIO driver to manage.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Applied to clk-next
