From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH v2 8/8] arm: mach-artpec: add entry to MAINTAINERS
Date: Thu, 11 Feb 2016 15:04:42 +0100
Message-ID: <b5adeda17294fceb282d14446ab684316fc3028b.1455198819.git.larper@axis.com>
References: <cover.1455198819.git.larper@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1455198819.git.larper@axis.com>
In-Reply-To: <cover.1455198819.git.larper@axis.com>
References: <cover.1455198819.git.larper@axis.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Lars Persson <larper@axis.com>, linux-kernel@vger.kernel.org, Jesper Nilsson <jespern@axis.com>, robh+dt@kernel.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lars Persson <larper@axis.com>
Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f1fa4f..d32c1aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -932,6 +932,16 @@ M:	Tsahee Zidenberg <tsahee@annapurnalabs.com>
 S:	Maintained
 F:	arch/arm/mach-alpine/
 
+ARM/ARTPEC MACHINE SUPPORT
+M:	Jesper Nilsson <jesper.nilsson@axis.com>
+M:	Lars Persson <lars.persson@axis.com>
+M:	Niklas Cassel <niklas.cassel@axis.com>
+S:	Maintained
+L:	linux-arm-kernel@axis.com
+F:	arch/arm/mach-artpec
+F:	arch/arm/boot/dts/artpec6*
+F:	drivers/clk/clk-artpec6.c
+
 ARM/ATMEL AT91RM9200, AT91SAM9 AND SAMA5 SOC SUPPORT
 M:	Nicolas Ferre <nicolas.ferre@atmel.com>
 M:	Alexandre Belloni <alexandre.belloni@free-electrons.com>
-- 
2.1.4
