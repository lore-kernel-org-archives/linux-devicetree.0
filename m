Return-Path: <SRS0=qjSo=MA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39056 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729416AbeIRTE5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Sep 2018 15:04:57 -0400
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IDWK4p096938
        for <devicetree@vger.kernel.org>; Tue, 18 Sep 2018 08:32:20 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IDWKnA014314
        for <devicetree@vger.kernel.org>; Tue, 18 Sep 2018 08:32:20 -0500
From: Jyri Sarha <jsarha@ti.com>
Subject: [tiL-k3-AD-4.19 PATCH 01/24] dt-bindings: display/ti: add k2g-dss bindings
Date: Tue, 18 Sep 2018 16:31:49 +0300
Message-ID: <1537277532-6386-2-git-send-email-jsarha@ti.com>
In-Reply-To: <1537277532-6386-1-git-send-email-jsarha@ti.com>
References: <1537277532-6386-1-git-send-email-jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: tomi.valkeinen@ti.com, subhajit_paul@ti.com, jjhiblot@ti.com, linux-patch-review@list.ti.com, lcpd_audiovideo@list.ti.com
Cc: devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>
List-ID: <devicetree@vger.kernel.org>

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

Add DT bindings for Texas Instruments K2G SoC Display Subsystem. The DSS
is quite simple, with a single plane and a single output.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 .../devicetree/bindings/display/ti/ti,k2g-dss.txt         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.txt

diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.txt
new file mode 100644
index 0000000..1af1142
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.txt
@@ -0,0 +1,15 @@
+Texas Instruments K2G Display Subsystem
+=======================================
+
+Required properties:
+- compatible: "ti,k2g-dss"
+- reg: address and length of the register spaces for DSS submodules
+- reg-names: "cfg", "common", "vid1", "ovr1", "vp1"
+- clocks: phandle to fclk and vp1 clocks
+- clock-names: "fck", "vp1"
+- interrupts: phandle to the DISPC interrupt
+
+The DSS outputs are described using the device graphs as documented in
+Documentation/devicetree/bindings/graph.txt. K2G DSS has a single DPI output as
+port 0.
+
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
