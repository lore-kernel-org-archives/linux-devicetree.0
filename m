From: Dirk Behme <dirk.behme@googlemail.com>
Subject: [PATCH] distclean: Remove generated .dtb files
Date: Sat,  5 Nov 2011 07:19:15 +0100
Message-ID: <1320473955-4500-1-git-send-email-dirk.behme@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linaro-dev@lists.linaro.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, rob.herring@calxeda.com, grant.likely@linaro.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Dirk Behme <dirk.behme@de.bosch.com>, Jason Liu <jason.hui@linaro.org>, Shawn Guo <shawn.guo@freescale.com>
List-Id: devicetree@vger.kernel.org

The patch 'arm/dt: Add dtb make rule' adds support to
create a .dtb file. But this is never removed afterwards.
Remove the generated .dtb file if 'distclean' is called.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
CC: Rob Herring <rob.herring@calxeda.com>
CC: Shawn Guo <shawn.guo@freescale.com>
CC: Jason Liu <jason.hui@linaro.org>
CC: Grant Likely <grant.likely@secretlab.ca>
---
 arch/arm/boot/Makefile |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
index 1cd9b0a..08f0d35 100644
--- a/arch/arm/boot/Makefile
+++ b/arch/arm/boot/Makefile
@@ -71,6 +71,8 @@ $(obj)/%.dtb: $(src)/dts/%.dts
 
 $(obj)/dtbs: $(addprefix $(obj)/, $(dtb-y))
 
+clean-files := *.dtb
+
 quiet_cmd_uimage = UIMAGE  $@
       cmd_uimage = $(CONFIG_SHELL) $(MKIMAGE) -A arm -O linux -T kernel \
 		   -C none -a $(LOADADDR) -e $(STARTADDR) \
-- 
1.7.0.4
