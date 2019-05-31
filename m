From: Alex Elder <elder@linaro.org>
Subject: [PATCH v2 15/17] MAINTAINERS: add entry for the Qualcomm IPA driver
Date: Thu, 30 May 2019 22:53:46 -0500
Message-ID: <20190531035348.7194-16-elder@linaro.org>
References: <20190531035348.7194-1-elder@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531035348.7194-1-elder@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, arnd@arndb.de, bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org
Cc: evgreen@chromium.org, benchan@google.com, ejcaruso@google.com, cpratapa@codeaurora.org, syadagir@codeaurora.org, subashab@codeaurora.org, abhishek.esse@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add an entry in the MAINTAINERS file for the Qualcomm IPA driver

Signed-off-by: Alex Elder <elder@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 429c6c624861..a2dece647641 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12872,6 +12872,12 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/qcom/
 
+QCOM IPA DRIVER
+M:	Alex Elder <elder@kernel.org>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	drivers/net/ipa/
+
 QEMU MACHINE EMULATOR AND VIRTUALIZER SUPPORT
 M:	Gabriel Somlo <somlo@cmu.edu>
 M:	"Michael S. Tsirkin" <mst@redhat.com>
-- 
2.20.1
