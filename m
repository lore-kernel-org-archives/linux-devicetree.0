From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH RESEND 01/12] clk: st: Update ST clock binding documentation
Date: Wed,  4 Jun 2014 16:31:49 +0200
Message-ID: <1401892320-18211-2-git-send-email-gabriel.fernandez@linaro.org>
References: <1401892320-18211-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401892320-18211-1-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds new compatibilities to support STiH407 SoC.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 .../devicetree/bindings/clock/st/st,clkgen-mux.txt   |  2 +-
 .../devicetree/bindings/clock/st/st,clkgen-pll.txt   |  5 ++++-
 .../devicetree/bindings/clock/st/st,clkgen.txt       | 20 ++++++++++++++++----
 .../devicetree/bindings/clock/st/st,quadfs.txt       |  3 +++
 4 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
index 943e080..2d92fc8 100644
--- a/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
@@ -17,7 +17,7 @@ Required properties:
 	"st,stih416-clkgenf-vcc-sd",	"st,clkgen-mux"
 	"st,stih415-clkgen-a9-mux",	"st,clkgen-mux"
 	"st,stih416-clkgen-a9-mux",	"st,clkgen-mux"
-
+	"st,stih407-clkgen-a9-mux",	"st,clkgen-mux"
 
 - #clock-cells : from common clock binding; shall be set to 0.
 
diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
index 81eb385..b852925 100644
--- a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
@@ -19,11 +19,14 @@ Required properties:
 	"st,stih415-plls-c32-ddr",	"st,clkgen-plls-c32"
 	"st,stih416-plls-c32-a9",	"st,clkgen-plls-c32"
 	"st,stih416-plls-c32-ddr",	"st,clkgen-plls-c32"
+	"st,stih407-plls-c32-a0",	"st,clkgen-plls-c32"
+	"st,stih407-plls-c32-a9",	"st,clkgen-plls-c32"
+	"st,stih407-plls-c32-c0_0",	"st,clkgen-plls-c32"
+	"st,stih407-plls-c32-c0_1",	"st,clkgen-plls-c32"
 
 	"st,stih415-gpu-pll-c32",	"st,clkgengpu-pll-c32"
 	"st,stih416-gpu-pll-c32",	"st,clkgengpu-pll-c32"
 
-
 - #clock-cells : From common clock binding; shall be set to 1.
 
 - clocks : From common clock binding
diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
index 49ec5ae..55506c2 100644
--- a/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
@@ -24,16 +24,28 @@ address is common of all subnode.
 		quadfs_node {
 			...
 		};
+
+		mux_node {
+			...
+		};
+
+		vcc_node {
+			...
+		};
 		...
 	};
 
 This binding uses the common clock binding[1].
-Each subnode should use the binding discribe in [2]..[4]
+Each subnode should use the binding discribe in [2]..[7]
 
 [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/clock/st,quadfs.txt
-[3] Documentation/devicetree/bindings/clock/st,quadfs.txt
-[4] Documentation/devicetree/bindings/clock/st,quadfs.txt
+[2] Documentation/devicetree/bindings/clock/st,clkgen-divmux.txt
+[3] Documentation/devicetree/bindings/clock/st,clkgen-mux.txt
+[4] Documentation/devicetree/bindings/clock/st,clkgen-pll.txt
+[5] Documentation/devicetree/bindings/clock/st,clkgen-prediv.txt
+[6] Documentation/devicetree/bindings/clock/st,vcc.txt
+[7] Documentation/devicetree/bindings/clock/st,quadfs.txt
+
 
 Required properties:
 - reg : A Base address and length of the register set.
diff --git a/Documentation/devicetree/bindings/clock/st/st,quadfs.txt b/Documentation/devicetree/bindings/clock/st/st,quadfs.txt
index ec86d62..c0a4045 100644
--- a/Documentation/devicetree/bindings/clock/st/st,quadfs.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,quadfs.txt
@@ -15,6 +15,9 @@ Required properties:
   "st,stih416-quadfs432",	"st,quadfs"
   "st,stih416-quadfs660-E",	"st,quadfs"
   "st,stih416-quadfs660-F",	"st,quadfs"
+  "st,stih407-quadfs660-C",	"st,quadfs"
+  "st,stih407-quadfs660-D",	"st,quadfs"
+
 
 - #clock-cells : from common clock binding; shall be set to 1.
 
-- 
1.9.1
