From: David Dai <daidavid1@codeaurora.org>
Subject: [PATCH 0/2] Redefine interconnect provider DT nodes for SDM845
Date: Fri, 19 Jul 2019 13:32:22 -0700
Message-ID: <1563568344-1274-1-git-send-email-daidavid1@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: georgi.djakov@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: David Dai <daidavid1@codeaurora.org>, evgreen@google.com, ilina@codeaurora.org, seansw@qti.qualcomm.com, elder@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Redefine the SDM845 interconnect device nodes as the previous definitions
of using a single child node under the apps_rsc device did not accurately
capture the description of the hardware. The Network-On-Chip (NoC) interconnect
devices should be represented in a manner akin to QCS404 platforms[1]
where there is a separation of NoC devices and its RPM/RPMh counterparts.

The bcm-voter devices are representing the RPMh devices that the interconnect
providers need to communicate with and there can be more than one instance of
the Bus Clock Manager (BCM) which can live under different instances of Resource
State Coordinators (RSC). There are display use cases where consumers may need
to target a different bcm-voter (Some display specific RSC) than the default,
and there needs to be a way to represent this connection in devicetree.

[1]: https://lkml.org/lkml/2019/6/13/143

David Dai (2):
  dt-bindings: interconnect: Update Qualcomm SDM845 DT bindings
  arm64: dts: sdm845: Redefine interconnect provider DT nodes

 .../bindings/interconnect/qcom,bcm-voter.txt       | 32 ++++++++++++
 .../bindings/interconnect/qcom,sdm845.txt          | 40 ++++++++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 61 ++++++++++++++++++++--
 3 files changed, 121 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.txt

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
