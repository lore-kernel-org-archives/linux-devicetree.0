Return-Path: <SRS0=8uLa=PF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41144 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731620AbeL1KrN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Dec 2018 05:47:13 -0500
Received: by mail-lf1-f66.google.com with SMTP id c16so14321169lfj.8
        for <devicetree@vger.kernel.org>; Fri, 28 Dec 2018 02:47:11 -0800 (PST)
Subject: [PATCH 1/2] dt-bindings: spi: renesas-rpc: document R8A77980 bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <72626acd-9d5f-14a1-6464-5fdeba17fece@cogentembedded.com>
Message-ID: <08a3ff4d-3ee3-91dd-c048-55a09b6dfc63@cogentembedded.com>
Date: Fri, 28 Dec 2018 13:47:09 +0300
MIME-Version: 1.0
In-Reply-To: <72626acd-9d5f-14a1-6464-5fdeba17fece@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Document the R-Car V3H (R8A77980) SoC in the Renesas RPC-IF bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: renesas/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
+++ renesas/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
@@ -2,7 +2,8 @@ Renesas R-Car Gen3 RPC controller Device
 ------------------------------------------------------
 
 Required properties:
-- compatible: should be "renesas,r8a77995-rpc"
+- compatible: should be "renesas,r8a77980-rpc" or
+  	      	        "renesas,r8a77995-rpc"
 - #address-cells: should be 1
 - #size-cells: should be 0
 - reg: should contain 2 entries, one for the registers and one for the direct
