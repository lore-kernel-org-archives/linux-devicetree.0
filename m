From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v5 0/4] Add DTS for SDM845 SoC and MTP
Date: Thu, 22 Feb 2018 11:42:04 +0530
Message-ID: <20180222061208.2031-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: andy.gross@linaro.org
Cc: devicetree@vger.kernel.org, dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>, marc.zyngier@arm.com, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

These are basic device tree files needed to boot a SDM845 MTP
board to a ramfs based serial console shell

Bindings are based on whats proposed for pinctrl/serial/clock
drivers for SDM845 SoC
pinctrl: https://patchwork.kernel.org/patch/10157143/ (This is now pulled
in by Linus Walleij for 4.17)
clocks: https://lkml.org/lkml/2018/1/31/209 (under review)
serial: https://patchwork.ozlabs.org/cover/860251/ (under review)

'PATCH 4/4' is based on v2 of serial patches, will need an update if
v3 (still in the works) has further binding updates

Since 'PATCH 3/4' also adds an ITS node and keeps it disabled, we also depend
on https://lkml.org/lkml/2018/1/29/383

changes in v5:
* Removed all instances of IRQ_TYPE_NONE

changes in v4:
* pull config changes to uart pins
* License in device tree files is still GPL-2.0

changes in v3:
* split the pinmux/pinconf nodes across SoC/Board files
* Fixes for issues reported with 'make dtbs W=2'
* other minor fixes based on review
 
changes in v2:
* dropped cpu-map
* dropped GIC_CPU_MASK_SIMPLE()
* Added new cpu compatible for kryo385
* added ITS node, marked as disabled

Rajendra Nayak (4):
  dt-bindings: arm: Document kryo385 cpu
  dt-bindings: qcom: Add SDM845 bindings
  arm64: dts: sdm845: Add minimal dts/dtsi files for sdm845 SoC and MTP
  arm64: dts: sdm845: Add serial console support

 Documentation/devicetree/bindings/arm/cpus.txt |   1 +
 Documentation/devicetree/bindings/arm/qcom.txt |   1 +
 arch/arm64/boot/dts/qcom/Makefile              |   1 +
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts        |  54 +++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi           | 316 +++++++++++++++++++++++++
 5 files changed, 373 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845.dtsi

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
