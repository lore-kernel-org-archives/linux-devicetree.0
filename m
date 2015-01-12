From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] dt-bindings: Add Silicon Mitus vendor prefix
Date: Mon, 12 Jan 2015 15:54:11 +0100
Message-ID: <1421074451-6961-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Add vendor prefix for Silicon Mitus. Currently there is binding for
sm5502 extcon driver ("siliconmitus,sm5502-muic").

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 75595c2b0a36..ebe1be28de75 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -143,6 +143,7 @@ schindler	Schindler
 seagate	Seagate Technology PLC
 sil	Silicon Image
 silabs	Silicon Laboratories
+siliconmitus	Silicon Mitus, Inc.
 simtek
 sii	Seiko Instruments, Inc.
 silergy	Silergy Corp.
-- 
1.9.1
