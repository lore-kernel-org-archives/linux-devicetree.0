From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: imx8mq: add clock for SNVS RTC node
Date: Thu, 23 May 2019 09:02:44 +0800
Message-ID: <20190523010243.GD16359@dragon>
References: <1557882259-3353-1-git-send-email-Anson.Huang@nxp.com>
 <1557882259-3353-3-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557882259-3353-3-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vge>
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 01:09:36AM +0000, Anson Huang wrote:
> i.MX8MQ has clock gate for SNVS module, add clock info to SNVS
> RTC node for clock management.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

This one still has problem with encoding and thus cannot be applied.
Here is what I get, and there is '=20' in the patch content.

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mq.dtsi
index e5f3133..b706de8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -438,6 +438,8 @@
                                        offset =3D <0x34>;
                                        interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
                                                <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+                                       clocks =3D <&clk IMX8MQ_CLK_SNVS_ROOT>;
+                                       clock-names =3D "snvs-rtc";
                                };
                        };
=20
--=20
2.7.4
