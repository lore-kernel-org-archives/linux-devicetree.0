From: Ley Foon Tan <lftan@altera.com>
Subject: [PATCH 2/6] arm: mach-socfpga: enable pci support
Date: Tue, 28 Jul 2015 18:45:41 +0800
Message-ID: <1438080345-7233-3-git-send-email-lftan@altera.com>
References: <1438080345-7233-1-git-send-email-lftan@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1438080345-7233-1-git-send-email-lftan@altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <bhelgaas@google.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: devicetree@vger.kernel.org, lftan.linux@gmail.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ley Foon Tan <lftan@altera.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable CONFIG_ARCH_SUPPORT_MSI and CONFIG_PCI in SOCFPGA platform.

Signed-off-by: Ley Foon Tan <lftan@altera.com>
---
 arch/arm/mach-socfpga/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
index 90efdeb..7ff4576 100644
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@ -1,6 +1,7 @@
 menuconfig ARCH_SOCFPGA
 	bool "Altera SOCFPGA family" if ARCH_MULTI_V7
 	select ARCH_SUPPORTS_BIG_ENDIAN
+	select ARCH_SUPPORTS_MSI
 	select ARM_AMBA
 	select ARM_GIC
 	select CACHE_L2X0
@@ -9,6 +10,7 @@ menuconfig ARCH_SOCFPGA
 	select HAVE_ARM_SCU
 	select HAVE_ARM_TWD if SMP
 	select MFD_SYSCON
+	select PCI
 
 if ARCH_SOCFPGA
 config SOCFPGA_SUSPEND
-- 
1.8.2.1
