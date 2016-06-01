From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v2] of: add vendor prefix for UniWest
Date: Wed,  1 Jun 2016 08:55:00 -0700
Message-ID: <1464796500-11966-1-git-send-email-stillcompiling@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Joshua Clayton <stillcompiling@gmail.com>
List-Id: devicetree@vger.kernel.org

United Western Technologies Corp, known primarily as UniWest,
is a manufacturer of eddy current and ultrasonic testing equipment.

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 This vendor string is needed primarily for a imx6q-env.dts which
 made its way into mainline through the freescale/nxp soc tree.
 Please apply if all is in order.

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 3736acd..af744cb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -270,6 +270,7 @@ tronsmart	Tronsmart
 truly	Truly Semiconductors Limited
 tyan	Tyan Computer Corporation
 upisemi	uPI Semiconductor Corp.
+uniwest	United Western Technologies Corp (UniWest)
 urt	United Radiant Technology Corporation
 usi	Universal Scientific Industrial Co., Ltd.
 v3	V3 Semiconductor
-- 
2.7.4
