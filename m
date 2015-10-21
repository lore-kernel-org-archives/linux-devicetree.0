From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 07/19] ARM: dts: rockchip: replace gpio-key,
 wakeup with wakeup-source property
Date: Wed, 21 Oct 2015 11:10:04 +0100
Message-ID: <1445422216-29375-8-git-send-email-sudeep.holla@arm.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1445422216-29375-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Keyboard driver for GPIO buttons(gpio-keys) checks for the legacy
"gpio-key,wakeup" boolean property to enable gpio buttons as wakeup
source.

Few dts files assign value "1" to gpio-key,wakeup and in one instance a
value "0" is assigned probably assuming it won't be enabled as a wakeup
source. Since the presence of the boolean property indicates it is
enabled, value of "0" have no value.

This patch replaces the legacy "gpio-key,wakeup" with the unified
"wakeup-source" property which inturn fixes the above mentioned issue.

Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/rk3066a-bqcurie2.dts          | 3 +--
 arch/arm/boot/dts/rk3066a-rayeager.dts          | 2 +-
 arch/arm/boot/dts/rk3188-radxarock.dts          | 2 +-
 arch/arm/boot/dts/rk3288-evb.dtsi               | 2 +-
 arch/arm/boot/dts/rk3288-firefly.dtsi           | 2 +-
 arch/arm/boot/dts/rk3288-popmetal.dts           | 2 +-
 arch/arm/boot/dts/rk3288-r89.dts                | 2 +-
 arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 2 +-
 arch/arm/boot/dts/rk3288-veyron.dtsi            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts     | 2 +-
 10 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/rk3066a-bqcurie2.dts b/arch/arm/boot/dts/rk3066a-bqcurie2.dts
index c0273755431a..93be8f066e6d 100644
--- a/arch/arm/boot/dts/rk3066a-bqcurie2.dts
+++ b/arch/arm/boot/dts/rk3066a-bqcurie2.dts
@@ -74,7 +74,7 @@
 			linux,code = <116>;
 			label = "GPIO Key Power";
 			linux,input-type = <1>;
-			gpio-key,wakeup = <1>;
+			wakeup-source;
 			debounce-interval = <100>;
 		};
 		button@1 {
@@ -82,7 +82,6 @@
 			linux,code = <104>;
 			label = "GPIO Key Vol-";
 			linux,input-type = <1>;
-			gpio-key,wakeup = <0>;
 			debounce-interval = <100>;
 		};
 		/* VOL+ comes somehow thru the ADC */
diff --git a/arch/arm/boot/dts/rk3066a-rayeager.dts b/arch/arm/boot/dts/rk3066a-rayeager.dts
index e36383c701dc..da1c37a721c0 100644
--- a/arch/arm/boot/dts/rk3066a-rayeager.dts
+++ b/arch/arm/boot/dts/rk3066a-rayeager.dts
@@ -65,7 +65,7 @@
 		#size-cells = <0>;
 
 		button@0 {
-			gpio-key,wakeup = <1>;
+			wakeup-source;
 			gpios = <&gpio6 2 GPIO_ACTIVE_LOW>;
 			label = "GPIO Power";
 			linux,code = <116>;
diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts b/arch/arm/boot/dts/rk3188-radxarock.dts
index d2180e5d2b05..acd3bb940e9a 100644
--- a/arch/arm/boot/dts/rk3188-radxarock.dts
+++ b/arch/arm/boot/dts/rk3188-radxarock.dts
@@ -63,7 +63,7 @@
 			linux,code = <116>;
 			label = "GPIO Key Power";
 			linux,input-type = <1>;
-			gpio-key,wakeup = <1>;
+			wakeup-source;
 			debounce-interval = <100>;
 		};
 	};
diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
index f6d2e7894b05..e35cebc69e87 100644
--- a/arch/arm/boot/dts/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -103,7 +103,7 @@
 			linux,code = <116>;
 			label = "GPIO Key Power";
 			linux,input-type = <1>;
-			gpio-key,wakeup = <1>;
+			wakeup-source;
 			debounce-interval = <100>;
 		};
 	};
diff --git a/arch/arm/boot/dts/rk3288-firefly.dtsi b/arch/arm/boot/dts/rk3288-firefly.dtsi
index 20fa0ef0b96b..c5dd26139b63 100644
--- a/arch/arm/boot/dts/rk3288-firefly.dtsi
+++ b/arch/arm/boot/dts/rk3288-firefly.dtsi
@@ -67,7 +67,7 @@
 		#size-cells = <0>;
 
 		button@0 {
-			gpio-key,wakeup = <1>;
+			wakeup-source;
 			gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
 			label = "GPIO Power";
 			linux,code = <116>;
diff --git a/arch/arm/boot/dts/rk3288-popmetal.dts b/arch/arm/boot/dts/rk3288-popmetal.dts
index f82b956ebf17..34a0b063b3ec 100644
--- a/arch/arm/boot/dts/rk3288-popmetal.dts
+++ b/arch/arm/boot/dts/rk3288-popmetal.dts
@@ -74,7 +74,7 @@
 			linux,code = <116>;
 			label = "GPIO Key Power";
 			linux,input-type = <1>;
-			gpio-key,wakeup = <1>;
+			wakeup-source;
 			debounce-interval = <100>;
 		};
 	};
diff --git a/arch/arm/boot/dts/rk3288-r89.dts b/arch/arm/boot/dts/rk3288-r89.dts
index 14b9fc73c8a4..dc2f83a38d4f 100644
--- a/arch/arm/boot/dts/rk3288-r89.dts
+++ b/arch/arm/boot/dts/rk3288-r89.dts
@@ -73,7 +73,7 @@
 			linux,code = <116>;
 			label = "GPIO Key Power";
 			linux,input-type = <1>;
-			gpio-key,wakeup = <1>;
+			wakeup-source;
 			debounce-interval = <100>;
 		};
 	};
diff --git a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
index 136d650dd05f..610769d99522 100644
--- a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
@@ -108,7 +108,7 @@
 	lid {
 		label = "Lid";
 		gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
-		gpio-key,wakeup;
+		wakeup-source;
 		linux,code = <0>; /* SW_LID */
 		linux,input-type = <5>; /* EV_SW */
 		debounce-interval = <1>;
diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 275c78ccc0f3..914c299f9dda 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -64,7 +64,7 @@
 			gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			debounce-interval = <100>;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
index 401a81231eb9..730bac3a1c0a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
@@ -71,7 +71,7 @@
 		pinctrl-0 = <&pwr_key>;
 
 		button@0 {
-			gpio-key,wakeup = <1>;
+			wakeup-source;
 			gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
 			label = "GPIO Power";
 			linux,code = <116>;
-- 
1.9.1
