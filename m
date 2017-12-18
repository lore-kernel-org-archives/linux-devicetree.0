From: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH V2 1/9] devicetree: bindings: Document supported STM32 SoC family
Date: Mon, 18 Dec 2017 16:17:44 +0100
Message-ID: <1513610272-7824-2-git-send-email-ludovic.Barre@st.com>
References: <1513610272-7824-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513610272-7824-1-git-send-email-ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Gerald Baeza <gerald.baeza-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, Gwenael Treuveur <gwenael.treuveur-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>

This adds a list of supported STM32 SoC bindings.

Signed-off-by: Gwenael Treuveur <gwenael.treuveur-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/stm32.txt | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/stm32.txt

diff --git a/Documentation/devicetree/bindings/arm/stm32.txt b/Documentation/devicetree/bindings/arm/stm32.txt
new file mode 100644
index 0000000..05762b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/stm32.txt
@@ -0,0 +1,9 @@
+STMicroelectronics STM32 Platforms Device Tree Bindings
+
+Each device tree must specify which STM32 SoC it uses,
+using one of the following compatible strings:
+
+  st,stm32f429
+  st,stm32f469
+  st,stm32f746
+  st,stm32h743
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
