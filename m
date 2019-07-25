From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v2 02/14] dt-bindings: cpufreq: Re-organise kryo cpufreq to use it for other nvmem based qcom socs
Date: Thu, 25 Jul 2019 12:41:30 +0200
Message-ID: <20190725104144.22924-3-niklas.cassel@linaro.org>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725104144.22924-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Sricharan R <sricharan@codeaurora.org>, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sricharan R <sricharan@codeaurora.org>

The kryo cpufreq driver reads the nvmem cell and uses that data to
populate the opps. There are other qcom cpufreq socs like krait which
does similar thing. Except for the interpretation of the read data,
rest of the driver is same for both the cases. So pull the common things
out for reuse.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
[niklas.cassel@linaro.org: split dt-binding into a separate patch and
do not rename the compatible string.]
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Ilia Lin <ilia.lin@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since V1:
-Picked up tags.

 .../opp/{kryo-cpufreq.txt => qcom-nvmem-cpufreq.txt}   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/opp/{kryo-cpufreq.txt => qcom-nvmem-cpufreq.txt} (98%)

diff --git a/Documentation/devicetree/bindings/opp/kryo-cpufreq.txt b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
similarity index 98%
rename from Documentation/devicetree/bindings/opp/kryo-cpufreq.txt
rename to Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
index c2127b96805a..198441e80ba8 100644
--- a/Documentation/devicetree/bindings/opp/kryo-cpufreq.txt
+++ b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
@@ -1,13 +1,13 @@
-Qualcomm Technologies, Inc. KRYO CPUFreq and OPP bindings
+Qualcomm Technologies, Inc. NVMEM CPUFreq and OPP bindings
 ===================================
 
-In Certain Qualcomm Technologies, Inc. SoCs like apq8096 and msm8996
-that have KRYO processors, the CPU ferequencies subset and voltage value
-of each OPP varies based on the silicon variant in use.
+In Certain Qualcomm Technologies, Inc. SoCs like apq8096 and msm8996,
+the CPU frequencies subset and voltage value of each OPP varies based on
+the silicon variant in use.
 Qualcomm Technologies, Inc. Process Voltage Scaling Tables
 defines the voltage and frequency value based on the msm-id in SMEM
 and speedbin blown in the efuse combination.
-The qcom-cpufreq-kryo driver reads the msm-id and efuse value from the SoC
+The qcom-cpufreq-nvmem driver reads the msm-id and efuse value from the SoC
 to provide the OPP framework with required information (existing HW bitmap).
 This is used to determine the voltage and frequency value for each OPP of
 operating-points-v2 table when it is parsed by the OPP framework.
-- 
2.21.0
