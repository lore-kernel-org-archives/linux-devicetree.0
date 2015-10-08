From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 06/13] h8300: enable building of all dtbs
Date: Thu,  8 Oct 2015 12:53:40 -0500
Message-ID: <1444326827-3565-7-git-send-email-robh@kernel.org>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444326827-3565-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, uclinux-h8-devel-5NWGOfrQmneRv+LV9MX5uooqe+aC9MnS@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable building all dtb files when CONFIG_OF_ALL_DTBS is enabled. The dtbs
are not really dependent on a platform being enabled or any other kernel
config, so for testing coverage it is convenient to build all of the dtbs.
This builds all dts files in the tree, not just targets listed.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
Cc: uclinux-h8-devel-5NWGOfrQmneRv+LV9MX5uooqe+aC9MnS@public.gmane.org
---
 arch/h8300/boot/dts/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/h8300/boot/dts/Makefile b/arch/h8300/boot/dts/Makefile
index 0abaf1a..6c08467 100644
--- a/arch/h8300/boot/dts/Makefile
+++ b/arch/h8300/boot/dts/Makefile
@@ -8,5 +8,8 @@ dtb-$(CONFIG_H8300H_SIM) := h8300h_sim.dtb
 dtb-$(CONFIG_H8S_SIM) := h8s_sim.dtb
 dtb-$(CONFIG_H8S_EDOSK2674) := edosk2674.dtb
 
+dtstree		:= $(srctree)/$(src)
+dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
+
 always	    := $(dtb-y)
 clean-files := *.dtb.S *.dtb
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
