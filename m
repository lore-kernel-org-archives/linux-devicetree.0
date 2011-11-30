From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v3 5/5] ARM: vexpress: DT-based support for CoreTiles
 Express A5x2 and A9x4
Date: Wed, 30 Nov 2011 18:39:24 +0000
Message-ID: <1322678364.3180.34.camel@hornet.cambridge.arm.com>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <1322579473-8804-6-git-send-email-pawel.moll@arm.com>
 <20111129164050.GC2829@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20111129164050.GC2829@localhost.localdomain>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dave Martin <dave.martin@linaro.org>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2011-11-29 at 16:40 +0000, Dave Martin wrote:
> Note that select PL310_ERRATA_753970 if CACHE_PL310 also needs to be
> propagated to ARCH_VEXPRESS_CA9X4.  Maybe we should have a common symbol
> which selects/depends on the common stuff instead of duplicating it for
> every coretile -- they will tend to get out of sync.

How about that?

8<--------------------------------------------------------------
menu "Versatile Express platform type"
	depends on ARCH_VEXPRESS

config ARCH_VEXPRESS_CORTEX_A5_A9
	bool
	select ARM_ERRATA_720789
	select ARM_ERRATA_751472
	select ARM_GIC
	select CPU_V7
	select HAVE_L2X0_L2CC
	select PL310_ERRATA_753970 if CACHE_PL310
	help
	  VE platforms based on Cortex-A5 or Cortex-A9 processors.

config ARCH_VEXPRESS_CA9X4
	bool "Versatile Express Cortex-A9x4 tile"
	select ARCH_VEXPRESS_CORTEX_A5_A9
	help
	  This option enabled support for VE system using original
	  CoreTile Express A9x4 (V2P-CA9) initialized with ATAGs.

config ARCH_VEXPRESS_RS1
	bool
	select ARM_PATCH_PHYS_VIRT
	select AUTO_ZRELADDR
	help
	  RS1 VE memory map (i.a. motherboard peripherals at
	  0x1c000000, RAM at 0x80000000).

config ARCH_VEXPRESS_DT
	bool
	select USE_OF
	help
	  VE platforms *requiring* Flattened Device Tree to boot.

config ARCH_VEXPRESS_V2P_CA5S_CA9
	bool "CoreTile Express A5x2 and A9x4 based platform support"
	select ARCH_VEXPRESS_CORTEX_A5_A9
	select ARCH_VEXPRESS_DT
	select ARCH_VEXPRESS_RS1
	help
	  This option enables support for systems using any of the following
	  ARM core tiles on the Versatile Express motherboard:

	  - CoreTile Express A5x2 (V2P-CA5s)
	  - CoreTile Express A9x4 (V2P-CA9)

	  You must boot using a Flattened Device Tree in order to use these
	  platforms.  The traditional (ATAGs) boot method is not usable on
	  these boards with this option.

	  If you want your kernel to run on one of these platforms and your
	  bootloader supports Flattened Device Tree based booting, say Y.

endmenu
8<-------------------------------------------------------------- 

Cheers!

Pawel
