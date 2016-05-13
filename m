From: Andy Gross <andy.gross@linaro.org>
Subject: [Patch v5 0/8] Qualcomm SCM Rework
Date: Thu, 12 May 2016 22:46:53 -0500
Message-ID: <1463111221-6963-1-git-send-email-andy.gross@linaro.org>
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
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, jilai wang <jilaiw@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The following set of patches does a bit of rework on the existing
Qualcomm SCM firmware.  The first couple of patches deals with turning
the current SCM into a platform driver.  The next couple are cleanups
that make adding the 64 support a little easier.  I added in a patch to
convert the scm-32 to use DMA streaming APIs.

I took Kumar's 64 bit support patch and modified it to use the arm_smccc
calls.  This simplified things quite a bit.

Lastly, there are a few DT patches to add the firmware node for a couple of the
supported platforms.

Changes from v4:
  * Fix Documentation error
  * Fix misc review comments

Changes from v3:
  * Added compatibles for the specific platforms requiring one clock.
  * All other platforms will use the generic binding that requires 3 clocks.

Changes from v2:
  * Added use of streaming DMA APIs for scm-32.
  * Changed DT binding to simplify compats.
  * Removed Kconfig.platform change that selected QCOM_SCM for ARM64
  * Fixed misc comments
  * Changed init function to populate the device differently.
  * Fixed missing of_node_put

Changes from v1:
  * Changed binding to reflect proper firmware node usage
  * Added arch_initcall to populate the firmware device, if present
  * Fixed various review comments
  * Removed extraneous includes from SCM 64 file.


Andy Gross (7):
  dt/bindings: firmware: Add Qualcomm SCM binding
  firmware: qcom: scm: Convert SCM to platform driver
  firmware: qcom: scm: Use atomic SCM for cold boot
  firmware: qcom: scm: Generalize shared error map
  firmware: qcom: scm: Convert to streaming DMA APIS
  dts: qcom: apq8084: Add SCM firmware node
  arm64: dts: msm8916: Add SCM firmware node

Kumar Gala (1):
  firmware: qcom: scm: Add support for ARM64 SoCs

 .../devicetree/bindings/firmware/qcom,scm.txt      |  28 +++
 arch/arm/boot/dts/qcom-apq8084.dtsi                |   8 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   8 +
 drivers/firmware/qcom_scm-32.c                     | 271 ++++++++-------------
 drivers/firmware/qcom_scm-64.c                     | 199 ++++++++++++++-
 drivers/firmware/qcom_scm.c                        | 171 ++++++++++++-
 drivers/firmware/qcom_scm.h                        |  31 ++-
 7 files changed, 523 insertions(+), 193 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scm.txt

-- 
1.9.1
