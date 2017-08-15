From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH 1/3] dt-bindings: vendors: Add VoCore as a vendor
Date: Tue, 15 Aug 2017 17:32:51 +0100
Message-ID: <1502814773-40842-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, john@phrozen.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

VoCore are a manufacturer of devices such as the VoCore2.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-mips@linux-mips.org
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index daf465be..f6e3716 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -353,6 +353,7 @@ variscite	Variscite Ltd.
 via	VIA Technologies, Inc.
 virtio	Virtual I/O Device Specification, developed by the OASIS consortium
 vivante	Vivante Corporation
+vocore VoCore Studio
 voipac	Voipac Technologies s.r.o.
 wd	Western Digital Corp.
 wetek	WeTek Electronics, limited.
-- 
2.7.4
