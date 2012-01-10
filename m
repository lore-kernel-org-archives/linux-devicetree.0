From: David Vrabel <david.vrabel@citrix.com>
Subject: Re: [PATCH v6 9/9] ARM: vexpress: Add Device Tree for V2P-CA15 core
 tile (TC1 variant)
Date: Tue, 10 Jan 2012 14:21:16 +0000
Message-ID: <4F0C495C.4000103@citrix.com>
References: <1323957761-13553-1-git-send-email-pawel.moll@arm.com>
 <1323957761-13553-10-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1323957761-13553-10-git-send-email-pawel.moll@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 15/12/11 14:02, Pawel Moll wrote:
> This patch adds Device Tree file for the CoreTile Express A15x2
> (V2P-CA15) with Test Chip 1.

This doesn't work as-is with the software model as accessing some of the
peripherals that aren't modeled will cause an exception.  Is it worth
having a device tree file suitable for the models? Or are the models too
configurable for this to be workable?

> As the chip's GIC has 160 interrupt inputs and equivalent SMM
> (FPGA) has GIC synthesised with 256 interrupts, NR_IRQS is
> increased.
> 
[...]
> --- /dev/null
> +++ b/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
[...]
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};

If CONFIG_ARM_ATAG_DTB_COMPAT is enabled the device tree will end up
with two nodes describing the memory ("memory" and "memory@80000000" in
this case).

>From 22cc6a3410077b99d81e42c4d7f4e29eab6070e3 Mon Sep 17 00:00:00 2001
From: David Vrabel <david.vrabel@citrix.com>
Date: Mon, 9 Jan 2012 16:13:19 +0000
Subject: [PATCH] ARM: vexpress: rename device tree "memory@..." nodes to
"memory"

If CONFIG_ARM_ATAG_DTB_COMPAT enabled it expects the memory
information to be in a node named "memory".  If the memory is
described in a different node, the device tree will end up with two
nodes describing the memory.

Signed-off-by: David Vrabel <david.vrabel@citrix.com>
---
 arch/arm/boot/dts/vexpress-v2p-aem-v7a.dts  |    2 +-
 arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts |    2 +-
 arch/arm/boot/dts/vexpress-v2p-ca5s.dts     |    2 +-
 arch/arm/boot/dts/vexpress-v2p-ca9.dts      |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/vexpress-v2p-aem-v7a.dts
b/arch/arm/boot/dts/vexpress-v2p-aem-v7a.dts
index 064132e..6667936 100644
--- a/arch/arm/boot/dts/vexpress-v2p-aem-v7a.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-aem-v7a.dts
@@ -33,7 +33,7 @@
 		};
 	};

-	memory@80000000 {
+	memory {
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
b/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
index 02cada5..0d82ac8 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
@@ -43,7 +43,7 @@
 		};
 	};

-	memory@80000000 {
+	memory {
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca5s.dts
b/arch/arm/boot/dts/vexpress-v2p-ca5s.dts
index da26a13..e4c3935 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca5s.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca5s.dts
@@ -45,7 +45,7 @@
 		};
 	};

-	memory@80000000 {
+	memory {
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca9.dts
b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
index 84542e7..d4aa1cc 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca9.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
@@ -59,7 +59,7 @@
 		};
 	};

-	memory@60000000 {
+	memory {
 		device_type = "memory";
 		reg = <0x60000000 0x40000000>;
 	};
-- 
1.7.2.5

David
