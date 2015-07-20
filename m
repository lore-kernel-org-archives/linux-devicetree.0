From: Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v11 2/5] devicetree: Add NEC to the vendor-prefix list
Date: Mon, 20 Jul 2015 17:53:59 +0800
Message-ID: <1437386042-34825-2-git-send-email-jianwei.wang.chn@gmail.com>
References: <1437386042-34825-1-git-send-email-jianwei.wang.chn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437386042-34825-1-git-send-email-jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Wang <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xiubo Li <lixiubo-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

NEC represent NEC LCD Technologies, Ltd.

Signed-off-by: Alison Wang <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Xiubo Li <lixiubo-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index d444757..42ca6bc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -140,6 +140,7 @@ mundoreader	Mundo Reader S.L.
 murata	Murata Manufacturing Co., Ltd.
 mxicy	Macronix International Co., Ltd.
 national	National Semiconductor
+nec	NEC LCD Technologies, Ltd.
 neonode		Neonode Inc.
 netgear	NETGEAR
 netlogic	Broadcom Corporation (formerly NetLogic Microsystems)
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
