From: =?utf-8?Q?Ond=C5=99ej?= Jirman <doudahwezomiechahtah@xff.cz>
Subject: Re: [PATCH v9 00/12] Sunxi: Add SMP support on A83T
Date: Tue, 26 Jun 2018 13:53:35 +0200
Message-ID: <20180626115335.cou6o22lks2stign@core>
References: <20180504190545.5114-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180504190545.5114-1-mylene.josserand@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, opendmb@gmail.com, quentin.schulz@bootlin.com, horms@verge.net.au, maxime.ripard@bootlin.com, magnus.damm@gmail.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, marc.zyngier@arm.com, wens@csie.org, robh+dt@kernel.org, geert@linux-m68k.org, thomas.petazzoni@bootlin.com, clabbe.montjoie@gmail.com, f.fainelli@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Myl=E8ne,

On Fri, May 04, 2018 at 09:05:33PM +0200, Myl=E8ne Josserand wrote:
> Hello everyone,
> =

> This is a V9 of my series that adds SMP support for Allwinner sun8i-a83t.
> Based on sunxi's tree, sunxi/for-next branch.
> Depends on a patch from Doug Berger that allows to include the "cpu-type"
> header on assembly files that I included in my series (patch 01).

I've tested your patches and the kernel always locks up when disabling the =
first
CPU in the second cluster. I can enable/disable other CPUs in the second cl=
uster
though.

Other thing I observed was, that when disabling cores no power is saved (not
even a tiny bit), which is slightly surprising.

>From the standpoint of the DT, A83T CPU config seems to lack some cpu
properties, which makes it not claim a cluster clock when I enable any other
CPU than the first CPU in the cluster.

The same goes for cpu-supply regulator. When I dump the state of regulators
after booting with maxcpus=3D1 and enabling cpu5, the regulator on the seco=
nd
cluster is not claimed, but when I add cpu-supply property on all cpu# node=
s,
I get (when enabling CPU5):

[  200.072895] CPU5: update cpu_capacity 1024
[  200.072914] CPU5: thread -1, cpu 1, socket 1, mpidr 80000101
[  200.151403] cpu cpu5: opp_list_debug_create_link: Failed to create link
[  200.151411] cpu cpu5: _add_opp_dev: Failed to register opp debugfs (-12)

I'm not having much luck with this. Do you have some suggestions, please?
I'll probably figure out the last issue with the regulators, but I'm at the
loss about the lockup on CPU4 disable.

thaks and regards,
  Ondrej Jirman

> The difference with the v8 is just that the machine is renamed in sun8i-a=
83t
> (see patch 07), according to Maxime's review.
> =

> Thank you in advance,
> Best regards,
> Myl=E8ne
> =

> Changes from v8:
>     - Rename machine into "sun8i-a83t"
> =

> Changes from v7:
>     - Add the patch of Doug Berger in my series.
>     - Rename the machine name to start secure_cntvoff into "sun8i-a83t",
>     according to Maxime's review.
>     - Change the type of is_a83t field from integer into boolean.
> =

> Changes from v6:
>     - Correct the commit log on patch 07 according to Sergei Shtylyov's
>     review.
>     - Rename the field "is_sun8i" into "is_a83t".
>     - Add all Tested-by and Reviewed-by from previous version.
> =

> Changes from v5:
>     - Remove my patch 01 and use the patch of Doug Berger to be able to
>     include the cpu-type header on assembly files.
>     - Rename smp_init_cntvoff function into secure_cntvoff_init according
>     to Marc Zyngier's review.
>     - According to Chen-Yu and Maxime's reviews, remove the patch that was
>     moving structures. Instead of using an index to retrieve which
>     architecture we are having, use a global variable.
>     - Merge the 2 patches that move assembly code from C to assembly file.
>     - Use a sun8i field instead of sun9i to know on which architecture we
>     are using because many modifications/additions of the code are for
>     sun8i-a83t.
>     - Rework the patch "add is_sun8i field" to add only this field in this
>     patch. The part of the patch that was starting to handle the differen=
ces
>     between sun8i-a83t and sun9i-a80 is merged in the patch that adds the
>     support of sun8i-a83t.
>     - Add a new patch that refactor the shmobile code to use the new func=
tion
>     secure_cntvoff_init introduced in this series.
> =

> Changes from v4:
>     - Rebased my series according to new Chen-Yu series:
>        "ARM: sunxi: Clean and improvements for multi-cluster SMP"
>        https://lkml.org/lkml/2018/3/8/886
>     - Updated my series according to Marc Zyngier's reviews to add CNTVOFF
>     initialization's function into ARM's common part. Thanks to that, oth=
er
>     platforms such as Renesa can use this function.
>     - For boot CPU, create a new machine to handle the CNTVOFF initializa=
tion
>     using "init_early" callback.
> =

