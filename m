From: Lars Poeschel <poeschel@lemonage.de>
Subject: [PATCH v2 2/4] nfc: pn532_uart: Add NXP PN532 to devicetree docs
Date: Thu, 18 Oct 2018 16:42:42 +0200
Message-ID: <20181018144251.30028-2-poeschel@lemonage.de>
References: <20181018144251.30028-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018144251.30028-1-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Peter Rosin <peda@axentia.se>, Vadim Pasternak <vadimp@mellanox.com>, Lei YU <mine260309@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Lars Poeschel <poeschel@lemonage.de>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add pn532 to the trivial-devices.txt binding doc.

Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
---
 Documentation/devicetree/bindings/trivial-devices.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
index 763a2808a95c..c580be08a380 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -172,6 +172,7 @@ nxp,pcf2129		Real-time clock
 nxp,pcf8523		Real-time Clock
 nxp,pcf8563		Real-time clock/calendar
 nxp,pcf85063		Tiny Real-Time Clock
+nxp,pn532-uart		NXP PN532 NFC-/RFID-Chip, using UART interface
 oki,ml86v7667		OKI ML86V7667 video decoder
 ovti,ov5642		OV5642: Color CMOS QSXGA (5-megapixel) Image Sensor with OmniBSI and Embedded TrueFocus
 pericom,pt7c4338	Real-time Clock Module
-- 
2.19.1
