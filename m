Return-Path: <SRS0=zTHe=MU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:15012 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726415AbeJHXgm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 8 Oct 2018 19:36:42 -0400
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 3/3] dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
Date: Mon,  8 Oct 2018 11:23:49 -0500
Message-Id: <20181008162349.42957-4-chris.brandt@renesas.com>
In-Reply-To: <20181008162349.42957-1-chris.brandt@renesas.com>
References: <20181008162349.42957-1-chris.brandt@renesas.com>
Sender: devicetree-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Document support for the RZ/A2 (R7S9210) SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
index 79ecaf4161a0..16c7e656a33d 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
@@ -13,6 +13,7 @@ Required properties:
 - compatible: should contain one or more of the following:
 		"renesas,sdhi-sh73a0" - SDHI IP on SH73A0 SoC
 		"renesas,sdhi-r7s72100" - SDHI IP on R7S72100 SoC
+		"renesas,sdhi-r7s9210" - SDHI IP on R7S9210 SoC
 		"renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
 		"renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
 		"renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC
-- 
2.16.1