> Changes from v3:
>     - Take into account Maxime's reviews:
> 	- split the first patch into 4 new patches: add sun9i device tree
> 	parsing, rename some variables, add a83t support and finally,
> 	add hotplug support.
> 	- Move the code of previous patch 07 (to disable CPU0 disabling)
> 	into hotplug support patch (see patch 04)
> 	- Remove the patch that added PRCM register because it is already
> 	available. Because of that, update the device tree parsing to use
> 	"sun8i-a83t-r-ccu".
> 	- Use a variable to know which SoC we currently have
>     - Take into account Chen-Yu's reviews: create two iounmap functions
>     to release the resources of the device tree parsing.
>     - Take into account Marc's review: Update the code to initialize CNTV=
OFF
>     register. As there is already assembly code in the driver, I decided
>     to create an assembly file not to mix assembly and C code.
>     For that, I create 3 new patches: move the current assembly code that
>     handles the cluster cache enabling into a file, move the cpu_resume e=
ntry
>     in this file and finally, add a new assembly entry to initialize the =
timer
>     offset for boot CPU and secondary CPUs.
> =

> Changes from v2:
>     - Rebased my modifications according to new Chen Yu's patch series
>     that adds SMP support for sun9i-a80 (without MCPM).
>     - Split the device-tree patches into 3 patches for CPUCFG, R_CPUCFG
>     and PRCM registers for more visibility.
>     - The hotplug of CPU0 is currently not working (even after trying what
>     Allwinner's code is doing) so remove the possibility of disabling
>     this CPU. Created a new patch for it.
> =

> Changes from v1:
>     - Add Chen Yu's patch in my series (see path 01)
>     - Add new compatibles for prcm and cpucfg registers for sun8i-a83t.
>     Create two functions to separate the DT parsing of sun9i-a80 and
>     sun8i-a83t.
>     - Thanks to Maxime's review: order device tree's nodes according
>     to physical addresses, remove unused label and fix registers' sizes.
>     Update the commit log and commit title of my last patch (see
>     patch 05).
> =

> Doug Berger (1):
>   ARM: Allow this header to be included by assembly files
> =

> Myl=E8ne Josserand (11):
>   ARM: sunxi: smp: Move assembly code into a file
>   ARM: dts: sun8i: Add CPUCFG device node for A83T dtsi
>   ARM: dts: sun8i: Add R_CPUCFG device node for the A83T dtsi
>   ARM: dts: sun8i: a83t: Add CCI-400 node
>   ARM: smp: Add initialization of CNTVOFF
>   ARM: sunxi: Add initialization of CNTVOFF
>   ARM: sun9i: smp: Rename clusters's power-off
>   ARM: sun9i: smp: Add is_a83t field
>   ARM: sun8i: smp: Add support for A83T
>   ARM: dts: sun8i: Add enable-method for SMP support for the A83T SoC
>   ARM: shmobile: Convert file to use cntvoff
> =

>  arch/arm/boot/dts/sun8i-a83t.dtsi        |  59 ++++++++
>  arch/arm/common/Makefile                 |   1 +
>  arch/arm/common/secure_cntvoff.S         |  31 ++++
>  arch/arm/include/asm/cputype.h           |  10 +-
>  arch/arm/include/asm/secure_cntvoff.h    |   8 ++
>  arch/arm/mach-shmobile/common.h          |   1 -
>  arch/arm/mach-shmobile/headsmp-apmu.S    |  22 +--
>  arch/arm/mach-shmobile/setup-rcar-gen2.c |   3 +-
>  arch/arm/mach-sunxi/Kconfig              |   2 +-
>  arch/arm/mach-sunxi/Makefile             |   2 +-
>  arch/arm/mach-sunxi/headsmp.S            |  81 +++++++++++
>  arch/arm/mach-sunxi/mc_smp.c             | 239 +++++++++++++++++++------=
------
>  arch/arm/mach-sunxi/sunxi.c              |  20 ++-
>  13 files changed, 356 insertions(+), 123 deletions(-)
>  create mode 100644 arch/arm/common/secure_cntvoff.S
>  create mode 100644 arch/arm/include/asm/secure_cntvoff.h
>  create mode 100644 arch/arm/mach-sunxi/headsmp.S
> =

> -- =

> 2.11.0
> =

> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
