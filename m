From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCHv3 00/16] Suspend to RAM support for Armada XP
Date: Fri, 21 Nov 2014 20:44:05 -0500
Message-ID: <20141122014405.GM22670@titan.lakedaemon.net>
References: <1416585613-2113-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416585613-2113-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thomas,

Whole series applied to mvebu/soc-suspend with the exception of the
patch that needs to go through Russell's patch tracker.  I Acked that
one.

thx,

Jason.

On Fri, Nov 21, 2014 at 04:59:57PM +0100, Thomas Petazzoni wrote:
> Hello,
>=20
> This set of patches implement suspend to RAM for the Marvell Armada X=
P
> platform, and specifically for the Armada XP GP board. For now, it
> does not implement suspend/resume for all device drivers, it only
> implements the core of the suspend/resume functionality: enough to
> make sure that the system can enter suspend and resume from suspend,
> restart all CPUs, and get back to a shell prompt. Additional work in
> individual device drivers will be needed as follow-up patches.
>=20
> There are two important things to understand about the hardware befor=
e
> reading this patch series:
>=20
>  - The Armada XP SoC cannot put itself into a suspend to RAM state. I=
t
>    requires an external circuit, which in most cases, is a PIC
>    micro-controller, to turn off the SoC. This PIC is connected to th=
e
>    SoC using a set of GPIOs, which allow the SoC to talk to the PIC
>    and request certain things to be done.
>=20
>    This means that the Armada XP suspend/resume logic has some
>    board-specific code, which is fairly uncommon for suspend/resume
>    code in the ARM world.
>=20
>    We have chosen to represent the PIC and the fact that it's
>    connected to the SoC using 3 GPIOs in the Device
>    Tree.
>=20
>  - When exiting from suspend, the SoC is actually powered up again
>    completely from scratch, so it goes through the bootloader. The
>    kernel has to fill a bootloader-specific structure at a fixed
>    physical address to pass information to the bootloader that will
>    tell the bootloader to do a resume and therefore jump back directl=
y
>    into the kernel resume entry point, instead of doing a normal boot=
=2E
>=20
>  - The bootloader has to reconfigure the DRAM controller, which
>    involves executing some DDR3 training code that has the unfortunat=
e
>    side effect of overwriting the first 10 KB of each DRAM
>    chip-select. We therefore have to ensure that the kernel does not
>    use the first 10 KB of each DRAM chip select.
>=20
> So, in sequence:
>=20
>  * PATCH 1 and 2 are mainly preparation patches: Device Tree binding
>    documentation, fixing an errata of the Armada XP.
>=20
>  * PATCH 3 to 8 add suspend/resume support to some core drivers:
>    irqchip, clocksource, gpio, mvebu-mbus and clock.
>=20
>    Note that the gpio suspend/resume patch was said to be applied by
>    Linus Walleij in
>    http://lists.infradead.org/pipermail/linux-arm-kernel/2014-Novembe=
r/299201.html,
>    but I don't see it present in
>    https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git=
/log/?h=3Dfor-next,
>    so I've kept it for now in this patch series.
>=20
>  * PATCH 9 implements the core of the SoC suspend/resume logic.
>=20
>  * PATCH 10 makes sure the first 10 KB of each DRAM chip select isn't
>    used by the kernel.
>=20
>  * PATCH 11 implements the board-specific suspend/resume logic,
>    especially talking with the PIC micro-controller over GPIOs.
>=20
>  * PATCH 12 and 13 make some other additional changes to the Armada X=
P
>    SoC support to make suspend/resume work properly.
>=20
>  * PATCH 14 to 16 modify the Armada XP and Armada XP GP Device Tree
>    description to add the relevant hardware blocks that are needed fo=
r
>    suspend/resume: description of the PIC micro-controller and the 3
>    GPIOs connecting it to the SoC, an additional set of the register
>    for mvebu-mbus, and the registers for the SDRAM controller.
>=20
> Changes since v2:
>=20
>  - Add Acked-by from Daniel Lezcano on "clocksource:
>    time-armada-370-xp: add suspend/resume support".
>=20
>  - In "clk: mvebu: add suspend/resume for gatable clocks", switch to =
a
>    global syscore_ops structure instead of a per gatable clock
>    controller instance. Suggested by Mike Turquette.
>=20
> Changes since v1:
>=20
>  - Add Reviewed-by from Gr=E9gory Clement on
>=20
>    Documentation: dt-bindings: minimal documentation for MVEBU SDRAM =
controller
>    gpio: mvebu: add suspend/resume support
>    bus: mvebu-mbus: provide a mechanism to save SDRAM window configur=
ation
>=20
>  - Added Acked-by from Gr=E9gory Clement on
>=20
>    ARM: mvebu: enable strex backoff delay
>    ARM: mvebu: reserve the first 10 KB of each memory bank for suspen=
d/resume
>    ARM: mvebu: make sure MMU is disabled in armada_370_xp_cpu_resume
>    ARM: mvebu: synchronize secondary CPU clocks on resume
>    ARM: mvebu: add suspend/resume DT information for Armada XP GP
>    ARM: mvebu: adjust mbus controller description on Armada 370/XP
>    ARM: mvebu: add SDRAM controller description for Armada XP
>    clk: mvebu: add suspend/resume for gatable clocks
>=20
>  - Add Acked-by from Alexandre Courbot on
>    gpio: mvebu: add suspend/resume support
>=20
>  - Drop patch "irqchip: irq-armada-370-xp: use proper return value fo=
r
>    ->set_affinity()" as it was applied by Jason Cooper.
>=20
>  - Fix typo in commit log of "clocksource: time-armada-370-xp: add
>    suspend/resume support", noticed by Gr=E9gory Clement.
>=20
>  - Adjust the name of the new variables used in "clocksource:
>    time-armada-370-xp: add suspend/resume support" to save the state
>    of timer 0, to make it clear only the state of timer 0 is
>    preserved. Suggested by Gr=E9gory Clement.
>=20
>  - In the suspend/resume code of the mvebu-mbus driver, make sure to
>    fail (and therefore abort the suspend) if the MBus bridge register=
s
>    were not mapped, instead of continuing with the suspend procedure
>    and later on have a system that we know cannot resume
>    properly. Suggested by Gr=E9gory Clement.
>=20
>  - Remove cpu_pm_cluster_{enter,exit} calls from
>    mach-mvebu/pm.c. Suggested by Gr=E9gory Clement.
>=20
>  - In patch "ARM: mvebu: Armada XP GP specific suspend/resume code",
>    fixup the wait loop of 100 cycles before entering suspend to
>    actually initialize the r1 register before entering the wait
>    loop. Before that, r1 was uninitialized, and a JTAG has shown that
>    it was generally defined to 0, so the loop started by decrementing
>    it by 1, making r1 equal 0xFFFFFFFF. So we had 2^32 iterations of =
a
>    two instructions loop, at 1.2 Ghz, about a 7 seconds
>    delay. Switching to the 100 cycles loop that is needed showed that
>    the previous mdelay of 250 ms was way too short: the PIC needs
>    several seconds before the two GPIO toggles. The Marvell vendor
>    kernel uses a bit more than 3 seconds delay, and experience has
>    shown that a 3 seconds delay works fine, while shorter delays
>    sometimes lead to a system that doesn't enter suspend. Noticed by
>    Gr=E9gory Clement.
>=20
> Best regards,
>=20
> Thomas
>=20
> Nadav Haklai (1):
>   ARM: mvebu: enable strex backoff delay
>=20
> Thomas Petazzoni (15):
>   Documentation: dt-bindings: minimal documentation for MVEBU SDRAM
>     controller
>   irqchip: irq-armada-370-xp: suspend/resume support
>   clocksource: time-armada-370-xp: add suspend/resume support
>   gpio: mvebu: add suspend/resume support
>   bus: mvebu-mbus: suspend/resume support
>   bus: mvebu-mbus: provide a mechanism to save SDRAM window
>     configuration
>   clk: mvebu: add suspend/resume for gatable clocks
>   ARM: mvebu: implement suspend/resume support for Armada XP
>   ARM: mvebu: reserve the first 10 KB of each memory bank for
>     suspend/resume
>   ARM: mvebu: Armada XP GP specific suspend/resume code
>   ARM: mvebu: make sure MMU is disabled in armada_370_xp_cpu_resume
>   ARM: mvebu: synchronize secondary CPU clocks on resume
>   ARM: mvebu: add suspend/resume DT information for Armada XP GP
>   ARM: mvebu: adjust mbus controller description on Armada 370/XP
>   ARM: mvebu: add SDRAM controller description for Armada XP
>=20
>  .../devicetree/bindings/bus/mvebu-mbus.txt         |  17 +-
>  .../memory-controllers/mvebu-sdram-controller.txt  |  21 ++
>  arch/arm/boot/dts/armada-370-xp.dtsi               |   3 +-
>  arch/arm/boot/dts/armada-xp-gp.dts                 |  19 +-
>  arch/arm/boot/dts/armada-xp.dtsi                   |   5 +
>  arch/arm/mach-mvebu/Makefile                       |   2 +-
>  arch/arm/mach-mvebu/board-v7.c                     |  51 +++++
>  arch/arm/mach-mvebu/common.h                       |   2 +
>  arch/arm/mach-mvebu/platsmp.c                      |  31 ++-
>  arch/arm/mach-mvebu/pm-board.c                     | 141 +++++++++++=
++
>  arch/arm/mach-mvebu/pm.c                           | 218 +++++++++++=
++++++++++
>  arch/arm/mach-mvebu/pmsu.h                         |   1 +
>  arch/arm/mach-mvebu/pmsu_ll.S                      |   8 +
>  arch/arm/mm/proc-v7.S                              |   2 -
>  drivers/bus/mvebu-mbus.c                           | 180 +++++++++++=
+++++-
>  drivers/clk/mvebu/common.c                         |  32 ++-
>  drivers/clocksource/time-armada-370-xp.c           |  25 +++
>  drivers/gpio/gpio-mvebu.c                          |  99 ++++++++++
>  drivers/irqchip/irq-armada-370-xp.c                |  52 +++++
>  include/linux/mbus.h                               |   1 +
>  20 files changed, 876 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controll=
ers/mvebu-sdram-controller.txt
>  create mode 100644 arch/arm/mach-mvebu/pm-board.c
>  create mode 100644 arch/arm/mach-mvebu/pm.c
>=20
> --=20
> 2.1.0
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
