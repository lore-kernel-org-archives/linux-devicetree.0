From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] DT: add Olimex to vendor prefixes
Date: Wed, 18 Nov 2015 12:20:58 +0000
Message-ID: <1447849258-9181-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Thierry Reding <treding@nvidia.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This company already provided some products, so add them to the
vendor prefix list.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 55df1d4..a4f20355 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -161,6 +161,7 @@ nuvoton	Nuvoton Technology Corporation
 nvidia	NVIDIA
 nxp	NXP Semiconductors
 okaya	Okaya Electric America, Inc.
+olimex	OLIMEX Ltd.
 onnn	ON Semiconductor Corp.
 opencores	OpenCores.org
 option	Option NV
-- 
1.7.9.5
