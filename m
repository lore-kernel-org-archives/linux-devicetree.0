From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC 00/17] MIPS: BMIPS updates and BCM3384 platform support
Date: Tue, 21 Oct 2014 12:31:29 -0700
Message-ID: <5446B491.2010701@gmail.com>
References: <1413865687-15255-1-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413865687-15255-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/20/2014 09:27 PM, Kevin Cernekee wrote:
> This patch series adds support for the Linux BMIPS5000 application
> processor on BCM3384, a cable modem chipset.  It incorporates the
> latest bugfixes and workarounds available for the BMIPS SMP and cache
> maintenance code.
> 
> The bootloader code[1] passes a device tree blob describing the
> memory setup, bootargs, peripheral configuration, clocks, etc.  For
> this reason, very little needs to be hardcoded in the kernel.

This really looks good to me, thanks!

Reviewed-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> 
> Dependencies:
> 
>  - bcm63xx_uart and of-serial changes, under review on the linux-serial
>    list
> 
>  - OHCI changes, pending inclusion on usb.git -next
> 
> [1] https://github.com/broadcom/aeolus
> 
> 
> Jon Fraser (2):
>   MIPS: BMIPS: Allow BMIPS3300 to utilize SMP ebase relocation code
>   MIPS: BMIPS: Mask off timer IRQs when hot-unplugging a CPU
> 
> Kevin Cernekee (15):
>   MIPS: BMIPS: Fix ".previous without corresponding .section" warnings
>   MIPS: BMIPS: Align secondary boot sequence with latest firmware
>     releases
>   MIPS: BMIPS: Introduce helper function to change the reset vector
>   MIPS: BMIPS: Explicitly configure reset vectors prior to secondary
>     boot
>   MIPS: Allow MIPS_CPU_SCACHE to be used with different line sizes
>   MIPS: BMIPS: Select the appropriate L1_CACHE_SHIFT for 438x and 5000
>     CPUs
>   MIPS: BMIPS: Let each platform customize the CPU1 IRQ mask
>   MIPS: BMIPS: Add special cache handling in c-r4k.c
>   MIPS: BMIPS: Add PRId for BMIPS5200 (Whirlwind)
>   MIPS: Create a helper function for DT setup
>   Documentation: DT: Add entries for BCM3384 and its peripherals
>   Documentation: DT: Add "mti" vendor prefix
>   MIPS: bcm3384: Initial commit of bcm3384 platform support
>   MAINTAINERS: Add entry for BCM33xx cable chips
>   MAINTAINERS: Add entry for bcm63xx/bcm33xx UDC gadget driver
> 
>  .../devicetree/bindings/mips/brcm/bcm3384-intc.txt |  37 ++++
>  .../devicetree/bindings/mips/brcm/bmips.txt        |   8 +
>  .../devicetree/bindings/mips/brcm/cm-dsl.txt       |  11 ++
>  .../devicetree/bindings/mips/brcm/usb.txt          |  11 ++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  MAINTAINERS                                        |  14 ++
>  arch/mips/Kbuild.platforms                         |   1 +
>  arch/mips/Kconfig                                  |  30 +++-
>  arch/mips/bcm3384/Makefile                         |   1 +
>  arch/mips/bcm3384/Platform                         |   7 +
>  arch/mips/bcm3384/dma.c                            |  81 +++++++++
>  arch/mips/bcm3384/irq.c                            | 193 +++++++++++++++++++++
>  arch/mips/bcm3384/setup.c                          |  97 +++++++++++
>  arch/mips/boot/dts/Makefile                        |   1 +
>  arch/mips/boot/dts/bcm3384.dtsi                    | 109 ++++++++++++
>  arch/mips/boot/dts/bcm93384wvg.dts                 |  32 ++++
>  arch/mips/configs/bcm3384_defconfig                |  78 +++++++++
>  arch/mips/include/asm/bmips.h                      |   1 +
>  arch/mips/include/asm/cpu.h                        |   1 +
>  arch/mips/include/asm/mach-bcm3384/dma-coherence.h |  48 +++++
>  arch/mips/include/asm/mach-bcm3384/war.h           |  24 +++
>  arch/mips/include/asm/prom.h                       |   1 +
>  arch/mips/kernel/bmips_vec.S                       |   3 -
>  arch/mips/kernel/cpu-probe.c                       |   1 +
>  arch/mips/kernel/prom.c                            |  18 ++
>  arch/mips/kernel/smp-bmips.c                       | 114 +++++++-----
>  arch/mips/lantiq/prom.c                            |  11 +-
>  arch/mips/mm/c-r4k.c                               |  43 +++++
>  arch/mips/ralink/of.c                              |  14 +-
>  29 files changed, 924 insertions(+), 67 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mips/brcm/bcm3384-intc.txt
>  create mode 100644 Documentation/devicetree/bindings/mips/brcm/bmips.txt
>  create mode 100644 Documentation/devicetree/bindings/mips/brcm/cm-dsl.txt
>  create mode 100644 Documentation/devicetree/bindings/mips/brcm/usb.txt
>  create mode 100644 arch/mips/bcm3384/Makefile
>  create mode 100644 arch/mips/bcm3384/Platform
>  create mode 100644 arch/mips/bcm3384/dma.c
>  create mode 100644 arch/mips/bcm3384/irq.c
>  create mode 100644 arch/mips/bcm3384/setup.c
>  create mode 100644 arch/mips/boot/dts/bcm3384.dtsi
>  create mode 100644 arch/mips/boot/dts/bcm93384wvg.dts
>  create mode 100644 arch/mips/configs/bcm3384_defconfig
>  create mode 100644 arch/mips/include/asm/mach-bcm3384/dma-coherence.h
>  create mode 100644 arch/mips/include/asm/mach-bcm3384/war.h
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
