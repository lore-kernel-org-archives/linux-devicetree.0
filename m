From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] Devicetree binding for omap3-serial & bcm2048 combination
Date: Wed, 28 Jan 2015 10:35:01 +0100
Message-ID: <20150128093501.GA17338@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: marcel@holtmann.org
List-Id: devicetree@vger.kernel.org

Nokia N900 contains bluetooth module connected on serial
port. Unfortunately, serial and bluetooth are rather closely coupled,
so standard serial driver can not be used, and we really don't want
/dev/ttyS1 to be published for internal port of bluetooth
stack... Hence solution below.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/Documentation/devicetree/bindings/serial/omap_serial.txt b/Documentation/devicetree/bindings/serial/omap_serial.txt
index 342eedd..e9fde42 100644
--- a/Documentation/devicetree/bindings/serial/omap_serial.txt
+++ b/Documentation/devicetree/bindings/serial/omap_serial.txt
@@ -4,7 +4,14 @@ Required properties:
 - compatible : should be "ti,omap2-uart" for OMAP2 controllers
 - compatible : should be "ti,omap3-uart" for OMAP3 controllers
 - compatible : should be "ti,omap4-uart" for OMAP4 controllers
+- compatible : should be "ti+brcm,omap3-uart,bcm2048" for bcm2048
+	       bluetooth connected to OMAP3 serial
 - ti,hwmods : Must be "uart<n>", n being the instance number (1-based)
 
 Optional properties:
 - clock-frequency : frequency of the clock input to the UART
+
+Required properties for ti+brcm,omap3-uart,bcm2048:
+- reset-gpios : gpio for reset pin
+- host-wakeup-gpios : gpio for host wakeup
+- bluetooth-wakeup-gpios : gpio for bluetooth wakeup

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
