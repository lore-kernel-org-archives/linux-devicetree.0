From: <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 6/6] ARM: dts: stm32f429: Add QSPI clock
Date: Fri, 30 Sep 2016 16:25:09 +0200
Message-ID: <1475245509-6487-7-git-send-email-gabriel.fernandez@st.com>
References: <1475245509-6487-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475245509-6487-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gabriel.fernandez-qxv4g6HH51o@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>

This patch adds the QSPI clock for stm32f469 discovery board.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index cb55ac8..80aecc0 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -66,6 +66,10 @@
 	};
 };
 
+&rcc {
+	compatible = "st,stm32f46xx-rcc", "st,stm32-rcc";
+};
+
 &clk_hse {
 	clock-frequency = <8000000>;
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
