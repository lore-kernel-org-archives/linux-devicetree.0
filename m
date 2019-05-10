From: Pramod Kumar <pramod.kumar_1@nxp.com>
Subject: [PATCH v2 0/3] arm64: dts: nxp: add ls1046a frwy board support
Date: Fri, 10 May 2019 13:00:13 +0000
Message-ID: <20190510130207.14330-1-pramod.kumar_1@nxp.com>
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
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "Michal.Vokac@ysoft.com" <Michal.Vokac@ysoft.com>, Leo Li <leoyang.li@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Changes for v2:
- Modified comit message
- Add dts entry for qspi nor flash

Changes for v1:
- Add dts support for ls1046a frwy board.
- Add "fsl,ls1046a-frwy" bindings for ls1046afrwy board based on ls1046a SoC

Pramod Kumar (3):
  dt-bindings: arm: nxp: Add device tree binding for ls1046a-frwy board
  arm64: dts: nxp: add ls1046a-frwy board support
  arm64: dts: nxp: frwy-ls1046a: add support for micron nor flash

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/fsl-ls1046a-frwy.dts   | 173 ++++++++++++++++++
 3 files changed, 175 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts

-- 
2.17.1
