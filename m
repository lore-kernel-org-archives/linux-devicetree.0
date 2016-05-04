From: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [Patch v3 0/8] Qualcomm SCM Rework
Date: Wed,  4 May 2016 17:50:37 -0500
Message-ID: <1462402245-18295-1-git-send-email-andy.gross@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jilai wang <jilaiw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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

 .../devicetree/bindings/firmware/qcom,scm.txt      |  26 +++
 arch/arm/boot/dts/qcom-apq8084.dtsi                |   8 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   8 +
 drivers/firmware/qcom_scm-32.c                     | 234 +++++++++------------
 drivers/firmware/qcom_scm-64.c                     | 208 +++++++++++++++++-
 drivers/firmware/qcom_scm.c                        | 169 ++++++++++++++-
 drivers/firmware/qcom_scm.h                        |  31 ++-
 7 files changed, 522 insertions(+), 162 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scm.txt

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
