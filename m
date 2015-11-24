From: Lee Jones <lee.jones@linaro.org>
Subject: [RESEND v4 4/6] MAINTAINERS: Add ST's Remote Processor Driver to ARM/STI ARCHITECTURE
Date: Tue, 24 Nov 2015 13:14:20 +0000
Message-ID: <1448370862-19120-5-git-send-email-lee.jones@linaro.org>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, maxime.coquelin@st.com, ohad@wizery.com, devicetree@vger.kernel.org, Nathan_Lynch@mentor.com, f.fainelli@gmail.com, ludovic.barre@st.com, s-anna@ti.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f46784..322f5b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1538,6 +1538,7 @@ F:	drivers/phy/phy-miphy365x.c
 F:	drivers/phy/phy-stih407-usb.c
 F:	drivers/phy/phy-stih41x-usb.c
 F:	drivers/pinctrl/pinctrl-st.c
+F:	drivers/remoteproc/st_remoteproc.c
 F:	drivers/reset/sti/
 F:	drivers/rtc/rtc-st-lpc.c
 F:	drivers/tty/serial/st-asc.c
-- 
1.9.1
