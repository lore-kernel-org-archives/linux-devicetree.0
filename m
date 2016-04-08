From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 1/3] of: Add vendor prefix for Analogix Semiconductor
Date: Fri,  8 Apr 2016 14:52:50 +0200
Message-ID: <1460119972-8658-2-git-send-email-enric.balletbo@collabora.com>
References: <1460119972-8658-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460119972-8658-1-git-send-email-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, treding@nvidia.com, robh+dt@kernel.org, djkurtz@chromium.org, drinkcat@chromium.org, dan.carpenter@oracle.com
List-Id: devicetree@vger.kernel.org

Analogix Semiconductor Inc. develops analog and mixed-signal devices for
digital media and communications interconnect applications.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v2:
 - None

Changes since v1:
 - Add Acked-by: Rob Herring <robh@kernel.org>

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 86740d4..683320a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -22,6 +22,7 @@ amlogic	Amlogic, Inc.
 ampire	Ampire Co., Ltd.
 ams	AMS AG
 amstaos	AMS-Taos Inc.
+analogix	Analogix Semiconductor, Inc.
 apm	Applied Micro Circuits Corporation (APM)
 aptina	Aptina Imaging
 arasan	Arasan Chip Systems
-- 
2.1.0
