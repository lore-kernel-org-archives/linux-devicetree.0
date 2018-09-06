Return-Path: <SRS0=pRDT=LU=gmail.com=jim2101024@kernel.org>
From: Jim Quinlan <jim2101024@gmail.com>
Subject: [PATCH v5 07/12] PCI/MSI: enable PCI_MSI_IRQ_DOMAIN support for MIPS
Date: Thu,  6 Sep 2018 16:42:56 -0400
Message-Id: <1536266581-7308-8-git-send-email-jim2101024@gmail.com>
In-Reply-To: <1536266581-7308-1-git-send-email-jim2101024@gmail.com>
References: <1536266581-7308-1-git-send-email-jim2101024@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Russell King <linux@armlinux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, Kees Cook <keescook@chromium.org>, Jinbum Park <jinb.park7@gmail.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Jim Quinlan <jim2101024@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Palmer Dabbelt <palmer@sifive.com>, Stefan Agner <stefan@agner.ch>, Eric Anholt <eric@anholt.net>, Simon Horman <horms+renesas@verge.net.au>, Tony Lindgren <tony@atomide.com>, Stefan Wahren <stefan.wahren@i2se.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Olof Johansson <olof@lixom.net>, Thomas Hellstrom <thellstrom@vmware.com>, Alex Deucher <alexander.deucher@amd.com>, "Dirk Hohndel (VMware)" <dirk@hohndel.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Murphy <robin.murphy@arm.com>, Justin Chen <justinpopo6@gmail.com>, Markus Mayer <markus.mayer@broadcom.com>, Gareth Powell <gpowell@broadcom.com>, Doug Berger <opendmb@gmail.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Christoph Hellwig <hch@lst.de>
List-ID: <devicetree@vger.kernel.org>

Add MIPS as an arch that supports PCI_MSI_IRQ_DOMAIN and add
generation of msi.h in the MIPS arch.

Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
---
 drivers/pci/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 56ff8f6..61a9539 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -22,7 +22,7 @@ config PCI_MSI
 	   If you don't know what to do here, say Y.
 
 config PCI_MSI_IRQ_DOMAIN
-	def_bool ARC || ARM || ARM64 || X86
+	def_bool ARC || ARM || ARM64 || MIPS || X86
 	depends on PCI_MSI
 	select GENERIC_MSI_IRQ_DOMAIN
 
-- 
1.9.0.138.g2de3478
