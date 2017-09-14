From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH] dt: Add vendor prefix 'shimafuji'
Date: Thu, 14 Sep 2017 17:18:30 +0300
Message-ID: <1505398710-4496-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add Shimafuji Electric, Inc. to the list of device tree vendor
prefixes

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index daf465be..a30e0b1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -289,6 +289,7 @@ semtech	Semtech Corporation
 sensirion	Sensirion AG
 sgx	SGX Sensortech
 sharp	Sharp Corporation
+shimafuji	Shimafuji Electric, Inc.
 si-en	Si-En Technology Ltd.
 sigma	Sigma Designs, Inc.
 sii	Seiko Instruments, Inc.
-- 
1.9.1
