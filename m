From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/4] Documentation: bindings: Add missing Amlogic SCPI sensor bindings
Date: Thu,  8 Nov 2018 14:53:51 +0100
Message-ID: <20181108135352.8459-4-jbrunet@baylibre.com>
References: <20181108135352.8459-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108135352.8459-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

amlogic,meson-gxbb-scpi-sensors is both the driver and DT but is not
documented. Just add it to amlogic's scpi documentation

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic,scpi.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic,scpi.txt b/Documentation/devicetree/bindings/arm/amlogic,scpi.txt
index 7b9a861e9306..5ab59da052df 100644
--- a/Documentation/devicetree/bindings/arm/amlogic,scpi.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic,scpi.txt
@@ -17,4 +17,11 @@ Required sub-node properties:
 - compatible : should be "amlogic,meson-gxbb-scp-shmem" for SRAM based shared
 		memory on Amlogic GXBB SoC.
 
+Sensor bindings for the sensors based on SCPI Message Protocol
+--------------------------------------------------------------
+SCPI provides an API to access the various sensors on the SoC.
+
+Required properties:
+- compatible : should be "amlogic,meson-gxbb-scpi-sensors".
+
 [0] Documentation/devicetree/bindings/arm/arm,scpi.txt
-- 
2.19.1
