From: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Subject: [RFC PATCH 5/5] powerpc: Add HAVE_GENERIC_DMA_COHERENT options to Kconfig
Date: Wed, 29 Mar 2017 17:13:57 -0400
Message-ID: <1490822037-6752-6-git-send-email-roy.pledge@nxp.com>
References: <1490822037-6752-1-git-send-email-roy.pledge@nxp.com>
Reply-To: <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490822037-6752-1-git-send-email-roy.pledge-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robin.murphy-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: madalin.bucur-3arQi8VN3Tc@public.gmane.org, Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable HAVE_GENERIC_DMA_COHERENT to enable use of shared-dma-pool
reserved memory mappings

Signed-off-by: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 186e060..0e80e8b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -136,6 +136,7 @@ config PPC
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS
+	select HAVE_GENERIC_DMA_COHERENT
 	select HAVE_GENERIC_GUP
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
 	select HAVE_IDE
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
