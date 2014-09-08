From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v6 5/5] MAINTAINERS: Add ehci-st.c and ohci-st.c to ARCH/STI architecture
Date: Mon,  8 Sep 2014 13:04:48 +0100
Message-ID: <1410177888-26710-6-git-send-email-peter.griffin@linaro.org>
References: <1410177888-26710-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410177888-26710-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, arnd@arndb.de
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the ehci-st.c and ohci-st.c files for the usb 2.0
& usb1.1 host controller drivers found on stih41x and stih4xx STMicroelectronics
SoC's into the STI arch section of the maintainers file.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf24bb5..5abd281 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1398,6 +1398,8 @@ F:	drivers/media/rc/st_rc.c
 F:	drivers/i2c/busses/i2c-st.c
 F:	drivers/tty/serial/st-asc.c
 F:	drivers/mmc/host/sdhci-st.c
+F:	drivers/usb/host/ehci-st.c
+F:	drivers/usb/host/ohci-st.c
 
 ARM/TECHNOLOGIC SYSTEMS TS7250 MACHINE SUPPORT
 M:	Lennert Buytenhek <kernel@wantstofly.org>
-- 
1.9.1
