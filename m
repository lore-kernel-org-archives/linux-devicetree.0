Return-Path: <SRS0=qjSo=MA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52132 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbeIRTE7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Sep 2018 15:04:59 -0400
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IDWMIk091587
        for <devicetree@vger.kernel.org>; Tue, 18 Sep 2018 08:32:22 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IDWLSC014355
        for <devicetree@vger.kernel.org>; Tue, 18 Sep 2018 08:32:21 -0500
From: Jyri Sarha <jsarha@ti.com>
Subject: [tiL-k3-AD-4.19 PATCH 02/24] dt-bindings: display/ti: add am65x-dss bindings
Date: Tue, 18 Sep 2018 16:31:50 +0300
Message-ID: <1537277532-6386-3-git-send-email-jsarha@ti.com>
In-Reply-To: <1537277532-6386-1-git-send-email-jsarha@ti.com>
References: <1537277532-6386-1-git-send-email-jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: tomi.valkeinen@ti.com, subhajit_paul@ti.com, jjhiblot@ti.com, linux-patch-review@list.ti.com, lcpd_audiovideo@list.ti.com
Cc: Jyri Sarha <jsarha@ti.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

Add DT bindings for Texas Instruments AM65x SoC Display Subsystem.  The
DSS7 on AM65x SoC has two video ports (DPI and OLDI) and two video
pipelines.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 .../devicetree/bindings/display/ti/ti,am6-dss.txt        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am6-dss.txt

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am6-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,am6-dss.txt
new file mode 100644
index 0000000..3466f09
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,am6-dss.txt
@@ -0,0 +1,16 @@
+Texas Instruments AM65x Display Subsystem
+==========================================
+
+Required properties:
+- compatible: "ti,am65x-dss", "ti,am6-dss"
+- reg: address and length of the register spaces for DSS submodules
+- reg-names: "common", "vidl1", "vid", "ovr1", "ovr2", "vp1", "vp2"
+- clocks: phandle to fclk, vp1, and vp2 clocks
+- clock-names: "fck", "vp1", "vp2"
+- interrupts: phandle to the DISPC interrupt
+- syscon: phandle to syscon device handling OLDI_PWRDN_TX (partition 1 of
+  AM654 CTRL MMR0)
+
+The DSS outputs are described using the device graphs as documented in
+Documentation/devicetree/bindings/graph.txt. AM6 DSS has a DPI output as port 0
+and an OLDI output as port 1.
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
