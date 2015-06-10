From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v3 1/2] of: add Okaya Electric America vendor prefix
Date: Wed, 10 Jun 2015 18:44:22 +0200
Message-ID: <1433954663-31444-2-git-send-email-gary.bisson@boundarydevices.com>
References: <1432827466-8104-1-git-send-email-gary.bisson@boundarydevices.com>
 <1433954663-31444-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433954663-31444-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds vendor prefix for Okaya Electronic America, a provider
of LCD modules and display technologies.

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ee2ce7b..37d2de79 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -148,6 +148,7 @@ nintendo	Nintendo
 nokia	Nokia
 nvidia	NVIDIA
 nxp	NXP Semiconductors
+okaya	Okaya Electric America, Inc.
 onnn	ON Semiconductor Corp.
 opencores	OpenCores.org
 ortustech	Ortus Technology Co., Ltd.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
