From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [RFC PATCH] dt-bindings: opp: Extend qcom-opp bindings with properties needed for CPR
Date: Mon, 15 Oct 2018 14:47:49 +0200
Message-ID: <20181015124749.27276-1-niklas.cassel@linaro.org>
References: <20180627045234.27403-3-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180627045234.27403-3-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, rnayak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>
List-Id: devicetree@vger.kernel.org

Extend qcom-opp bindings with properties needed for Core Power Reduction
(CPR).

CPR is included in a great variety of Qualcomm SoC, e.g. msm8916 and
msm8996, and was first introduced in msm8974.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
Hello Rob, Rajendra,

Sorry for not replying sooner.
Since Rob wanted the binding to be complete before merging,
this is my proposal to extend the OPP binding with properties
needed to support CPR (both for msm8916 and msm8996).
I've discussed the proposal with Viresh, and this proposal
seems better than what I previously suggested here:
https://lore.kernel.org/lkml/20181005204424.GA29500@centauri.lan/

 .../devicetree/bindings/opp/qcom-opp.txt      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/opp/qcom-opp.txt b/Documentation/devicetree/bindings/opp/qcom-opp.txt
index db4d970c7ec7..3ab5dd84de86 100644
--- a/Documentation/devicetree/bindings/opp/qcom-opp.txt
+++ b/Documentation/devicetree/bindings/opp/qcom-opp.txt
@@ -23,3 +23,22 @@ Required properties:
 representing a corner/level that's communicated with a remote microprocessor
 (usually called the RPM) which then translates it into a certain voltage on
 a voltage rail.
+
+Optional properties:
+- opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer. Even
+  though a power domain doesn't need a opp-hz, there can be devices in the
+  power domain that need to know the highest supported frequency for each
+  corner/level (e.g. CPR), in order to properly initialize the hardware.
+
+- qcom,fuse-level: A positive value representing the fuse corner/level
+  associated with this OPP node. Sometimes several corners/levels shares
+  a certain fuse corner/level. A fuse corner/level contains e.g. ref uV,
+  min uV, and max uV.
+
+- qcom,fuse-level-<name>: Named qcom,fuse-level property. This is exactly
+  similar to the above qcom,fuse-level property, but allows multiple
+  fuse corners/levels to be provided for the same OPP. At runtime, the
+  platform can pick a <name> and matching qcom,fuse-level-<name> property
+  will be enabled for all OPPs. If the platform doesn't pick a specific
+  <name> or the <name> doesn't match with any qcom,fuse-level-<name>
+  properties, then qcom,fuse-level property shall be used, if present.
-- 
2.17.2
