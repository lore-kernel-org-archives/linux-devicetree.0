Return-Path: <SRS0=/GFF=JI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:47338 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751149AbeFVEi2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 22 Jun 2018 00:38:28 -0400
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 1/2] dt-bindings: fsi: Add optional chip-id to CFAMs
Date: Fri, 22 Jun 2018 14:37:55 +1000
Message-Id: <20180622043756.21158-1-benh@kernel.crashing.org>
Sender: devicetree-owner@vger.kernel.org
To: openbmc@lists.ozlabs.org
Cc: linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-ID: <devicetree@vger.kernel.org>

This represents a physical chip in the system and allows
a stable numbering scheme to be passed to udev for userspace
to recognize which chip is which.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 Documentation/devicetree/bindings/fsi/fsi.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/fsi/fsi.txt b/Documentation/devicetree/bindings/fsi/fsi.txt
index ab516c673a4b..afb4eccab131 100644
--- a/Documentation/devicetree/bindings/fsi/fsi.txt
+++ b/Documentation/devicetree/bindings/fsi/fsi.txt
@@ -83,6 +83,10 @@ addresses and sizes in the slave address space:
     #address-cells = <1>;
     #size-cells = <1>;
 
+Optionally, a slave can provide a global unique chip ID which is used to
+identify the physical location of the chip in a system specific way
+
+    chip-id = <0>;
 
 FSI engines (devices)
 ---------------------
@@ -125,6 +129,7 @@ device tree if no extra platform information is required.
             reg = <0 0>;
             #address-cells = <1>;
             #size-cells = <1>;
+	    chip-id = <0>;
 
             /* FSI engine at 0xc00, using a single page. In this example,
              * it's an I2C master controller, so subnodes describe the
-- 
2.17.1

