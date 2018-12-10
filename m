From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 0/4] irqchip/gic-v3: Add support to DT based quirk for msm8996
Date: Mon, 10 Dec 2018 10:23:05 +0000
Message-ID: <20181210102309.8207-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com
Cc: sudeep.holla@arm.com, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, sboyd@kernel.org, bjorn.andersson@linaro.org, nicolas.dechesne@linaro.org, ctatlor97@gmail.com, vkoul@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Access to GICR_WAKER is restricted on msm8996 SoC in Hypervisor.
There are many devices out there with this restriction in place
and there has been no update to this firmware since last few years,
making those devices totally unusable for upstream development.

My previous attempts to add quirk based on IIDR register value seems to be
flawed by the fact that the value conflicted with other SoCs.
Last Suggestion by Marc Z using compatible seems to be the only way to apply
quirks required for msm8996 based SoCs.

Here is the patchset which add new compatible for msm8996 gicv3 and add
support gic_enable_of_quirks() followed by the actual quirk required for msm8996.

Without this quirk many qcom SoCs (atleast 3 that I know) are
unable to boot mainline.

Changes since v3:
- removed __maybe unused annotation
- moved enabling quirks to gic_of_init() as suggested by Marc
- fixed quick comment as suggest by Marc

Thanks,
Srini

Srinivas Kandagatla (4):
  dt-bindings/gic-v3: Add msm8996 compatible string
  irqchip/gic: common: add support to device tree based quirks
  irqchip: gic-v3: Add quirk for msm8996 secured registers
  arm64: dts: add msm8996 compatible to gicv3

 .../interrupt-controller/arm,gic-v3.txt       |  4 ++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  2 +-
 drivers/irqchip/irq-gic-common.c              | 12 +++++++++
 drivers/irqchip/irq-gic-common.h              |  3 +++
 drivers/irqchip/irq-gic-v3.c                  | 25 +++++++++++++++++++
 5 files changed, 44 insertions(+), 2 deletions(-)

-- 
2.19.2
