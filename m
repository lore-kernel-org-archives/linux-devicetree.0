From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 1/4] dt-bindings: Add vendor prefix for Raspberry Pi
Date: Fri, 16 Jan 2015 16:48:14 +0000
Message-ID: <1421426897-27225-2-git-send-email-stefan.wahren@i2se.com>
References: <1421426897-27225-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421426897-27225-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, lee@kernel.org, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Since the prefix is already in use, we need to add it in the
vendor list.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 5d2251a..0546f73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -136,6 +136,7 @@ radxa	Radxa
 raidsonic	RaidSonic Technology GmbH
 ralink	Mediatek/Ralink Technology Corp.
 ramtron	Ramtron International
+raspberrypi	Raspberry Pi Foundation
 realtek Realtek Semiconductor Corp.
 renesas	Renesas Electronics Corporation
 ricoh	Ricoh Co. Ltd.
-- 
1.7.9.5
