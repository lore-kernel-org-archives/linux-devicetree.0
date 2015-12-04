From: Enric Balletbo i Serra <eballetbo@gmail.com>
Subject: [PATCHv6 3/5] of: Add vendor prefix for Analogix Semiconductor, Inc.
Date: Fri,  4 Dec 2015 09:35:05 +0100
Message-ID: <1449218107-6590-4-git-send-email-enric.balletbo@collabora.com>
References: <1449218107-6590-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449218107-6590-1-git-send-email-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, treding@nvidia.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, airlied@linux.ie, gregkh@linuxfoundation.org, sjoerd.simons@collabora.co.uk, javier@dowhile0.org, span@analogixsemi.com, nathan.chung@mediatek.com, djkurtz@chromium.org, drinkcat@chromium.org, laurent.pinchart@ideasonboard.com, dan.carpenter@oracle.com, jb.tsai@mediatek.com, cawa.cheng@mediatek.com, eddie.huang@mediatek.com, cjiao@analogixsemi.com, emil.l.velikov@gmail.com
List-Id: devicetree@vger.kernel.org

Analogix Semiconductor develops analog and mixed-signal devices for digital
media and communications interconnect applications.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes since last version (requested by Rob Herring)
- Fix alphabetical order.

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 55df1d4..201d3e1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -21,6 +21,7 @@ amlogic	Amlogic, Inc.
 ampire	Ampire Co., Ltd.
 ams	AMS AG
 amstaos	AMS-Taos Inc.
+analogix	Analogix Semiconductor, Inc.
 apm	Applied Micro Circuits Corporation (APM)
 aptina	Aptina Imaging
 arasan	Arasan Chip Systems
-- 
2.1.0
