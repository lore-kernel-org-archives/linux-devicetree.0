From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 2/2] dt-bindings: clock: imx7ulp: remove SNVS clock
Date: Thu, 28 Feb 2019 08:56:05 +0000
Message-ID: <1551343889-6674-2-git-send-email-Anson.Huang@nxp.com>
References: <1551343889-6674-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551343889-6674-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Since i.MX7ULP B0 chip, SNVS module is moved into M4
domain, so remove it from Linux clock table.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 include/dt-bindings/clock/imx7ulp-clock.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx7ulp-clock.h b/include/dt-binding=
s/clock/imx7ulp-clock.h
index 21d872e..6f66f9005c 100644
--- a/include/dt-bindings/clock/imx7ulp-clock.h
+++ b/include/dt-bindings/clock/imx7ulp-clock.h
@@ -65,7 +65,6 @@
 #define IMX7ULP_CLK_FLEXBUS		2
 #define IMX7ULP_CLK_SEMA42_1		3
 #define IMX7ULP_CLK_DMA_MUX1		4
-#define IMX7ULP_CLK_SNVS		5
 #define IMX7ULP_CLK_CAAM		6
 #define IMX7ULP_CLK_LPTPM4		7
 #define IMX7ULP_CLK_LPTPM5		8
--=20
2.7.4
