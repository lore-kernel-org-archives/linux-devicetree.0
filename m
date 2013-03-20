From: "Markus Mayer" <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/1] Makefile: build asm-generic before building scripts
Date: Tue, 19 Mar 2013 17:27:34 -0700
Message-ID: <1363739254-9425-2-git-send-email-mmayer@broadcom.com>
References: <1363739254-9425-1-git-send-email-mmayer@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1363739254-9425-1-git-send-email-mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

DTC requires devicetable-offsets.o, which in turn needs asm/types.h to be
present or else it will fail to build.

[...]
  CC      scripts/mod/devicetable-offsets.s
In file included from include/linux/types.h:5:0,
                 from include/linux/mod_devicetable.h:11,
                 from scripts/mod/devicetable-offsets.c:2:
include/uapi/linux/types.h:4:23: fatal error: asm/types.h:
                 No such file or directory

Signed-off-by: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 22113a7..83b15b8 100644
--- a/Makefile
+++ b/Makefile
@@ -513,7 +513,7 @@ ifeq ($(KBUILD_EXTMOD),)
 # Carefully list dependencies so we do not try to build scripts twice
 # in parallel
 PHONY += scripts
-scripts: scripts_basic include/config/auto.conf include/config/tristate.conf
+scripts: asm-generic scripts_basic include/config/auto.conf include/config/tristate.conf
 	$(Q)$(MAKE) $(build)=$(@)
 
 # Objects we will link into vmlinux / subdirs we need to visit
-- 
1.7.9.5
