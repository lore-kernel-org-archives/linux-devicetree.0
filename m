From: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v9 01/12] MAINTAINERS: Add RISC-V
Date: Tue, 26 Sep 2017 18:56:27 -0700
Message-ID: <20170927015638.19443-2-palmer@dabbelt.com>
References: <20170927015638.19443-1-palmer@dabbelt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170927015638.19443-1-palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, albert-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, mmarek-IBi9RG/b67k@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boqun.feng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nathan=20Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>, Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>

RISC-V needs a MAINTAINERS entry. Let's add one.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Signed-off-by: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6671f375f7fc..715e0e534d18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11501,6 +11501,16 @@ S:	Maintained
 F:	drivers/mtd/nand/r852.c
 F:	drivers/mtd/nand/r852.h
 
+RISC-V ARCHITECTURE
+M:	Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
+M:	Albert Ou <albert-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
+L:	patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org
+T:	git https://github.com/riscv/riscv-linux
+S:	Supported
+F:	arch/riscv/
+K:	riscv
+N:	riscv
+
 ROCCAT DRIVERS
 M:	Stefan Achatz <erazor_de-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
 W:	http://sourceforge.net/projects/roccat/
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
