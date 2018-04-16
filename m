Return-Path: <SRS0=4xjV=HF=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] DT: mmc: tmio_mmc: document R8A77980 bindings
Message-ID: <cee91fe1-7bf0-e4c8-d6a9-5653be3358b0@cogentembedded.com>
Date: Mon, 16 Apr 2018 21:30:02 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document the R-Car V3H (R8A77980) SoC in the Renesas SDHI bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'next' branch of Ulf Hansson's 'mmc.git' repo.

 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |    1 +
 1 file changed, 1 insertion(+)

Index: mmc/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
===================================================================
--- mmc.orig/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ mmc/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
@@ -26,6 +26,7 @@ Required properties:
 		"renesas,sdhi-r8a7794" - SDHI IP on R8A7794 SoC
 		"renesas,sdhi-r8a7795" - SDHI IP on R8A7795 SoC
 		"renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
+		"renesas,sdhi-r8a77980" - SDHI IP on R8A77980 SoC
 		"renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
 		"renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
 		"renesas,rcar-gen1-sdhi" - a generic R-Car Gen1 SDHI controller
