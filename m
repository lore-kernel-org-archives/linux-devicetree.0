From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 02/18] arm: fdt: Ensure that an embedded fdt is word-aligned
Date: Tue, 24 Jan 2012 15:20:56 -0800
Message-ID: <1327447272-30182-3-git-send-email-sjg@chromium.org>
References: <1327447272-30182-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1327447272-30182-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

By putting the fdt blob into a distinctive area we can ensure that it appears
at the start of the data section and is word-aligned.

Note: It does not seem to be possible to get objcopy to honour its
--section-alignment flag, which would otherwise provide an easier fix
for this problem.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 arch/arm/cpu/armv7/u-boot.lds |    5 +++++
 dts/Makefile                  |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/arm/cpu/armv7/u-boot.lds b/arch/arm/cpu/armv7/u-boot.lds
index 40ecf78..793e51b 100644
--- a/arch/arm/cpu/armv7/u-boot.lds
+++ b/arch/arm/cpu/armv7/u-boot.lds
@@ -43,6 +43,11 @@ SECTIONS
 
 	. = ALIGN(4);
 	.data : {
+		/*
+		 * Sadly objcopy seems to ignore --section-alignment.
+		 * Put any embedded device tree first so it is aligned.
+		 */
+		*(.dts.data)
 		*(.data)
 	}
 
diff --git a/dts/Makefile b/dts/Makefile
index 5792afd..83547d4 100644
--- a/dts/Makefile
+++ b/dts/Makefile
@@ -79,7 +79,7 @@ $(obj)dt.o: $(DT_BIN)
 	\
 	cd $(dir ${DT_BIN}) && \
 	$(OBJCOPY) -I binary -O $${oformat} -B $${oarch} \
-		$(notdir ${DT_BIN}) $@
+		--prefix-sections=.dts $(notdir ${DT_BIN}) $@
 	rm $(DT_BIN)
 
 OBJS-$(CONFIG_OF_EMBED)	:= dt.o
-- 
1.7.7.3
