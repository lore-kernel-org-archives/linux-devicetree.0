From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V5 0/4] Add i.MX System Controller thermal driver support
Date: Thu, 20 Dec 2018 09:08:14 +0000
Message-ID: <1545296609-20477-1-git-send-email-Anson.Huang__7243.18980142034$1545296790$gmane$org@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olo>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX8QXP is an ARMv8 SoC which has a Cortex-M4 system controller
inside, the system controller is in charge of controlling power,
clock and thermal sensors etc..

This patch adds i.MX system controller thermal driver support,
Linux kernel has to communicate with system controller via MU
(message unit) IPC to get each thermal sensor's temperature,
it supports multiple sensors which are passed from device tree,
please see the binding doc for details.

Note that this patch set is based on [V5,4/4] ARM64: dts: imx: add i.MX8QXP system controller RTC support,
https://patchwork.kernel.org/patch/10738681/

Anson Huang (4):
  dt-bindings: thermal: add binding doc for i.MX system controller
    thermal driver
  thermal: imx_sc: add i.MX system controller thermal support
  defconfig: arm64: add i.MX system controller thermal support
  ARM64: dts: imx: add i.MX8QXP thermal support

 .../devicetree/bindings/thermal/imx-sc-thermal.txt |  33 ++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |  27 +++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/thermal/Kconfig                            |  11 ++
 drivers/thermal/Makefile                           |   1 +
 drivers/thermal/imx_sc_thermal.c                   | 201 +++++++++++++++++++++
 6 files changed, 274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/imx-sc-thermal.txt
 create mode 100644 drivers/thermal/imx_sc_thermal.c

-- 
2.7.4
