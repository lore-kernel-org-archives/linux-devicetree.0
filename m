From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 1/4] dt-bindings/gic-v3: Add msm8996 compatible string
Date: Mon, 10 Dec 2018 10:23:06 +0000
Message-ID: <20181210102309.8207-2-srinivas.kandagatla@linaro.org>
References: <20181210102309.8207-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210102309.8207-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com
Cc: sudeep.holla@arm.com, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, sboyd@kernel.org, bjorn.andersson@linaro.org, nicolas.dechesne@linaro.org, ctatlor97@gmail.com, vkoul@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Access to GICR_WAKER is restricted on msm8996 SoC in Hypervisor.
There are many devices out there with this restriction in place
and there has been no update to this firmware since last few years,
making those devices totally unusable for upstream development.

IIDR register value conflicts with other SoCs, using compatible seems
to be the only way to apply quirks required for msm8996 based SoCs.

Without this quirk many qcom SoCs (atleast 3 that I know) are
unable to boot mainline.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
index 3ea78c4ef887..b83bb8249074 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
@@ -7,7 +7,9 @@ Interrupts (LPI).
 
 Main node required properties:
 
-- compatible : should at least contain  "arm,gic-v3".
+- compatible : should at least contain  "arm,gic-v3" or either
+		"qcom,msm8996-gic-v3", "arm,gic-v3" for msm8996 SoCs
+		to address SoC specific bugs/quirks
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
   interrupt source. Must be a single cell with a value of at least 3.
-- 
2.19.2
