From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: imx6q: add DCICx clocks gate
Date: Mon, 10 Dec 2018 11:34:55 -0800
Message-ID: <154447049532.17204.8968924447056060225@swboyd.mtv.corp.google.com>
References: <1543559158-2891-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543559158-2891-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "clement.peron@devialet.com" <clement.peron@devialet.com>, "colin.didier@devialet.com" <colin.didier@devialet.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Anson Huang <anson.huang@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2018-11-29 22:31:40)
> On i.MX6QP/i.MX6Q/i.MX6DL, there are DCIC1/DCIC2 clocks
> gate in CCM_CCGR0 register, add them into clock tree for
> clock management.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Applied to clk-next
