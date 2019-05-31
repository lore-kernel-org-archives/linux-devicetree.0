From: Alex Elder <elder@linaro.org>
Subject: [PATCH v2 14/17] soc: qcom: ipa: support build of IPA code
Date: Thu, 30 May 2019 22:53:45 -0500
Message-ID: <20190531035348.7194-15-elder@linaro.org>
References: <20190531035348.7194-1-elder@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531035348.7194-1-elder@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, arnd@arndb.de, bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org
Cc: evgreen@chromium.org, benchan@google.com, ejcaruso@google.com, cpratapa@codeaurora.org, syadagir@codeaurora.org, subashab@codeaurora.org, abhishek.esse@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add build and Kconfig support for the Qualcomm IPA driver.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/Kconfig      |  2 ++
 drivers/net/Makefile     |  1 +
 drivers/net/ipa/Kconfig  | 16 ++++++++++++++++
 drivers/net/ipa/Makefile |  7 +++++++
 4 files changed, 26 insertions(+)
 create mode 100644 drivers/net/ipa/Kconfig
 create mode 100644 drivers/net/ipa/Makefile

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 48e209e55843..d87fe174eb9f 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -388,6 +388,8 @@ source "drivers/net/fddi/Kconfig"
 
 source "drivers/net/hippi/Kconfig"
 
+source "drivers/net/ipa/Kconfig"
+
 config NET_SB1000
 	tristate "General Instruments Surfboard 1000"
 	depends on PNP
diff --git a/drivers/net/Makefile b/drivers/net/Makefile
index 0d3ba056cda3..ff8918fe09b0 100644
--- a/drivers/net/Makefile
+++ b/drivers/net/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_ETHERNET) += ethernet/
 obj-$(CONFIG_FDDI) += fddi/
 obj-$(CONFIG_HIPPI) += hippi/
 obj-$(CONFIG_HAMRADIO) += hamradio/
+obj-$(CONFIG_IPA) += ipa/
 obj-$(CONFIG_PLIP) += plip/
 obj-$(CONFIG_PPP) += ppp/
 obj-$(CONFIG_PPP_ASYNC) += ppp/
diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
new file mode 100644
index 000000000000..b1e3f7405992
--- /dev/null
+++ b/drivers/net/ipa/Kconfig
@@ -0,0 +1,16 @@
+config IPA
+	tristate "Qualcomm IPA support"
+	depends on NET
+	select QCOM_QMI_HELPERS
+	select QCOM_MDT_LOADER
+	default n
+	help
+	  Choose Y here to include support for the Qualcomm IP Accelerator
+	  (IPA), a hardware block present in some Qualcomm SoCs.  The IPA
+	  is a programmable protocol processor that is capable of generic
+	  hardware handling of IP packets, including routing, filtering,
+	  and NAT.  Currently the IPA driver supports only basic transport
+	  of network traffic between the AP and modem, on the Qualcomm
+	  SDM845 SoC.
+
+	  If unsure, say N.
diff --git a/drivers/net/ipa/Makefile b/drivers/net/ipa/Makefile
new file mode 100644
index 000000000000..a43039c09a25
--- /dev/null
+++ b/drivers/net/ipa/Makefile
@@ -0,0 +1,7 @@
+obj-$(CONFIG_IPA)	+=	ipa.o
+
+ipa-y			:=	ipa_main.o ipa_clock.o ipa_mem.o \
+				ipa_interrupt.o gsi.o gsi_trans.o \
+				ipa_gsi.o ipa_smp2p.o ipa_uc.o \
+				ipa_endpoint.o ipa_cmd.o ipa_netdev.o \
+				ipa_qmi.o ipa_qmi_msg.o ipa_data-sdm845.o
-- 
2.20.1
