From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 5/7] arm64: dts: add support for per sub-dir makefiles for DT
 building
Date: Tue, 28 Aug 2018 15:32:10 +0300
Message-ID: <1535459532-17211-6-git-send-email-t-kristo@ti.com>
References: <1535459532-17211-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535459532-17211-1-git-send-email-t-kristo@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: catalin.marinas@arm.com, will.deacon@arm.com, linux@armlinux.org.uk, frowand.list@gmail.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Currently the makefile for arm64 builds all the DT files based on
rules in the arch/arm64/boot/dts/Makefile, as this is statically
passed via the $(build)= parameter. Change the $(build) parameter
to actually point to the subdir itself, so the makefile from
that subdir can be used to set-up build flags etc., for example
setting up DTC_FLAGS. The patsubst magic is used to strip the
trailing "/" from the path, as that confuses the kbuild system.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm64/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index f04c814..2ac4358 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -128,7 +128,7 @@ zinstall install:
 	$(Q)$(MAKE) $(build)=$(boot) $@
 
 %.dtb %.dtbo: scripts
-	$(Q)$(MAKE) $(build)=$(boot)/dts $(boot)/dts/$@
+	$(Q)$(MAKE) $(build)=$(patsubst %/,%,$(boot)/dts/$(dir $@)) $(boot)/dts/$@
 
 PHONY += dtbs dtbs_install
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
