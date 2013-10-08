From: Jonas Jensen <jonas.jensen@gmail.com>
Subject: [PATCH] Documentation: add moxa vendor prefix
Date: Tue,  8 Oct 2013 14:56:40 +0200
Message-ID: <1381237000-8398-1-git-send-email-jonas.jensen@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, devicetree@vger.kernel.org, mark.rutland@arm.com, Jonas Jensen <jonas.jensen@gmail.com>
List-Id: devicetree@vger.kernel.org

Add moxa vendor prefix.

Signed-off-by: Jonas Jensen <jonas.jensen@gmail.com>
---

Notes:
    Submitting this per Mark Rutland's request.
    
    Applies to next-20130927

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2956800..0a04e89 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -40,6 +40,7 @@ marvell	Marvell Technology Group Ltd.
 maxim	Maxim Integrated Products
 microchip	Microchip Technology Inc.
 mosaixtech	Mosaix Technologies, Inc.
+moxa	Moxa Technology Co., Ltd.
 national	National Semiconductor
 nintendo	Nintendo
 nvidia	NVIDIA
-- 
1.8.2.1
