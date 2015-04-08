From: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [PATCH] of: add vendor prefix for Artesyn
Date: Wed,  8 Apr 2015 11:04:39 +0200
Message-ID: <1428483879-13949-1-git-send-email-alessio.bogani@elettra.eu>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Alessio Igor Bogani <alessio.bogani@elettra.eu>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
https://www.artesyn.com/about-us/company-profile

The prefix is already used in the MVME2500 powerpc system
(arch/powerpc/boot/dts/mvme2500.dts).

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index fae26d0..404dc47 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -23,6 +23,7 @@ apm	Applied Micro Circuits Corporation (APM)
 arasan	Arasan Chip Systems
 arm	ARM Ltd.
 armadeus	ARMadeus Systems SARL
+artesyn	Artesyn Embedded Technologies Inc.
 asahi-kasei	Asahi Kasei Corp.
 atmel	Atmel Corporation
 auo	AU Optronics Corporation
-- 
2.3.5

