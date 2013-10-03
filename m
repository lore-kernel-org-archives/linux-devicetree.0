From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH 1/2] ARM: DT: msm: Add Qualcomm's PRNG driver binding document
Date: Thu,  3 Oct 2013 17:52:34 +0300
Message-ID: <1380811955-18085-2-git-send-email-svarbanov@mm-sol.com>
References: <1380811955-18085-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1380811955-18085-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

This adds Qualcomm PRNG driver device tree binding documentation
to use as an example in dts trees.

Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
---
 Documentation/devicetree/bindings/rng/qcom,prng.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/qcom,prng.txt

diff --git a/Documentation/devicetree/bindings/rng/qcom,prng.txt b/Documentation/devicetree/bindings/rng/qcom,prng.txt
new file mode 100644
index 000000000000..92be00085ab1
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/qcom,prng.txt
@@ -0,0 +1,17 @@
+Qualcomm MSM pseudo random number generator.
+
+Required properties:
+
+- compatible  : should be "qcom,prng"
+- reg         : specifies base physical address and size of the registers map
+- clocks      : phandle to clock-controller plus clock-specifier pair
+- clock-names : "prng" clocks all registers, FIFO and circuits in PRNG IP block
+
+Example:
+
+	rng {
+		compatible = "qcom,prng";
+		reg = <0xf9bff000 0x200>;
+		clocks = <&clock GCC_PRNG_AHB_CLK>;
+		clock-names = "prng";
+	};
-- 
1.8.3.1

