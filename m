Return-Path: <SRS0=v5kC=H3=linaro.org=viresh.kumar@kernel.org>
From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 resend] PM / OPP: dt-bindings: Make "opp-hz" optional for power domains
Date: Tue,  8 May 2018 09:04:42 +0530
Message-Id: <525112ef4e6148d8fc46d92c0554bd516e24952f.1525750390.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1523273291.git.viresh.kumar@linaro.org>
References: <cover.1523273291.git.viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-ID: <devicetree@vger.kernel.org>

The "opp-hz" property is not relevant across all the devices that use
the OPP tables now. For example, for a power domain a frequency value
wouldn't mean anything. Though they must have another property, which
may be implementation defined, which uniquely identifies the OPP nodes.

Make "opp-hz" optional for such devices.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---
Resending to get Ack from Rob.

 Documentation/devicetree/bindings/opp/opp.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
index 788052d66c9d..c396c4c0af92 100644
--- a/Documentation/devicetree/bindings/opp/opp.txt
+++ b/Documentation/devicetree/bindings/opp/opp.txt
@@ -82,7 +82,10 @@ This defines voltage-current-frequency combinations along with other related
 properties.
 
 Required properties:
-- opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer.
+- opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer. This is a
+  required property for all device nodes but devices like power domains. The
+  power domain nodes must have another (implementation dependent) property which
+  uniquely identifies the OPP nodes.
 
 Optional properties:
 - opp-microvolt: voltage in micro Volts.
-- 
2.15.0.194.g9af6a3dea062
