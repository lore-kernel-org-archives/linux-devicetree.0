From: "Bui Duc Phuc (Fukuda)" <phucduc.bui-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM:dts:armadillo800eva: Add console parametters
Date: Sun,  6 Aug 2017 20:55:02 +0700
Message-ID: <1502027702-4366-2-git-send-email-phucduc.bui@gmail.com>
References: <1502027702-4366-1-git-send-email-phucduc.bui@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502027702-4366-1-git-send-email-phucduc.bui-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Bui Duc Phuc <phucduc.bui-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

After the kernel boot, the login prompt doesn't appear.
This patch will add console parametters to bootargs to fix it.

Signed-off-by: Bui Duc Phuc <phucduc.bui-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index 1788e18..d383b37 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -24,7 +24,8 @@
 	};
 
 	chosen {
-		bootargs = "earlyprintk ignore_loglevel root=/dev/nfs ip=dhcp rw";
+		bootargs = "console=tty0 console=ttySC0,115200 earlyprintk
+				ignore_loglevel root=/dev/nfs ip=dhcp rw";
 		stdout-path = "serial0:115200n8";
 	};
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
