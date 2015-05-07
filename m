From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 01/12] mfd: dt-bindings: Provide human readable define for
 Clocksource mode
Date: Thu,  7 May 2015 14:38:33 +0100
Message-ID: <1431005924-21777-2-git-send-email-lee.jones@linaro.org>
References: <1431005924-21777-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431005924-21777-1-git-send-email-lee.jones@linaro.org>
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
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, rtc-linux@googlegroups.com, a.zummo@towertech.it, daniel.lezcano@linaro.org, wim@iguana.be, tglx@linutronix.de, Lee Jones <lee.jones@linaro.org>, linux@roeck-us.net, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

ST's Low Power Controller can now operate in three supported modes;
Watchdog, Real Time Clock and most recently as a Clocksource.  This new
define will allow the LPC IP to be configured for Clocksource from DT.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 include/dt-bindings/mfd/st-lpc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/mfd/st-lpc.h b/include/dt-bindings/mfd/st-lpc.h
index e3e6c75..d05894a 100644
--- a/include/dt-bindings/mfd/st-lpc.h
+++ b/include/dt-bindings/mfd/st-lpc.h
@@ -11,5 +11,6 @@
 
 #define ST_LPC_MODE_RTC		0
 #define ST_LPC_MODE_WDT		1
+#define ST_LPC_MODE_CLKSRC	2
 
 #endif /* __DT_BINDINGS_ST_LPC_H__ */
-- 
1.9.1
