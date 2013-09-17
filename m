From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 1/2] ARM: STi: OF: Fix a typo in pincfg header
Date: Tue, 17 Sep 2013 10:27:27 +0100
Message-ID: <1379410047-9972-1-git-send-email-srinivas.kandagatla@st.com>
References: <1379410003-9911-1-git-send-email-srinivas.kandagatla@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379410003-9911-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

This patch fixes a typo for OD define in st-pincfg header file.

Reported-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/st-pincfg.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/st-pincfg.h b/arch/arm/boot/dts/st-pincfg.h
index 8c45d85..4851c38 100644
--- a/arch/arm/boot/dts/st-pincfg.h
+++ b/arch/arm/boot/dts/st-pincfg.h
@@ -15,7 +15,7 @@
 /* Pull Up */
 #define PU			(1 << 26)
 /* Open Drain */
-#define OD			(1 << 26)
+#define OD			(1 << 25)
 #define RT			(1 << 23)
 #define INVERTCLK		(1 << 22)
 #define CLKNOTDATA		(1 << 21)
-- 
1.7.6.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
