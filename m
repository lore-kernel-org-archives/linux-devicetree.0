From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v2 0/2] interconnect: qcom: add msm8974 support
Date: Sat,  5 Oct 2019 07:46:03 -0400
Message-ID: <20191005114605.5279-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, georgi.djakov@linaro.org, robh+dt@kernel.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonathan@marek.ca
List-Id: devicetree@vger.kernel.org

Here's a patch series that adds interconnect support for the Qualcomm
MSM8974, which is needed so that the GPU can be supported upstream.

I didn't include the changes to arch/arm/boot/dts/qcom-msm8974.dtsi
since I have some other device tree patches coming. I'll send them
all out in a single series once rc4 comes out to avoid any merge
conflicts. Here's the necessary nodes that need to be added to that
file:

  #include <dt-bindings/interconnect/qcom,msm8974.h>

  bimc: interconnect@fc380000 {
          reg = <0xfc380000 0x6a000>;
          compatible = "qcom,msm8974-bimc";
          #interconnect-cells = <1>;
          clock-names = "bus", "bus_a";
          clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
                   <&rpmcc RPM_SMD_BIMC_A_CLK>;
  };

  cnoc: interconnect@fc480000 {
          reg = <0xfc480000 0x4000>;
          compatible = "qcom,msm8974-cnoc";
          #interconnect-cells = <1>;
          clock-names = "bus", "bus_a";
          clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
                   <&rpmcc RPM_SMD_CNOC_A_CLK>;
  };

  mmssnoc: interconnect@fc478000 {
          reg = <0xfc478000 0x4000>;
          compatible = "qcom,msm8974-mmssnoc";
          #interconnect-cells = <1>;
          clock-names = "bus", "bus_a";
          clocks = <&mmcc MMSS_S0_AXI_CLK>,
                   <&mmcc MMSS_S0_AXI_CLK>;
  };

  ocmemnoc: interconnect@fc470000 {
          reg = <0xfc470000 0x4000>;
          compatible = "qcom,msm8974-ocmemnoc";
          #interconnect-cells = <1>;
          clock-names = "bus", "bus_a";
          clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
                   <&rpmcc RPM_SMD_OCMEMGX_A_CLK>;
  };

  pnoc: interconnect@fc468000 {
          reg = <0xfc468000 0x4000>;
          compatible = "qcom,msm8974-pnoc";
          #interconnect-cells = <1>;
          clock-names = "bus", "bus_a";
          clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
                   <&rpmcc RPM_SMD_PNOC_A_CLK>;
  };

  snoc: interconnect@fc460000 {
          reg = <0xfc460000 0x4000>;
          compatible = "qcom,msm8974-snoc";
          #interconnect-cells = <1>;
          clock-names = "bus", "bus_a";
          clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
                   <&rpmcc RPM_SMD_SNOC_A_CLK>;
  };

Brian Masney (2):
  dt-bindings: interconnect: qcom: add msm8974 bindings
  interconnect: qcom: add msm8974 driver

 .../bindings/interconnect/qcom,msm8974.yaml   |  62 ++
 drivers/interconnect/qcom/Kconfig             |   9 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/msm8974.c           | 784 ++++++++++++++++++
 .../dt-bindings/interconnect/qcom,msm8974.h   | 146 ++++
 5 files changed, 1003 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
 create mode 100644 drivers/interconnect/qcom/msm8974.c
 create mode 100644 include/dt-bindings/interconnect/qcom,msm8974.h

-- 
2.21.0
