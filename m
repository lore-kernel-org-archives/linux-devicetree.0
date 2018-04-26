Return-Path: <SRS0=DPw9=HP=ragnatech.se=niklas.soderlund+renesas@kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/2] dt-bindings: thermal: rcar-gen3-thermal: add r8a77965
Date: Thu, 26 Apr 2018 21:42:01 +0200
Message-Id: <20180426194202.31662-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180426194202.31662-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180426194202.31662-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh+dt@kernel.org>, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

Based on previous work by Ryo Kataoka <ryo.kataoka.wt@renesas.com>.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Rob Herring <robh@kernel.org>

---

* Changes since v1
- s/H3 and M3-W, M3-N/H3, M3-W and M3-N/
- Add review tags.
---
 .../devicetree/bindings/thermal/rcar-gen3-thermal.txt          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
index fdf5caa6229b4fff..32c63ffef2e3a3ff 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
@@ -9,6 +9,7 @@ Required properties:
 			  Examples with soctypes are:
 			    - "renesas,r8a7795-thermal" (R-Car H3)
 			    - "renesas,r8a7796-thermal" (R-Car M3-W)
+			    - "renesas,r8a77965-thermal" (R-Car M3-N)
 - reg			: Address ranges of the thermal registers. Each sensor
 			  needs one address range. Sorting must be done in
 			  increasing order according to datasheet, i.e.
@@ -18,7 +19,7 @@ Required properties:
 
 Optional properties:
 
-- interrupts           : interrupts routed to the TSC (3 for H3 and M3-W)
+- interrupts           : interrupts routed to the TSC (3 for H3, M3-W and M3-N)
 - power-domain		: Must contain a reference to the power domain. This
 			  property is mandatory if the thermal sensor instance
 			  is part of a controllable power domain.
-- 
2.17.0
