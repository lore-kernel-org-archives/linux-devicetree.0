From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 06/13] DT: clock: cpg-mstp-clocks: document-R8A7792-support
Date: Wed, 01 Jun 2016 01:21:26 +0300
Message-ID: <1627751.dcAYzyCZSM@wasted.cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Renesas R8A7792 SoC also has the CPG MSTP clocks...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt |    1 +
 1 file changed, 1 insertion(+)

Index: renesas/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
+++ renesas/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
@@ -17,6 +17,7 @@ Required Properties:
     - "renesas,r8a7779-mstp-clocks" for R8A7779 (R-Car H1) MSTP gate clocks
     - "renesas,r8a7790-mstp-clocks" for R8A7790 (R-Car H2) MSTP gate clocks
     - "renesas,r8a7791-mstp-clocks" for R8A7791 (R-Car M2-W) MSTP gate clocks
+    - "renesas,r8a7792-mstp-clocks" for R8A7792 (R-Car V2H) MSTP gate clocks
     - "renesas,r8a7793-mstp-clocks" for R8A7793 (R-Car M2-N) MSTP gate clocks
     - "renesas,r8a7794-mstp-clocks" for R8A7794 (R-Car E2) MSTP gate clocks
     - "renesas,sh73a0-mstp-clocks" for SH73A0 (SH-MobileAG5) MSTP gate clocks
