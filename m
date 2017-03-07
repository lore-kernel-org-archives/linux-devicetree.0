From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v2 2/2] ARM: qcom_defconfig: Enable Qualcomm remoteproc and related drivers
Date: Tue,  7 Mar 2017 03:22:01 +0100
Message-ID: <20170307022201.24563-2-j.neuschaefer@gmx.net>
References: <20170307022201.24563-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170307022201.24563-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: devicetree@vger.kernel.org

An adsp-pil node is present in at least the MSM8974 SoC. Simply enable
all Qualcomm remoteproc drivers to avoid more work in the future.

The SMP2P driver is required for adsp-pil to initialize correctly.

Enable the SMSM driver at Bjorn Andersson's request: "We also need
CONFIG_QCOM_SMSM=y here, its currently used to signal state of the ring
buffers for WiFi."

CONFIG_QCOM_WCNSS_CTRL is required to load firmware/configuration data
into the WCNSS core, which handles WiFi and Bluetooth.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

---
v2:
* Extend the commit message
* Enable CONFIG_QCOM_SMSM and add Bjorn Andersson's A-b
* Enable CONFIG_QCOM_WCNSS_CTRL as well
---
 arch/arm/configs/qcom_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 4ffdd607205d..07666a7a9de5 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -190,11 +190,18 @@ CONFIG_MDM_LCC_9615=y
 CONFIG_MSM_MMCC_8960=y
 CONFIG_MSM_MMCC_8974=y
 CONFIG_HWSPINLOCK_QCOM=y
+CONFIG_REMOTEPROC=y
+CONFIG_QCOM_ADSP_PIL=y
+CONFIG_QCOM_Q6V5_PIL=y
+CONFIG_QCOM_WCNSS_PIL=y
 CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD=y
 CONFIG_QCOM_SMD_RPM=y
+CONFIG_QCOM_SMP2P=y
+CONFIG_QCOM_SMSM=y
+CONFIG_QCOM_WCNSS_CTRL=y
 CONFIG_IIO=y
 CONFIG_IIO_BUFFER_CB=y
 CONFIG_IIO_SW_TRIGGER=y
-- 
2.11.0
