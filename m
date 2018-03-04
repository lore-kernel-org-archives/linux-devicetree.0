From: Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH 0/2] Add SAW support to QCOM SPMI driver
Date: Sun,  4 Mar 2018 14:31:47 +0200
Message-ID: <1520166709-554-1-git-send-email-ilialin@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, mark.rutland@arm.com
Cc: ilialin@codeaurora.org, amit.kucheria@linaro.org, nicolas.dechesne@linaro.org, celster@codeaurora.org, tfinkel@codeaurora.org
List-Id: devicetree@vger.kernel.org

The SAW is the “Subsystem Power Manager (SPM),
Adaptive Voltage Scaling (AVS)
and Dynamic Current Management (DCM) Wrapper”,
that is, a core that contains logic to implement the SPM, AVS,
and DCM functions. The SAW manages power controls for a client core
such as a CPU.

The PMIC regulators supplying power to the CPU cores should not
be controlled by the SPMI accesses directly, but through the SAW
interface.

The patch series adds SAW support to the SPMI regulator driver.
The special SAW controlled regulators should be configured by
device tree handle. The SPI driver will handle those regulators
separately through the SAW interface, instead of SPMI.

Ilia Lin (2):
  regulator: qcom_spmi: Add support for SAW
  dt-bindings: Add support for SAW documentation

 .../bindings/regulator/qcom,spmi-regulator.txt     |  45 +++++++
 drivers/regulator/qcom_spmi-regulator.c            | 133 ++++++++++++++++++++-
 2 files changed, 175 insertions(+), 3 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
