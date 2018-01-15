From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 6/6] powerpc: wii.dts: Add GPIO line names
Date: Mon, 15 Jan 2018 04:14:01 +0100
Message-ID: <20180115031401.19577-7-j.neuschaefer@gmx.net>
References: <20180115031401.19577-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20180115031401.19577-1-j.neuschaefer@gmx.net>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: devicetree@vger.kernel.org

These are the GPIO line names on a Nintendo Wii, as documented in:
https://wiibrew.org/wiki/Hardware/Hollywood_GPIOs

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 arch/powerpc/boot/dts/wii.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
index 7235e375919c..07d5e84e98b1 100644
--- a/arch/powerpc/boot/dts/wii.dts
+++ b/arch/powerpc/boot/dts/wii.dts
@@ -178,6 +178,14 @@
 			gpio-controller;
 			ngpios = <24>;
 
+			gpio-line-names =
+				"POWER", "SHUTDOWN", "FAN", "DC_DC",
+				"DI_SPIN", "SLOT_LED", "EJECT_BTN", "SLOT_IN",
+				"SENSOR_BAR", "DO_EJECT", "EEP_CS", "EEP_CLK",
+				"EEP_MOSI", "EEP_MISO", "AVE_SCL", "AVE_SDA",
+				"DEBUG0", "DEBUG1", "DEBUG2", "DEBUG3",
+				"DEBUG4", "DEBUG5", "DEBUG6", "DEBUG7";
+
 			/*
 			 * This is commented out while a standard binding
 			 * for i2c over gpio is defined.
-- 
2.15.1

