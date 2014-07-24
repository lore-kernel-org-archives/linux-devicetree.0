From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 3/3] MAINTAINERS: Add st-hcd to ARCH/STI architecture
Date: Thu, 24 Jul 2014 12:00:16 +0100
Message-ID: <1406199616-10533-4-git-send-email-peter.griffin@linaro.org>
References: <1406199616-10533-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406199616-10533-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, patrice.chotard@st.com, gregkh@linuxfoundation.org, srinivas.kandagatla@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: peter.griffin@linaro.org, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 702ca10..359a64e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1325,6 +1325,7 @@ F:	drivers/pinctrl/pinctrl-st.c
 F:	drivers/media/rc/st_rc.c
 F:	drivers/i2c/busses/i2c-st.c
 F:	drivers/tty/serial/st-asc.c
+F:	drivers/usb/host/st-hcd.c
 
 ARM/TECHNOLOGIC SYSTEMS TS7250 MACHINE SUPPORT
 M:	Lennert Buytenhek <kernel@wantstofly.org>
-- 
1.9.1
