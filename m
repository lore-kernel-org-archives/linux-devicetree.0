Return-Path: <SRS0=Xkv+=RY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.nic.cz ([217.31.204.67]:60411 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728615AbfCUSVx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 21 Mar 2019 14:21:53 -0400
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v1 leds-next 2/3] dt-bindings: leds: Document Turris 1.x LED controller binding
Date: Thu, 21 Mar 2019 19:21:49 +0100
Message-Id: <20190321182150.10453-3-marek.behun@nic.cz>
In-Reply-To: <20190321182150.10453-1-marek.behun@nic.cz>
References: <20190321182150.10453-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This adds device tree binding documentation for the front panel LEDs
controller of CZ.NIC's Turris 1.x router.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/leds/leds-turris.txt         | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-turris.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-turris.txt b/Documentation/devicetree/bindings/leds/leds-turris.txt
new file mode 100644
index 000000000000..0b7548077a06
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-turris.txt
@@ -0,0 +1,12 @@
+Bindings for LEDs on CZ.NIC's Turris 1.x
+
+Required properties:
+ - compatible:		Should be "cznic,turris-leds"
+ - reg:			Should specify controller address
+
+Example:
+
+	led-controller@3,0 {
+		compatible = "cznic,turris-leds";
+		reg = <0x3 0x0 0x30>;
+	};
-- 
2.19.2
