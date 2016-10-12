From: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC V3 PATCH 4/7] arm64: dts: msm8992 default serial config
Date: Wed, 12 Oct 2016 02:37:31 -0700
Message-ID: <1476265054-22511-5-git-send-email-jeremymc@redhat.com>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476265054-22511-1-git-send-email-jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

As per Documentation/devicetree/bindings/chosen.txt so that we
are not relying on implicit defaults.

Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
index 93b643b..e1855da 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
@@ -27,7 +27,7 @@
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	soc {
-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
