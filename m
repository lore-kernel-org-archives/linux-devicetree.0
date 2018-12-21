From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] ARM: dts: at91: replace gpio-key,
 wakeup with wakeup-source property
Date: Fri, 21 Dec 2018 18:11:49 +0000
Message-ID: <20181221181149.6708-1-sudeep.holla@arm.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Peter Rosin <peda@axentia.se>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

Most of the legacy "gpio-key,wakeup" property are already replaced
with "wakeup-source". However few occurrences of old property has
popped up again, probably from the remnants in downstream trees.
Almost all of those were remove couple of years back.

Replace the legacy properties with the unified "wakeup-source"
property introduced in the commit 700a38b27eef ("Input: gpio_keys -
switch to using generic device properties")

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 2 +-
 arch/arm/boot/dts/at91-wb45n.dts            | 2 +-
 arch/arm/boot/dts/at91-wb50n.dts            | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

Hi Alexandre,

Olof requested to slipt the patch and send it via platform maintainers.
I totally forgot to follow up on this. You had acked this previously but
please pick this up and submit via your tree to ARM SoC. Sorry for the
confusion.

Regards,
Sudeep

diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
index 911d2c7c1500..5664b6728a4c 100644
--- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
+++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
@@ -22,7 +22,7 @@
 		wakeup {
 			label = "Wakeup";
 			linux,code = <10>;
-			gpio-key,wakeup;
+			wakeup-source;
 			gpios = <&pioB 27 GPIO_ACTIVE_LOW>;
 		};
 	};
diff --git a/arch/arm/boot/dts/at91-wb45n.dts b/arch/arm/boot/dts/at91-wb45n.dts
index 5b9512a6c89c..54d130c92185 100644
--- a/arch/arm/boot/dts/at91-wb45n.dts
+++ b/arch/arm/boot/dts/at91-wb45n.dts
@@ -22,7 +22,7 @@
 			label = "IRQBTN";
 			linux,code = <99>;
 			gpios = <&pioB 18 GPIO_ACTIVE_LOW>;
-			gpio-key,wakeup = <1>;
+			wakeup-source;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/at91-wb50n.dts b/arch/arm/boot/dts/at91-wb50n.dts
index 8cecc7051a86..a5e45bb95c04 100644
--- a/arch/arm/boot/dts/at91-wb50n.dts
+++ b/arch/arm/boot/dts/at91-wb50n.dts
@@ -23,7 +23,7 @@
 			label = "BTNESC";
 			linux,code = <1>; /* ESC button */
 			gpios = <&pioA 10 GPIO_ACTIVE_LOW>;
-			gpio-key,wakeup = <1>;
+			wakeup-source;
 		};

 		irqbtn@31 {
@@ -31,7 +31,7 @@
 			label = "IRQBTN";
 			linux,code = <99>; /* SysReq button */
 			gpios = <&pioE 31 GPIO_ACTIVE_LOW>;
-			gpio-key,wakeup = <1>;
+			wakeup-source;
 		};
 	};

--
2.17.1
