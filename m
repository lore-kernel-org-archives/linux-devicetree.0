From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v5 5/7] MAINTAINERS: Add ST's Remote Processor Driver to
 ARM/STI ARCHITECTURE
Date: Tue, 12 Jan 2016 12:46:19 +0000
Message-ID: <1452602781-22424-6-git-send-email-lee.jones@linaro.org>
References: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: ohad@wizery.com, devicetree@vger.kernel.org, f.fainelli@gmail.com, kernel@stlinux.com, Nathan_Lynch@mentor.com, Lee Jones <lee.jones@linaro.org>, ludovic.barre@st.com, maxime.coquelin@st.com
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
