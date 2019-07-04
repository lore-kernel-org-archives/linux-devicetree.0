From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH 0/3] Enable imx ddr perfmon on imx8m
Date: Thu,  4 Jul 2019 11:53:19 +0300
Message-ID: <cover.1562230183.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Will Deacon <will@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, devicetree@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Driver was upstreamed for imx8qxp and it seems to work on imx8mq/imx8mm
without changes.

Add soc-specific compat strings in case we find minor differences later.

Leonard Crestez (3):
  perf/imx_ddr: Add MODULE_DEVICE_TABLE
  arm64: dts: imx8m: Add ddr-pmu nodes
  arm64: defconfig: Build imx8 ddr pmu as module

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 7 +++++++
 arch/arm64/configs/defconfig              | 1 +
 drivers/perf/fsl_imx8_ddr_perf.c          | 1 +
 4 files changed, 16 insertions(+)

-- 
2.17.1
