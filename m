From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v2 0/5] Qualcomm Shared Memory State Machines
Date: Thu, 24 Sep 2015 18:24:58 -0700
Message-ID: <1443144303-21020-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series implements the two different mechanisms for propagating single bit
state information, used on the various Qualcomm platforms.

The system was traditionally used by the modem and application processor to
convey information about boot progress, power states, error handling and so on.
This was implemented as SMSM, with status bits representing a single local
state.

As the complexity of the SoC grew the state bits array grew and the need for
targeting specific state information at specific remote processors appeared.
SMP2P solves this by having separate shared memory regions per processor-pair.

This state information is e.g. used to convey progress and status of remote
firmware loading. Individual bits maps to various stages of the boot and error
states.

Changed since v1:
- The series moved away from representing outgoing bits as gpios

Bjorn Andersson (5):
  dt-binding: soc: qcom: Add Qualcomm SMSM device tree documentation
  dt-binding: soc: qcom: Introduce qcom,smp2p binding documentation
  soc: qcom: Introduce common SMEM state machine code
  soc: qcom: smsm: Add driver for Qualcomm SMSM
  soc: qcom: smp2p: Qualcomm Shared Memory Point to Point

 .../devicetree/bindings/soc/qcom/qcom,smp2p.txt    | 104 ++++
 .../devicetree/bindings/soc/qcom/qcom,smsm.txt     | 104 ++++
 drivers/soc/qcom/Kconfig                           |  19 +
 drivers/soc/qcom/Makefile                          |   3 +
 drivers/soc/qcom/smem_state.c                      | 201 +++++++
 drivers/soc/qcom/smp2p.c                           | 578 +++++++++++++++++++
 drivers/soc/qcom/smsm.c                            | 625 +++++++++++++++++++++
 include/linux/soc/qcom/smem_state.h                |  18 +
 8 files changed, 1652 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt
 create mode 100644 drivers/soc/qcom/smem_state.c
 create mode 100644 drivers/soc/qcom/smp2p.c
 create mode 100644 drivers/soc/qcom/smsm.c
 create mode 100644 include/linux/soc/qcom/smem_state.h

-- 
1.8.2.2
