From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 03/14] arm: fdt: Ensure that an embedded fdt is
	word-aligned
Date: Wed, 23 Nov 2011 19:54:45 -0800
Message-ID: <1322106896-23054-4-git-send-email-sjg@chromium.org>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1322106896-23054-2-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Albert ARIBAUD <albert.u.boot@aribaud.net>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

By putting the fdt blob into a distinctive area we can ensure that it appears
at the start of the data section and is word-aligned.

Note: It does not seem to be possible to get objcopy to honour its
--section-alignment flag, which would otherwise provide an easier fix
for this problem.

Signed-off-by: Simon Glass <sjg@chromium.org>
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
1.7.3.1
