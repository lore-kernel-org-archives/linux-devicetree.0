From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 2/4] dt-bindings: timer: Add Actions Semi S700
Date: Mon, 11 Sep 2017 04:22:39 +0200
Message-ID: <20170911022241.11603-3-afaerber@suse.de>
References: <20170911022241.11603-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170911022241.11603-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Liau <thomas.liau@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf@actions-semi.com>, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang@actions-semi.com>, =?UTF-8?q?=E6=A2=85=E5=88=A9?= <harrymei@actions-semi.com>, support@cubietech.com, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define a compatible string for the Actions Semi S700 SoC timer.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 Documentation/devicetree/bindings/timer/actions,owl-timer.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/actions,owl-timer.txt b/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
index e3c28da80cb2..977054f87563 100644
--- a/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
+++ b/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
@@ -2,6 +2,7 @@ Actions Semi Owl Timer
 
 Required properties:
 - compatible      :  "actions,s500-timer" for S500
+                     "actions,s700-timer" for S700
                      "actions,s900-timer" for S900
 - reg             :  Offset and length of the register set for the device.
 - interrupts      :  Should contain the interrupts.
-- 
2.13.5
