Return-Path: <SRS0=5R+x=WI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mx2.mailbox.org ([80.241.60.215]:35316 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727276AbfHLKhI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 12 Aug 2019 06:37:08 -0400
From: Stefan Roese <sr@denx.de>
Subject: [PATCH 2/4 v4] dt-bindings: mips: Add missing mt7688a-soc compatible
Date: Mon, 12 Aug 2019 12:36:53 +0200
Message-Id: <20190812103655.11070-2-sr@denx.de>
In-Reply-To: <20190812103655.11070-1-sr@denx.de>
References: <20190812103655.11070-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: Paul Burton <paul.burton@mips.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch adds the "ralink,mt7688a-soc" compatible to the ralink DT
bindings documentation. This compatible is already used by some MIPS
boards (e.g. omega2p.dts) but not yet documented. It will also be used
by the upcoming "GARDENA smart Gateway" support.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
v4:
- New patch

 Documentation/devicetree/bindings/mips/ralink.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mips/ralink.txt b/Documentation/devicetree/bindings/mips/ralink.txt
index a16e8d7fe56c..3341945b51d9 100644
--- a/Documentation/devicetree/bindings/mips/ralink.txt
+++ b/Documentation/devicetree/bindings/mips/ralink.txt
@@ -16,3 +16,4 @@ value must be one of the following values:
   ralink,mt7620a-soc
   ralink,mt7620n-soc
   ralink,mt7628a-soc
+  ralink,mt7688a-soc
-- 
2.22.0
