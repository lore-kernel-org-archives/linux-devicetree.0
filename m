From: Lina Iyer <ilina@codeaurora.org>
Subject: [RFC v3 0/3] qcom: GPIO IRQ wakeup using PDC irqchip
Date: Tue, 20 Nov 2018 17:06:45 -0700
Message-ID: <20181121000648.29262-1-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, evgreen@chromium.org, marc.zyngier@arm.com
Cc: linux-kernel@vger.kernel.org, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

This is an attempt at using GPIO as wake up sources. Based on discussions with
Stephen and Marc [1], the idea that is used here is to make PDC interrupt
controller the parent of TLMM irqchip. Wakeup capable GPIO IRQs have
corresponding parent interrupt in PDC and therefore the GIC. The TLMM irqchip
has a summary line into the GIC for all regular non-wakeup interrupt. 

This idea uses Thierry's hierarchical GPIO [2] and is dependent on [3]. Also
PDC device bindings published in [4] is needed.

Kindly review the series.

Thanks,
Lina

[1]. https://lore.kernel.org/patchwork/patch/998238/
[2]. https://lkml.org/lkml/2018/9/21/471
[3]. https://lkml.org/lkml/2018/9/21/474
[4]. https://lore.kernel.org/patchwork/patch/1008046/


Lina Iyer (3):
  drivers: pinctrl: msm: setup gpio irqchip in hierarchy with pdc
    irqchip
  dt-bindings: sdm845-pinctrl: add wakeup interrupt parent for GPIO
  arm64: dts: msm: add PDC wake irq maps for GPIOs for SDM845

 .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  |  31 ++++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  18 +++
 drivers/pinctrl/qcom/pinctrl-msm.c            | 125 +++++++++++++++++-
 3 files changed, 169 insertions(+), 5 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
