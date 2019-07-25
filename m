From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: imx8mn: Fix tab indentation for yaml file
Date: Thu, 25 Jul 2019 14:06:18 -0700
Message-ID: <20190725210619.5EB94218D4@mail.kernel.org>
References: <20190725020551.27034-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725020551.27034-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, devicetree@vger.kernel.org, festevam@gmail.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Quoting Anson.Huang@nxp.com (2019-07-24 19:05:51)
> From: Anson Huang <Anson.Huang@nxp.com>
>=20
> YAML file can NOT contain tab as indentation, fix it.
>=20

Would be nice if checkpatch could check for this.

> Fixes: 6d6062553e3d ("dt-bindings: imx: Add clock binding doc for i.MX8MN=
")
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Acked-by: Stephen Boyd <sboyd@kernel.org>
