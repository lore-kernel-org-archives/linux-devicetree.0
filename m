From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH v2 6/7] NFC: trf7970a: Enable pins are active high not active low
Date: Tue, 20 Dec 2016 11:32:43 -0700
Message-ID: <20161220183244.5171-7-mgreer@animalcreek.com>
References: <20161220183244.5171-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161220183244.5171-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The example DTS code for the trf7970a sets the GPIOs for the EN
and EN2 pins to active low when they are really active high so
correct the error.

Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 Documentation/devicetree/bindings/net/nfc/trf7970a.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
index 32b35a07abe4..10672649a59e 100644
--- a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
+++ b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
@@ -35,8 +35,8 @@ Example (for ARM-based BeagleBone with TRF7970A on SPI1):
 		spi-max-frequency = <2000000>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <14 0>;
-		ti,enable-gpios = <&gpio2 2 GPIO_ACTIVE_LOW>,
-				  <&gpio2 5 GPIO_ACTIVE_LOW>;
+		ti,enable-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>,
+				  <&gpio2 5 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&ldo3_reg>;
 		vin-voltage-override = <5000000>;
 		autosuspend-delay = <30000>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
