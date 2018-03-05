From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/5] staging: vc04_services: Remove dead FRAGMENTS_T
Date: Mon,  5 Mar 2018 12:28:02 -0800
Message-ID: <20180305202806.21219-2-eric@anholt.net>
References: <20180305202806.21219-1-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180305202806.21219-1-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, bcm-kernel-feedback-list@broadcom.com, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

It's not used in-tree, or in the downstream tree.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_pagelist.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_pagelist.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_pagelist.h
index 926c247fd9d3..a6c5f7cc78f0 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_pagelist.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_pagelist.h
@@ -49,9 +49,4 @@ typedef struct pagelist_struct {
 			 */
 } PAGELIST_T;
 
-typedef struct fragments_struct {
-	char headbuf[CACHE_LINE_SIZE];
-	char tailbuf[CACHE_LINE_SIZE];
-} FRAGMENTS_T;
-
 #endif /* VCHIQ_PAGELIST_H */
-- 
2.16.2
