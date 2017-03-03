From: Richard Genoud <richard.genoud@gmail.com>
Subject: [PATCH 1/2] devicetree: add vendor prefix for Winstar Display Corp.
Date: Fri,  3 Mar 2017 16:21:55 +0100
Message-ID: <20170303152156.31370-1-richard.genoud@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>
List-Id: devicetree@vger.kernel.org

Winstar Display Corp. is specialized in LCD displays for embedded
products.
cf: http://www.winstar.com.tw

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 16d3b5e7f5d1..56df3afd625a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -322,6 +322,7 @@ voipac	Voipac Technologies s.r.o.
 wd	Western Digital Corp.
 wexler	Wexler
 winbond Winbond Electronics corp.
+winstar	Winstar Display Corp.
 wlf	Wolfson Microelectronics
 wm	Wondermedia Technologies, Inc.
 x-powers	X-Powers
