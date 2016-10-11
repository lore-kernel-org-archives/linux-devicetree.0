From: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC V3 PATCH] msm8992: defconfig updates to support initrd
Date: Mon, 10 Oct 2016 22:19:35 -0700
Message-ID: <1476163175-13045-1-git-send-email-jeremymc@redhat.com>
References: <20161009012849.GH18158@rob-hp-laptop>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161009012849.GH18158@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Given the mimimal hardware support for msm899(2/4) currently.
Enable initrd to allow for continued development and booting.

Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
V2->V3
   Only enable BLK_DEV_RAM


 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 26dc69a..53fdb50 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -21,6 +21,9 @@ CONFIG_CGROUP_HUGETLB=y
 # CONFIG_NET_NS is not set
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_BLK_DEV_RAM=y
+# CONFIG_BLK_DEV_RAM_COUNT is not set
+# CONFIG_BLK_DEV_RAM_SIZE is not set
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
