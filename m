Return-Path: <SRS0=qXSO=PS=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: [PATCH RFC 1/2] dt-bindings: spi: renesas-rpc: document R8A77970
 bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <c83b1e54-016f-ef28-6bc9-9be9410c0d9a@cogentembedded.com>
Message-ID: <36b5ecc8-e7df-e351-f267-97a0d94262a1@cogentembedded.com>
Date: Thu, 10 Jan 2019 22:02:38 +0300
MIME-Version: 1.0
In-Reply-To: <c83b1e54-016f-ef28-6bc9-9be9410c0d9a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Document the R-Car V3M (R8A77970) SoC in the Renesas RPC-IF bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: renesas/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
+++ renesas/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
@@ -2,7 +2,8 @@ Renesas R-Car Gen3 RPC-IF controller Dev
 ----------------------------------------------------------
 
 Required properties:
-- compatible: should be "renesas,r8a77980-rpc" or
+- compatible: should be "renesas,r8a77970-rpc" or
+  	      	        "renesas,r8a77980-rpc" or
   	      	        "renesas,r8a77995-rpc"
 - #address-cells: should be 1
 - #size-cells: should be 0
