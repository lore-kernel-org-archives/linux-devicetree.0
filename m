Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from forward105o.mail.yandex.net ([37.140.190.183]:37165 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726121AbfDKMUd (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 11 Apr 2019 08:20:33 -0400
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 5/6] dt/bindings: Add bindings for ls1x CPU
Date: Thu, 11 Apr 2019 20:19:14 +0800
Message-Id: <20190411121915.8040-6-jiaxun.yang@flygoat.com>
In-Reply-To: <20190411121915.8040-1-jiaxun.yang@flygoat.com>
References: <20190312091520.8863-2-jiaxun.yang@flygoat.com>
 <20190411121915.8040-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org, paul.burton@mips.com, robh+dt@kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-ID: <devicetree@vger.kernel.org>

This documented ls1x CPU node.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 Documentation/devicetree/bindings/mips/loongson/ls1x-cpu.txt | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/ls1x-cpu.txt

diff --git a/Documentation/devicetree/bindings/mips/loongson/ls1x-cpu.txt b/Documentation/devicetree/bindings/mips/loongson/ls1x-cpu.txt
new file mode 100644
index 000000000000..33664bd15487
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/loongson/ls1x-cpu.txt
@@ -0,0 +1,4 @@
+* Loongson-1 MCU CPUs
+
+Required properties:
+- compatible: "loongson,ls1b", "loongson,ls1c"
-- 
2.21.0
