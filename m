From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] media: sony-cxd2880: add optional vcc regulator to bindings
Date: Thu,  8 Nov 2018 13:50:10 +0100
Message-ID: <1541681410-8187-3-git-send-email-narmstrong@baylibre.com>
References: <1541681410-8187-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541681410-8187-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yasunari.Takiguchi@sony.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds an optional VCC regulator to the bindings of the Sony
CXD2880 DVB-T2/T tuner + demodulator adapter.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt b/Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt
index fc5aa26..98a72c0 100644
--- a/Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt
+++ b/Documentation/devicetree/bindings/media/spi/sony-cxd2880.txt
@@ -5,6 +5,10 @@ Required properties:
 - reg: SPI chip select number for the device.
 - spi-max-frequency: Maximum bus speed, should be set to <55000000> (55MHz).
 
+Optional properties:
+- vcc-supply: Optional phandle to the vcc regulator to power the adapter,
+  as described in the file ../regulator/regulator.txt
+
 Example:
 
 cxd2880@0 {
-- 
2.7.4
