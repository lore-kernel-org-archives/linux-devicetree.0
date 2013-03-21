From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH REPOST 3/7] kbuild: cmd_dtc_cpp: extract deps from both gcc -E
 and dtc
Date: Thu, 21 Mar 2013 12:23:10 -0600
Message-ID: <1363890194-31538-3-git-send-email-swarren@wwwdotorg.org>
References: <1363890194-31538-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1363890194-31538-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Prior to this change, when compiling *.dts to *.dtb, the dependency
output from dtc would be used, and when compiling *.dtsp to *.dtb, the
dependency output from gcc -E alone would be used, despite dtc also
being invoked (on a temporary file that was guaranteed to have no
dependencies).

With this change, when compiling *.dtsp to *.dtb, the dependency files
from both gcc -E and dtc are used. This will allow cmd_dtc_cpp to
replace cmd_dtc in a future change. In turn, that will allow the C pre-
processor to be run transparently on *.dts, without the need to a
separate rule or file extension to trigger it.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 scripts/Makefile.lib |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index af35521..6104335 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -156,7 +156,7 @@ cpp_flags      = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 
 ld_flags       = $(LDFLAGS) $(ldflags-y)
 
-dtc_cpp_flags  = -Wp,-MD,$(depfile) -nostdinc                            \
+dtc_cpp_flags  = -Wp,-MD,$(depfile).pre -nostdinc                        \
 		 -I$(srctree)/arch/$(SRCARCH)/boot/dts                   \
 		 -I$(srctree)/arch/$(SRCARCH)/boot/dts/include           \
 		 -undef -D__DTS__
@@ -278,7 +278,8 @@ dtc-tmp = $(subst $(comma),_,$(dot-target).dts)
 
 quiet_cmd_dtc_cpp = DTC+CPP $@
 cmd_dtc_cpp = $(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) $(dtc-tmp)
+	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) -d $(depfile).dtc $(dtc-tmp) ; \
+	cat $(depfile).pre $(depfile).dtc > $(depfile)
 
 $(obj)/%.dtb: $(src)/%.dtsp FORCE
 	$(call if_changed_dep,dtc_cpp)
-- 
1.7.10.4
