From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v10 1/9] dt-bindings: opp: Introduce opp-level bindings
Date: Thu, 10 Jan 2019 09:28:44 +0530
Message-ID: <20190110035852.5666-2-rnayak@codeaurora.org>
References: <20190110035852.5666-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110035852.5666-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On some SoCs (especially from Qualcomm and MediaTek) an OPP
node needs to describe an additional level/corner value
that is then communicated to a remote microprocessor by the CPU, which
then takes some actions (like adjusting voltage values across variousi
rails) based on the value passed.

Add opp-level as an additional property in the OPP node and describe it
in the OPP bindings document.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 Documentation/devicetree/bindings/opp/opp.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
index c396c4c0af92..e83fb7cbfd58 100644
--- a/Documentation/devicetree/bindings/opp/opp.txt
+++ b/Documentation/devicetree/bindings/opp/opp.txt
@@ -129,6 +129,11 @@ Optional properties:
 - opp-microamp-<name>: Named opp-microamp property. Similar to
   opp-microvolt-<name> property, but for microamp instead.
 
+- opp-level: On some SoC platforms an OPP node can describe a positive value
+  representing a corner/level that's communicated with a remote microprocessor
+  (usually called the power manager) which then translates it into a certain
+  voltage on a voltage rail.
+
 - clock-latency-ns: Specifies the maximum possible transition latency (in
   nanoseconds) for switching to this OPP from any other OPP.
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
