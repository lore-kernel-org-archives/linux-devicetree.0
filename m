From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 2/4] libfdt: Extend the reach of FDT_ERR_BADPHANDLE
Date: Fri, 30 Sep 2016 15:57:15 +0200
Message-ID: <20160930135717.16511-3-maxime.ripard@free-electrons.com>
References: <20160930135717.16511-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160930135717.16511-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

So far, the BADPHANDLE error was only used for incorrect phandle values.
Extend that meaning to an improperly formatted phandle property.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/libfdt.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 361cc6c7198c..d2e5e031fb35 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -79,8 +79,10 @@
 	 * (e.g. missing a leading / for a function which requires an
 	 * absolute path) */
 #define FDT_ERR_BADPHANDLE	6
-	/* FDT_ERR_BADPHANDLE: Function was passed an invalid phandle
-	 * value.  phandle values of 0 and -1 are not permitted. */
+	/* FDT_ERR_BADPHANDLE: Function was passed an invalid phandle.
+	 * This can be caused either by an invalid phandle property
+	 * length, or the phandle value was either 0 or -1, which are
+	 * not permitted. */
 #define FDT_ERR_BADSTATE	7
 	/* FDT_ERR_BADSTATE: Function was passed an incomplete device
 	 * tree created by the sequential-write functions, which is
-- 
2.9.3
