From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 1/2] powerpc: wii.dts: Add interrupt-related properties to GPIO node
Date: Sat, 12 Jan 2019 17:21:23 +0100
Message-ID: <20190112162124.3341-2-j.neuschaefer@gmx.net>
References: <20190112162124.3341-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190112162124.3341-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: devicetree@vger.kernel.org

The Hollywood GPIO controller is connected to the Hollywood PIC (&PIC1)
at IRQs 10 and 11; IRQ 10 for GPIO lines that are configured for access
by the PPC, 11 for GPIO lines that are configured for access by the
ARM926.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 arch/powerpc/boot/dts/wii.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
index 40fe791ec9e6..864e5a17aa1d 100644
--- a/arch/powerpc/boot/dts/wii.dts
+++ b/arch/powerpc/boot/dts/wii.dts
@@ -187,6 +187,11 @@
 				"DEBUG0", "DEBUG1", "DEBUG2", "DEBUG3",
 				"DEBUG4", "DEBUG5", "DEBUG6", "DEBUG7";
 
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <10>;
+			interrupt-parent = <&PIC1>;
+
 			/*
 			 * This is commented out while a standard binding
 			 * for i2c over gpio is defined.
-- 
2.20.1
