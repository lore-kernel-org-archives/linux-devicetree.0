From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] vendor-prefixes: Add prefix for Shenzhen SEI Robotics Co., Ltd
Date: Tue, 12 Feb 2019 15:02:58 +0100
Message-ID: <20190212140259.9537-2-narmstrong@baylibre.com>
References: <20190212140259.9537-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212140259.9537-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add vendor prefix for the Shenzhen SEI Robotics Co., Ltd, a chinese ODM
specialized in Android TV HDMI Stick, OTT Box, Hybrid STB,
Smart Home Gateway & more.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4615d4b9d11e..921ad8f88ed3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -343,6 +343,7 @@ sandisk	Sandisk Corporation
 sbs	Smart Battery System
 schindler	Schindler
 seagate	Seagate Technology PLC
+seirobotics	Shenzhen SEI Robotics Co., Ltd
 semtech	Semtech Corporation
 sensirion	Sensirion AG
 sff	Small Form Factor Committee
-- 
2.20.1
