From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH 0/2] dts/ls1043a: add the DTS node for QSPI support
Date: Thu, 31 Mar 2016 14:44:59 +0800
Message-ID: <1459406701-40993-1-git-send-email-yao.yuan@freescale.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, computersforpeace@gmail.com, pawel.moll@arm.com, han.xu@nxp.com, shawnguo@kernel.org, leoyang.li@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Yuan Yao <yao.yuan@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan@nxp.com>

The QSPI controller on LS1043A is the same with the QSPI on LS1021A.
We shuld add the QSPI support on LS1043A.

So this patch try to add the dts node and binding Documentation.

Depend on the patch:
arm64: dts: add LS1043a-QDS board support
https://patchwork.kernel.org/patch/8528821/

Yuan Yao (2):
  Documentation: fsl-quadspi: Add fsl, ls1043a-qspi compatible string
  dts/ls1043a: add the DTS node for QSPI support

 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt |  3 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts     | 16 ++++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi        | 14 ++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

-- 
2.1.0.27.g96db324
