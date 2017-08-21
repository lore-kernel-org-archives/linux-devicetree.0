From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [V2 2/4] dt-bindings: vendors: Add VoCore as a vendor
Date: Mon, 21 Aug 2017 11:54:45 +0100
Message-ID: <1503312887-34310-2-git-send-email-harvey.hunt@imgtec.com>
References: <1503312887-34310-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503312887-34310-1-git-send-email-harvey.hunt@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, john@phrozen.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

VoCore are a manufacturer of devices such as the VoCore2.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Acked-by: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-mips@linux-mips.org
---
Changes in V2:
- None

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
