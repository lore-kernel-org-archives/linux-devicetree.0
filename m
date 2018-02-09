From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v3 3/4] powerpc: wii.dts: Add ngpios property
Date: Fri,  9 Feb 2018 13:07:30 +0100
Message-ID: <20180209120732.17863-4-j.neuschaefer@gmx.net>
References: <20180209120732.17863-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180209120732.17863-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: devicetree@vger.kernel.org

The Hollywood GPIO controller supports 32 GPIOs, but on the Wii, only 24
are used.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---

v2, v3:
- no change
---
 arch/powerpc/boot/dts/wii.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
index 40b324b6391e..7235e375919c 100644
--- a/arch/powerpc/boot/dts/wii.dts
+++ b/arch/powerpc/boot/dts/wii.dts
@@ -176,6 +176,7 @@
 			compatible = "nintendo,hollywood-gpio";
 			reg = <0x0d8000c0 0x40>;
 			gpio-controller;
+			ngpios = <24>;
 
 			/*
 			 * This is commented out while a standard binding
-- 
2.15.1
