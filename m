From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v4 10/10] MAINTAINERS: Add sdhci-st file to ARCH/STI architecture
Date: Wed,  9 Jul 2014 16:07:41 +0100
Message-ID: <1404918461-25390-11-git-send-email-peter.griffin@linaro.org>
References: <1404918461-25390-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1404918461-25390-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ulf.hansson@linaro.org, chris@printf.net, maxime.coquelin@st.com, patrice.chotard@st.com, srinivas.kandagatla@gmail.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, peppe.cavallaro@st.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6813d0a..8596e44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1343,6 +1343,7 @@ F:	drivers/pinctrl/pinctrl-st.c
 F:	drivers/media/rc/st_rc.c
 F:	drivers/i2c/busses/i2c-st.c
 F:	drivers/tty/serial/st-asc.c
+F:	drivers/mmc/host/sdhci-st.c
 
 ARM/TECHNOLOGIC SYSTEMS TS7250 MACHINE SUPPORT
 M:	Lennert Buytenhek <kernel@wantstofly.org>
-- 
1.9.1

