From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH v5 7/9] NFC: trf7970a: Enable pins are active high not active low
Date: Tue, 25 Apr 2017 15:43:54 -0700
Message-ID: <20170425224356.11498-8-mgreer@animalcreek.com>
References: <20170425224356.11498-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170425224356.11498-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The example DTS code for the trf7970a sets the GPIOs for the EN
and EN2 pins to active low when they are really active high so
correct the error.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 Documentation/devicetree/bindings/net/nfc/trf7970a.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
index 57cb52c94783..a24a93a4b010 100644
--- a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
+++ b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
@@ -36,8 +36,8 @@ Example (for ARM-based BeagleBone with TRF7970A on SPI1):
 		spi-max-frequency = <2000000>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <14 0>;
-		ti,enable-gpios = <&gpio2 2 GPIO_ACTIVE_LOW>,
-				  <&gpio2 5 GPIO_ACTIVE_LOW>;
+		ti,enable-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>,
+				  <&gpio2 5 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&ldo3_reg>;
 		vdd-io-supply = <&ldo2_reg>;
 		autosuspend-delay = <30000>;
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
