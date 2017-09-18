From: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Subject: [v5 02/12] soc/fsl/qbman: Use shared-dma-pool for BMan private memory allocations
Date: Mon, 18 Sep 2017 16:39:37 -0400
Message-ID: <1505767187-4596-3-git-send-email-roy.pledge@nxp.com>
References: <1505767187-4596-1-git-send-email-roy.pledge@nxp.com>
Reply-To: <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505767187-4596-1-git-send-email-roy.pledge-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: leoyang.li-3arQi8VN3Tc@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, madalin.bucur-3arQi8VN3Tc@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the shared-memory-pool mechanism for free buffer proxy record
area allocation.

Signed-off-by: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
---
 drivers/soc/fsl/qbman/bman_ccsr.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/soc/fsl/qbman/bman_ccsr.c b/drivers/soc/fsl/qbman/bman_ccsr.c
index eaa9585..05c4223 100644
--- a/drivers/soc/fsl/qbman/bman_ccsr.c
+++ b/drivers/soc/fsl/qbman/bman_ccsr.c
@@ -201,6 +201,21 @@ static int fsl_bman_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	/*
+	 * If FBPR memory wasn't defined using the qbman compatible string
+	 * try using the of_reserved_mem_device method
+	 */
+	if (!fbpr_a) {
+		ret = qbman_init_private_mem(dev, 0, &fbpr_a, &fbpr_sz);
+		if (ret) {
+			dev_err(dev, "qbman_init_private_mem() failed 0x%x\n",
+				ret);
+			return -ENODEV;
+		}
+	}
+
+	dev_dbg(dev, "Allocated FBPR 0x%llx 0x%zx\n", fbpr_a, fbpr_sz);
+
 	bm_set_memory(fbpr_a, fbpr_sz);
 
 	err_irq = platform_get_irq(pdev, 0);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
