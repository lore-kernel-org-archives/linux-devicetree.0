From: Mans Rullgard <mans@mansr.com>
Subject: [PATCH] devicetree: add Sigma Designs vendor prefix
Date: Fri,  2 Oct 2015 18:21:47 +0100
Message-ID: <1443806507-12061-1-git-send-email-mans@mansr.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: slash.tmp@free.fr
List-Id: devicetree@vger.kernel.org

Add the "sigma" vendor prefix for Sigma Designs, Inc.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 82d2ac9..ea77ee5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -192,6 +192,7 @@ schindler	Schindler
 seagate	Seagate Technology PLC
 semtech	Semtech Corporation
 sharp	Sharp Corporation
+sigma	Sigma Designs, Inc.
 sil	Silicon Image
 silabs	Silicon Laboratories
 siliconmitus	Silicon Mitus, Inc.
-- 
2.5.3
