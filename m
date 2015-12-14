From: Frank Li <Frank.Li@freescale.com>
Subject: [PATCH 1/1] arm: imx7d: correct chip version information
Date: Mon, 14 Dec 2015 15:46:22 -0600
Message-ID: <1450129582-4261-1-git-send-email-Frank.Li@freescale.com>
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
To: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: lznuaa@gmail.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

show correct soc version infomation.

Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 arch/arm/mach-imx/anatop.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/anatop.c b/arch/arm/mach-imx/anatop.c
index 231bb25..23a4fc1 100644
--- a/arch/arm/mach-imx/anatop.c
+++ b/arch/arm/mach-imx/anatop.c
@@ -151,7 +151,14 @@ void __init imx_init_revision_from_anatop(void)
 		revision = IMX_CHIP_REVISION_1_5;
 		break;
 	default:
-		revision = IMX_CHIP_REVISION_UNKNOWN;
+		/*
+		 * Fail back to return raw register value instead of 0xff.
+		 * It will be easy know version information in SOC if it
+		 * can't recongized by known version. And some chip like
+		 * i.MX7D soc digprog value match linux version format,
+		 * needn't map again and direct use register value.
+		 */
+		revision = digprog & 0xff;
 	}
 
 	mxc_set_cpu_type(digprog >> 16 & 0xff);
-- 
2.5.2
