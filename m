From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2 0/3] arm: dts: imx8mq: Add cpufreq support
Date: Fri, 15 Feb 2019 18:07:21 +0000
Message-ID: <1550254032-16451-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

In order for this to not break the build, the following patchset will
have to get in first:

https://lkml.org/lkml/2019/2/15/695

This work is actually a second version of the cpufreq related part of the
following RFC:

https://lkml.org/lkml/2019/2/13/1111

Changes since RFC:
 * added the gpio-regulator for cpu-supply as suggested by Lucas Stach
 * split the patch for opp table and the cpu supply nodes in two
   as suggested by Lucas Stach
 * changed the voltage for 1GHz opp as suggested by Angus Ainslie

Abel Vesa (3):
  arm64: dts: imx8mq: Add the clocks and the latencies for the A53 cores
  arm64: dts: imx8mq: Add the buck vdd_arm regulator
  arm64: dts: imx8mq: Add the opp table and cores opp properties

 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 36 ++++++++++++++++++++++++=
++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 31 ++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

--=20
2.7.4
