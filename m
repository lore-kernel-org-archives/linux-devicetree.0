Return-Path: <SRS0=3ErU=WB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:50945 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfHEKDR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2019 06:03:17 -0400
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/8] dt-bindings: ap80x: Document AP807 CPU clock compatible
Date: Mon,  5 Aug 2019 12:03:03 +0200
Message-Id: <20190805100310.29048-2-miquel.raynal@bootlin.com>
In-Reply-To: <20190805100310.29048-1-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Marcin Wojtas <mw@semihalf.com>, Stefan Chulski <stefanc@marvell.com>, Yan Markman <ymarkman@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Add AP807 CPU clock compatible to the bindings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/arm/marvell/ap806-system-controller.txt     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
index 4f21c1024073..59b6b992fbc9 100644
--- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
@@ -147,11 +147,14 @@ ap_syscon1: system-controller@6f8000 {
 Cluster clocks:
 ---------------
 
-Device Tree Clock bindings for cluster clock of AP806 Marvell. Each
-cluster contain up to 2 CPUs running at the same frequency.
+Device Tree Clock bindings for cluster clock of Marvell
+AP806/AP807. Each cluster contain up to 2 CPUs running at the same
+frequency.
 
 Required properties:
-- compatible: must be  "marvell,ap806-cpu-clock";
+ - compatible: must be one of:
+   * "marvell,ap806-cpu-clock"
+   * "marvell,ap807-cpu-clock"
 - #clock-cells : should be set to 1.
 
 - clocks : shall be the input parent clock(s) phandle for the clock
-- 
2.20.1
