From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 03/12] arm: dts: mt7623: fix invalid memory node being
 generated
Date: Wed, 11 Apr 2018 16:53:56 +0800
Message-ID: <d887b72e1839c7e476179e384cfc712216096f20.1523434758.git.sean.wang@mediatek.com>
References: <cover.1523434757.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1523434757.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Below two wrong nodes in existing DTS files would cause a fail boot since
in fact the address 0 is not the correct place the memory device locates
at.

memory {
        device_type = "memory";
        reg = <0x0 0x0 0x0 0x0>;
};

memory@80000000 {
        reg = <0x0 0x80000000 0x0 0x40000000>;
};

In order to avoid having a memory node starting at address 0, we can't
include file skeleton64.dtsi and instead need to explicitly manually
define a few of properties the DTS relies on such as #address-cells
and #size-cells in root node and device_type in the node memory@80000000.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Fixes: 31ac0d69a1d4 ("ARM: dts: mediatek: add MT7623 basic support")
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/mt7623.dtsi                 | 3 ++-
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 1 +
 arch/arm/boot/dts/mt7623n-rfb.dtsi            | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index fec4715..406a9f3 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -15,11 +15,12 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/reset/mt2701-resets.h>
 #include <dt-bindings/thermal/thermal.h>
-#include "skeleton64.dtsi"
 
 / {
 	compatible = "mediatek,mt7623";
 	interrupt-parent = <&sysirq>;
+	#address-cells = <2>;
+	#size-cells = <2>;
 
 	cpu_opp_table: opp-table {
 		compatible = "operating-points-v2";
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index bbf56f8..5938e4c 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -109,6 +109,7 @@
 	};
 
 	memory@80000000 {
+		device_type = "memory";
 		reg = <0 0x80000000 0 0x40000000>;
 	};
 };
diff --git a/arch/arm/boot/dts/mt7623n-rfb.dtsi b/arch/arm/boot/dts/mt7623n-rfb.dtsi
index a199ae7..343e8ef 100644
--- a/arch/arm/boot/dts/mt7623n-rfb.dtsi
+++ b/arch/arm/boot/dts/mt7623n-rfb.dtsi
@@ -40,6 +40,7 @@
 	};
 
 	memory@80000000 {
+		device_type = "memory";
 		reg = <0 0x80000000 0 0x40000000>;
 	};
 
-- 
2.7.4
