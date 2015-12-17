From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: [PATCH 1/2] ARM: dts: TS-4800: drop uart rts/cts pin reservations
Date: Thu, 17 Dec 2015 16:16:52 -0500
Message-ID: <1450387013-3532-1-git-send-email-damien.riegel@savoirfairelinux.com>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Damien Riegel <damien.riegel@savoirfairelinux.com>, Rob Herring <robh+dt@kernel.org>, kernel@savoirfairelinux.com, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

These pins are actually not routed for UARTs, they should not be
reserved.

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
---
 arch/arm/boot/dts/imx51-ts4800.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx51-ts4800.dts b/arch/arm/boot/dts/imx51-ts4800.dts
index f1317f7..64ac55c 100644
--- a/arch/arm/boot/dts/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/imx51-ts4800.dts
@@ -157,8 +157,6 @@
 		fsl,pins = <
 			MX51_PAD_UART1_RXD__UART1_RXD		0x1c5
 			MX51_PAD_UART1_TXD__UART1_TXD		0x1c5
-			MX51_PAD_UART1_RTS__UART1_RTS		0x1c5
-			MX51_PAD_UART1_CTS__UART1_CTS		0x1c5
 		>;
 	};
 
@@ -173,8 +171,6 @@
 		fsl,pins = <
 			MX51_PAD_EIM_D25__UART3_RXD		0x1c5
 			MX51_PAD_EIM_D26__UART3_TXD		0x1c5
-			MX51_PAD_EIM_D27__UART3_RTS		0x1c5
-			MX51_PAD_EIM_D24__UART3_CTS		0x1c5
 		>;
 	};
 };
-- 
2.5.0
