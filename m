From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 4/7] arm64: dts: add support for building DT overlays
Date: Tue, 28 Aug 2018 15:32:09 +0300
Message-ID: <1535459532-17211-5-git-send-email-t-kristo@ti.com>
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

Add simple support for building DT overlays. This just compiles any
given .dtso file under the base arch/arm64/boot/dts/*/ directory into
a .dtbo.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm64/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 106039d..f04c814 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -127,7 +127,7 @@ Image.%: Image
 zinstall install:
 	$(Q)$(MAKE) $(build)=$(boot) $@
 
-%.dtb: scripts
+%.dtb %.dtbo: scripts
 	$(Q)$(MAKE) $(build)=$(boot)/dts $(boot)/dts/$@
 
 PHONY += dtbs dtbs_install
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
