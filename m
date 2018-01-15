From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 0/8] ARM: sun9i: SMP and CPU hotplug support
Date: Mon, 15 Jan 2018 15:14:42 +0800
Message-ID: <20180115071450.18355-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB4NJ6HJAKGQEJV3U3FY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is v3 of my sun9i SMP/hotplug support series which was started
over two years ago [1]. We've tried to implement PSCI for both the A80
and A83T. Results were not promising. The issue is that these two chips
have a broken security extensions implementation. If a specific bit is
not burned in its e-fuse, most if not all security protections don't
work [2]. Even worse, non-secure access to the GIC become secure. This
requires a crazy workaround in the GIC driver which probably doesn't work
in all cases [3].

This version completely does away with the MCPM framework, instead just
implementing a set of smp_ops. Most of the code from the previous
version was reused, so the structure still has some traces of MCPM.
As our hardware has CCI-400, we still need some sort of MMU/cache
disabled trampoline code to enable cache coherency. Code for this
was adapted from the MCPM framework. This and the entry code are done
in inline assembly. Most of the other sunxi-specific code is derived
from Allwinner code and documentation, with some references to the
other MCPM implementations, as well as the Cortex's Technical Reference
Manuals for the power sequencing stuff.

This currently only works for !THUMB2_KERNEL. The entry code needs some
work to work with a Thumb kernel, and while I've looked at the ARM entry
code for this, it seems either my knowledge of ARM, Thumb mode or PIC
programming skills is lacking, as I could not get it to work. If anyone
is interested, the remaining changes can be found here [4]. The Kconfig
symbol is guarded against this, so if the users chooses THUMB2_KERNEL,
they will lose SMP on this platform.

Hope we can get this version merged. A83T SMP support will be built on
it.

On the side, THUMB2_KERNEL has not worked for me in some time. My custom
kernel config[5] boots, but gets an undefined instruction exception upon
returning from a syscall to userspace.

Regards
ChenYu

Changes since v2:
  - Do away with the MCPM framework, directly implement smp_ops
  - Some debug messages were clarified
  - New ARCH_SUNXI_MCPM Kconfig symbol for this feature

Changes since v1:

  - Leading zeroes for device node addresses removed
  - Added device tree binding for SMP SRAM
  - Simplified Kconfig options
  - Switched to SPDX license identifier
  - Map CPU to device tree node and check compatible to see if it's
    Cortex-A15 or Cortex-A7
  - Fix incorrect CPUCFG cluster status macro that prevented cluster
    0 L2 cache WFI detection
  - Fixed reversed bit for turning off cluster
  - Put cluster in reset before turning off power (or it hangs)
  - Added dedicated workqueue for turning off power to cpus and clusters
  - Request CPUCFG and SRAM MMIO ranges
  - Some comments fixed or added
  - Some debug messages added

[1] http://www.spinics.net/lists/arm-kernel/msg418350.html
[2] https://lists.denx.de/pipermail/u-boot/2017-June/294637.html
[3] https://github.com/wens/linux/commit/c48654c1f737116e7a7660183c8c74fa91970528
[4] https://github.com/wens/linux/commits/sun9i-smp-mcpm-v3
[5] http://wens.tw/a83t/arm-sunxi-config

Chen-Yu Tsai (8):
  ARM: sun9i: Support SMP bring-up on A80
  ARM: dts: sun9i: Add CCI-400 device nodes for A80
  ARM: dts: sun9i: Add CPUCFG device node for A80 dtsi
  ARM: dts: sun9i: Add PRCM device node for the A80 dtsi
  ARM: sun9i: mcpm: Support CPU/cluster power down and hotplugging for
    cpu1~7
  dt-bindings: ARM: sunxi: Document A80 SoC secure SRAM usage by SMP
    hotplug
  ARM: sun9i: mcpm: Support cpu0 hotplug
  ARM: dts: sun9i: Add secure SRAM node used for MCPM SMP hotplug

 .../devicetree/bindings/arm/sunxi/smp-sram.txt     |  44 ++
 arch/arm/boot/dts/sun9i-a80.dtsi                   |  75 ++
 arch/arm/mach-sunxi/Kconfig                        |   7 +
 arch/arm/mach-sunxi/Makefile                       |   1 +
 arch/arm/mach-sunxi/mcpm.c                         | 789 +++++++++++++++++++++
 5 files changed, 916 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/sunxi/smp-sram.txt
 create mode 100644 arch/arm/mach-sunxi/mcpm.c

-- 
2.15.1
