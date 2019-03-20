From: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>
Subject: [PATCH] powerpc/dts/fsl: add crypto node alias for B4
Date: Wed, 20 Mar 2019 14:55:16 +0200
Message-ID: <20190320125516.12277-1-horia.geanta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

crypto node alias is needed by U-boot to identify the node and
perform fix-ups, like adding "fsl,sec-era" property.

Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
---
 arch/powerpc/boot/dts/fsl/b4qds.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/boot/dts/fsl/b4qds.dtsi b/arch/powerpc/boot/dts/fsl/b4qds.dtsi
index 999efd3bc167..05be919f3545 100644
--- a/arch/powerpc/boot/dts/fsl/b4qds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4qds.dtsi
@@ -40,6 +40,7 @@
 	interrupt-parent = <&mpic>;
 
 	aliases {
+		crypto = &crypto;
 		phy_sgmii_10 = &phy_sgmii_10;
 		phy_sgmii_11 = &phy_sgmii_11;
 		phy_sgmii_1c = &phy_sgmii_1c;
-- 
2.17.1
