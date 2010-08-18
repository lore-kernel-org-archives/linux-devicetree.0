From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 14/14] ARM: vexpress: add device tree build system and
	dtbuImage
Date: Wed, 18 Aug 2010 16:03:03 -0600
Message-ID: <AANLkTikr4xV6mw-mOSixV23tDFzPz+tyUPmz1+AOKjtM@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-12-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-13-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-14-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-15-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-15-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 18, 2010 at 1:00 PM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> The introduction of device tree in ARM Linux kernel tree requires the
> definition of a new class of machines. Board init files should be split
> in DT and non-DT (static) and the Kernel build system and config files
> should be updated accordingly. To allow u-boot to recognize and boot
> images with a device tree embedded stub, a new image is required
> (dtbuImage), which is a u-boot compressed image with an assembly stub
> containing the compiled flattened device tree.
>
> This patch modifies the kernel build and config system to take into
> account the Versatile Express device tree machine port and adds a new
> image file suitable for booting a DT kernel with u-boot.
> An appropriate machine config is added encompassing all config
> parameters needed to compile in C units for DT booting on Versatile
> Express.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> ---
> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++--
> =A0arch/arm/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/arm/boot/Makefile =A0 =A0 =A0 =A0 =A0| =A0 10 +++++++++-
> =A0arch/arm/mach-vexpress/Kconfig =A0| =A0 =A07 +++++++
> =A0arch/arm/mach-vexpress/Makefile | =A0 =A05 +++--
> =A0arch/arm/mm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A06 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 4ebecee..a63f7c2 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1104,10 +1104,10 @@ config SMP
> =A0 =A0 =A0 =A0bool "Symmetric Multi-Processing (EXPERIMENTAL)"
> =A0 =A0 =A0 =A0depends on EXPERIMENTAL && (REALVIEW_EB_ARM11MP || REALVIE=
W_EB_A9MP ||\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 MACH_REALVIEW_PB11MP || MACH_REALVIEW_PBX=
 || ARCH_OMAP4 ||\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARCH_U8500 || ARCH_VEXPRESS_CA9X4)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARCH_U8500 || ARCH_VEXPRESS_CA9X4 || ARC=
H_VEXPRESS_CA9X4_DT)
> =A0 =A0 =A0 =A0depends on GENERIC_CLOCKEVENTS
> =A0 =A0 =A0 =A0select USE_GENERIC_SMP_HELPERS
> - =A0 =A0 =A0 select HAVE_ARM_SCU if (ARCH_REALVIEW || ARCH_OMAP4 || ARCH=
_U8500 || ARCH_VEXPRESS_CA9X4)
> + =A0 =A0 =A0 select HAVE_ARM_SCU if (ARCH_REALVIEW || ARCH_OMAP4 || ARCH=
_U8500 || ARCH_VEXPRESS_CA9X4 || ARCH_VEXPRESS_CA9X4_DT)

This of course is not sustainable.  There should be a common config
symbol which these boards select.  ARCH_VEXPRESS_CA9X4 and
ARCH_VEXPRESS_CA9X4_DT should certainly not be tested for separately.

> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0This enables support for systems with more than one CP=
U. If you have
> =A0 =A0 =A0 =A0 =A0a system with only one CPU, like most personal compute=
rs, say N. If
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index dab066a..3ce1751 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -264,7 +264,7 @@ archprepare:
> =A0# Convert bzImage to zImage
> =A0bzImage: zImage
>
> -zImage Image xipImage bootpImage uImage dtbImage: vmlinux
> +zImage Image xipImage bootpImage uImage dtbImage dtbuImage: vmlinux
> =A0 =A0 =A0 =A0$(Q)$(MAKE) $(build)=3D$(boot) MACHINE=3D$(MACHINE) $(boot=
)/$@
>
> =A0zinstall install: vmlinux
> diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
> index c608c98..63200f1 100644
> --- a/arch/arm/boot/Makefile
> +++ b/arch/arm/boot/Makefile
> @@ -27,7 +27,7 @@ INITRD_PHYS :=3D $(initrd_phys-y)
>
> =A0export ZRELADDR INITRD_PHYS PARAMS_PHYS
>
> -targets :=3D Image zImage xipImage bootpImage uImage dtbImage
> +targets :=3D Image zImage xipImage bootpImage uImage dtbuImage
>
> =A0ifeq ($(CONFIG_XIP_KERNEL),y)
>
> @@ -66,14 +66,18 @@ quiet_cmd_uimage =3D UIMAGE =A0$@
>
> =A0ifeq ($(CONFIG_ZBOOT_ROM),y)
> =A0$(obj)/uImage: LOADADDR=3D$(CONFIG_ZBOOT_ROM_TEXT)
> +$(obj)/dtbuImage: LOADADDR=3D$(CONFIG_ZBOOT_ROM_TEXT)
> =A0else
> =A0$(obj)/uImage: LOADADDR=3D$(ZRELADDR)
> +$(obj)/dtbuImage: LOADADDR=3D$(ZRELADDR)
> =A0endif
>
> =A0ifeq ($(CONFIG_THUMB2_KERNEL),y)
> =A0# Set bit 0 to 1 so that "mov pc, rx" switches to Thumb-2 mode
> =A0$(obj)/uImage: STARTADDR=3D$(shell echo $(LOADADDR) | sed -e "s/.$$/1/=
")
> +$(obj)/dtbuImage: STARTADDR=3D$(shell echo $(LOADADDR) | sed -e "s/.$$/1=
/")
> =A0else
> +$(obj)/dtbuImage: STARTADDR=3D$(LOADADDR)
> =A0$(obj)/uImage: STARTADDR=3D$(LOADADDR)
> =A0endif
>
> @@ -81,6 +85,10 @@ $(obj)/uImage: =A0 =A0 =A0 $(obj)/zImage FORCE
> =A0 =A0 =A0 =A0$(call if_changed,uimage)
> =A0 =A0 =A0 =A0@echo ' =A0Image $@ is ready'
>
> +$(obj)/dtbuImage: =A0 =A0 =A0$(obj)/dtbImage FORCE
> + =A0 =A0 =A0 $(call if_changed,uimage)
> + =A0 =A0 =A0 @echo ' =A0Image $@ is ready'
> +
> =A0$(obj)/bootp/bootp: $(obj)/zImage initrd FORCE
> =A0 =A0 =A0 =A0$(Q)$(MAKE) $(build)=3D$(obj)/bootp $@
> =A0 =A0 =A0 =A0@:
> diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kcon=
fig
> index 3f19b66..1d35a11 100644
> --- a/arch/arm/mach-vexpress/Kconfig
> +++ b/arch/arm/mach-vexpress/Kconfig
> @@ -6,4 +6,11 @@ config ARCH_VEXPRESS_CA9X4
> =A0 =A0 =A0 =A0select CPU_V7
> =A0 =A0 =A0 =A0select ARM_GIC
>
> +config ARCH_VEXPRESS_CA9X4_DT
> + =A0 =A0 =A0 bool "Versatile Express Cortex-A9x4 tile - DT enabled"
> + =A0 =A0 =A0 select CPU_V7
> + =A0 =A0 =A0 select ARM_GIC
> + =A0 =A0 =A0 select OF
> + =A0 =A0 =A0 select OF_FLATTREE
> +
> =A0endmenu
> diff --git a/arch/arm/mach-vexpress/Makefile b/arch/arm/mach-vexpress/Mak=
efile
> index 1b71b77..c6bc159 100644
> --- a/arch/arm/mach-vexpress/Makefile
> +++ b/arch/arm/mach-vexpress/Makefile
> @@ -2,7 +2,8 @@
> =A0# Makefile for the linux kernel.
> =A0#
>
> -obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0:=3D v2m.o
> -obj-$(CONFIG_ARCH_VEXPRESS_CA9X4) =A0 =A0 =A0+=3D ct-ca9x4.o
> +obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0:=3D v2m-base.o ct-ca9x4-base.o
> +obj-$(CONFIG_ARCH_VEXPRESS_CA9X4) =A0 =A0 =A0+=3D ct-ca9x4.o v2m.o
> +obj-$(CONFIG_ARCH_VEXPRESS_CA9X4_DT) =A0 +=3D ct-ca9x4-of.o v2m-of.o
> =A0obj-$(CONFIG_SMP) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D plat=
smp.o headsmp.o
> =A0obj-$(CONFIG_LOCAL_TIMERS) =A0 =A0 =A0 =A0 =A0 =A0 +=3D localtimer.o
> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> index 101105e..97bc19e 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -782,7 +782,7 @@ config CACHE_L2X0
> =A0 =A0 =A0 =A0bool "Enable the L2x0 outer cache controller"
> =A0 =A0 =A0 =A0depends on REALVIEW_EB_ARM11MP || MACH_REALVIEW_PB11MP || =
MACH_REALVIEW_PB1176 || \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 REALVIEW_EB_A9MP || ARCH_MX35 || ARCH=
_MX31 || MACH_REALVIEW_PBX || \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARCH_NOMADIK || ARCH_OMAP4 || ARCH_U=
8500 || ARCH_VEXPRESS_CA9X4
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARCH_NOMADIK || ARCH_OMAP4 || ARCH_U=
8500 || ARCH_VEXPRESS_CA9X4 || ARCH_VEXPRESS_CA9X4_DT
> =A0 =A0 =A0 =A0default y
> =A0 =A0 =A0 =A0select OUTER_CACHE
> =A0 =A0 =A0 =A0select OUTER_CACHE_SYNC
> --
> 1.6.3.3
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
