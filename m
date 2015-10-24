From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: dts: uniphier: add I2C aliases for ProXstream2 boards
Date: Sat, 24 Oct 2015 12:25:31 +0900
Message-ID: <1445657131-6351-1-git-send-email-yamada.masahiro@socionext.com>
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
To: arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add aliases to fix the I2C indexes like the other UniPhier boards.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/uniphier-proxstream2-gentil.dts | 4 ++++
 arch/arm/boot/dts/uniphier-proxstream2-vodka.dts  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-proxstream2-gentil.dts b/arch/arm/boot/dts/uniphier-proxstream2-gentil.dts
index 5cb58b6..9d7ec5c 100644
--- a/arch/arm/boot/dts/uniphier-proxstream2-gentil.dts
+++ b/arch/arm/boot/dts/uniphier-proxstream2-gentil.dts
@@ -62,6 +62,10 @@
 		serial0 = &serial0;
 		serial1 = &serial1;
 		serial2 = &serial2;
+		i2c0 = &i2c0;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
 	};
 };
 
diff --git a/arch/arm/boot/dts/uniphier-proxstream2-vodka.dts b/arch/arm/boot/dts/uniphier-proxstream2-vodka.dts
index 76040bb..498acac 100644
--- a/arch/arm/boot/dts/uniphier-proxstream2-vodka.dts
+++ b/arch/arm/boot/dts/uniphier-proxstream2-vodka.dts
@@ -62,6 +62,10 @@
 		serial0 = &serial0;
 		serial1 = &serial1;
 		serial2 = &serial2;
+		i2c0 = &i2c0;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
 	};
 };
 
-- 
1.9.1
