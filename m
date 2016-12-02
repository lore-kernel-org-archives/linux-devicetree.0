From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [PATCH 1/2] of: Add vendor prefix for Tianma Micro-electronics
Date: Fri,  2 Dec 2016 09:52:07 +0100
Message-ID: <20161202085208.19459-2-gary.bisson@boundarydevices.com>
References: <20161202085208.19459-1-gary.bisson@boundarydevices.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161202085208.19459-1-gary.bisson@boundarydevices.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Gary Bisson <gary.bisson@boundarydevices.com>
List-Id: devicetree@vger.kernel.org

Tianma Micro-electronics Co., Ltd. (Tianma) specializes in providing
display solutions and efficient support services worldwide.

More info:
http://en.tianma.com/about.shtml

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 163f84b..3d1ec68 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -291,6 +291,7 @@ technologic	Technologic Systems
 terasic	Terasic Inc.
 thine	THine Electronics, Inc.
 ti	Texas Instruments
+tianma	Tianma Micro-electronics Co., Ltd.
 tlm	Trusted Logic Mobility
 topeet  Topeet
 toradex	Toradex AG
-- 
2.9.3
