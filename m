From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/4] nvmem: meson-efuse: bindings: add peripheral clock
Date: Tue, 30 Oct 2018 11:22:29 +0100
Message-ID: <20181030102231.4851-3-jbrunet@baylibre.com>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030102231.4851-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The efuse found in gx SoC requires a peripheral clock to properly operate.
We have been able to work without it until now because the clock was on by
default, and left on by the CCF. Soon, it will not be the case anymore, so
the device needs to claim the clock it needs

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
index e3298e18de26..2e0723ab3384 100644
--- a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
@@ -2,6 +2,8 @@
 
 Required properties:
 - compatible: should be "amlogic,meson-gxbb-efuse"
+- clocks: phandle to the efuse peripheral clock provided by the
+	  clock controller.
 
 = Data cells =
 Are child nodes of eFuse, bindings of which as described in
@@ -11,6 +13,7 @@ Example:
 
 	efuse: efuse {
 		compatible = "amlogic,meson-gxbb-efuse";
+		clocks = <&clkc CLKID_EFUSE>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-- 
2.17.2
