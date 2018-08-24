From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v2 0/5] Wakeup GPIO support for SDM845 SoC
Date: Fri, 24 Aug 2018 14:01:52 -0600
Message-ID: <20180824200157.9993-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

Changes in v2:
	- Compile and test on 4.18 on SDM845
	- Fix IRQ map in patch #3
	- Address review comments
	(I still need to find a way to free memory allocated for PDC IRQ.)
	- Specify type for IRQ in DT
	- This series needs V3 of the PDC DT bingings [4]
	- gic-v3 settings are also needed [5]

Changes in v1:
        - Avoid GPIO-PDC map in .c file
        - Trigger GPIO by writing to the hardware
        - Hooked up to suspend/resume callbacks
        - Dropped PDC DT bindings (see dependencies)

This is an attempt at a solution to enable wake up from suspend and deep idle
using GPIO as a wakeup source. The 845 uses a new interrupt controller (PDC)
that lies in the always-on domain and can sense interrupts that are routed to
it, when the GIC is powered off. It would then wakeup the GIC and replay the
interrupt which would then be relayed to the AP. The PDC interrupt controller
driver is merged upstream [1],[2]. The following set of patches extends the
wakeup capability to GPIOs using the PDC. The TLMM pinctrl driver for the SoC
available at [3].

The complexity with the solution stems from the fact that only a selected few
GPIO lines are routed to the PDC in addition the TLMMs. They are also from
different banks on the pinctrl and the TLMM summary line is not routed to the
PDC. Hence the PDC cannot be considered as parent of the TLMM irqchip (or can
we ?). This is what it looks like -

   [ PIN ] -----[ TLMM ]---------------> [ GIC ] ---> [ CPU ]
      |                  <summary IRQ>       ^
      |                                      |
      ----------------------------------> [ PDC ]
                <wakeup IRQs>

I had a brief discussion with Linus on this and the idea implemented is based
on his suggestion.

When an IRQ (let's call this latent IRQ) for a GPIO is requested, the
->irq_request_resources() is used by the TLMM driver to request a PDC pin. The
PDC pin associated with the GPIO is read from a  static map available in the
pinctrl-sdm845.c. (I think there should be a better location than a static map,
more on that later). Knowing the PDC pin from the map, we could look up the DT
bindings and request the PDC interrupt with the same trigger mask as the
interrupt requested. The ->set_type and ->set_wake are also trapped to set the
PDC IRQ's polarity and enable it when the latent IRQ is requested. When the PDC
detects the interrupt at suspend, it wakes up the GIC and replays the wakeup
IRQ. The GPIO handler function for the latent IRQ is invoked in turn.

Please review these patches and your inputs would be greatly appreciated and
(kindly) let me know if I have committed any blunders with this approach. There
is definitely opportunity to improve the location of the static GPIO-PDC pin
map. We could possibly put it as an data argument in the interrupts definition
of the PDC or with interrupt names. Also, I am still sorting out some issues
with the IRQ handling part of these patches. And I am unsure of how to set the
polarity of the PDC pin without locking, since we are not in hierarchy with the
PDC interrupt controller. Again, your inputs on these would be greatly helpful.

Thanks,
Lina

[1]. drivers/irqchip/qcom-pdc.c
[2]. Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
[3]. drivers/pinctrl/qcom/pinctrl-msm.c
[4]. https://lore.kernel.org/patchwork/patch/977589/
[5]. https://lore.kernel.org/patchwork/patch/975425/

Lina Iyer (5):
  drivers: pinctrl: qcom: add wakeup capability to GPIO
  dt-bindings: pinctrl: add wakeup capable GPIOs for SDM845
  drivers: pinctrl: msm: enable PDC interrupt only during suspend
  drivers: pinctrl: qcom: sdm845: support GPIO wakeup from suspend
  arm64: dts: qcom: add wake up interrupts for GPIOs for SDM845

 .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  | 104 ++++++++++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 152 +++++++++++++++-
 drivers/pinctrl/qcom/pinctrl-msm.c            | 164 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h            |   3 +
 drivers/pinctrl/qcom/pinctrl-sdm845.c         |   6 +
 5 files changed, 425 insertions(+), 4 deletions(-)

--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
