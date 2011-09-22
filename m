From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: DT vs ARM static mappings
Date: Thu, 22 Sep 2011 14:59:10 +0100
Message-ID: <20110922135910.GB8072@n2100.arm.linux.org.uk>
References: <1316519479.4611.150.camel@hornet.cambridge.arm.com>
 <alpine.LFD.2.00.1109211320090.12663@xanadu.home>
 <1316696696.4611.844.camel@hornet.cambridge.arm.com>
 <20110922131302.GO17169@n2100.arm.linux.org.uk>
 <1316699153.4611.858.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316699153.4611.858.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 22, 2011 at 02:45:53PM +0100, Pawel Moll wrote:
> > > Ok, what I did was grepping for all .map_io-s. Then I sorted the list
> > > and had a look at first 100 and about 50% of them were doing more than
> > > just creating mappings.
> > =

> > The answer to that is: they shouldn't be now that we have the init_early
> > hook.  The only remainder for .map_io is where platforms make run-time
> > decisions about what to map based on some register value somewhere
> > (eg, Assabet vs Assabet+Neponset).
> > =

> > I do have a large patch series floating around in my git tree which tri=
es
> > to clean up to all those map_io functions - the biggest stumbling block
> > to them is the Samsung stuff being indirected through its own tables.
> =

> Awesome. I'll work with an assumption that future map_io-s will only
> create static mappings and nothing more then.

That would be preferable, so people have some motivation to clean up after
themselves.  Here's how the patch looked quite a while ago - it probably
no longer applies to modern kernels without severely breaking them:

 arch/arm/include/asm/mach/arch.h              |    3 +--
 arch/arm/kernel/setup.c                       |    2 +-
 arch/arm/mach-bcmring/arch.c                  |    4 ++--
 arch/arm/mach-clps711x/clep7312.c             |    3 +--
 arch/arm/mach-clps711x/edb7211-arch.c         |    3 +--
 arch/arm/mach-clps711x/fortunet.c             |    3 +--
 arch/arm/mach-clps711x/p720t.c                |    3 +--
 arch/arm/mach-cns3xxx/cns3420vb.c             |    4 ++++
 arch/arm/mach-exynos4/cpu.c                   |    3 +++
 arch/arm/mach-exynos4/mach-smdkc210.c         |    6 ++++++
 arch/arm/mach-exynos4/mach-smdkv310.c         |    6 ++++++
 arch/arm/mach-exynos4/mach-universal_c210.c   |    5 +++++
 arch/arm/mach-footbridge/cats-hw.c            |    3 +--
 arch/arm/mach-footbridge/netwinder-hw.c       |    3 +--
 arch/arm/mach-ixp2000/core.c                  |    3 +++
 arch/arm/mach-ixp2000/enp2611.c               |    1 +
 arch/arm/mach-ixp2000/include/mach/platform.h |    1 +
 arch/arm/mach-ixp2000/ixdp2400.c              |    1 +
 arch/arm/mach-ixp2000/ixdp2800.c              |    1 +
 arch/arm/mach-ixp2000/ixdp2x01.c              |    3 +++
 arch/arm/mach-ks8695/board-acs5k.c            |    1 +
 arch/arm/mach-ks8695/board-dsm320.c           |    1 +
 arch/arm/mach-ks8695/board-micrel.c           |    1 +
 arch/arm/mach-ks8695/cpu.c                    |    3 +++
 arch/arm/mach-ks8695/generic.h                |    1 +
 arch/arm/mach-mmp/aspenite.c                  |    6 ++++--
 arch/arm/mach-mmp/avengers_lite.c             |    1 +
 arch/arm/mach-mmp/common.c                    |    3 +++
 arch/arm/mach-mmp/common.h                    |    1 +
 arch/arm/mach-mmp/flint.c                     |    3 ++-
 arch/arm/mach-mmp/jasper.c                    |    3 ++-
 arch/arm/mach-mmp/tavorevb.c                  |    1 +
 arch/arm/mach-mmp/teton_bga.c                 |    3 ++-
 arch/arm/mach-mmp/ttc_dkb.c                   |    3 ++-
 arch/arm/mach-msm/board-halibut.c             |   10 +++++-----
 arch/arm/mach-msm/board-mahimahi.c            |   10 +++++-----
 arch/arm/mach-msm/board-msm7x27.c             |   15 +++++++++------
 arch/arm/mach-msm/board-msm7x30.c             |   12 +++++++-----
 arch/arm/mach-msm/board-qsd8x50.c             |    9 +++++----
 arch/arm/mach-msm/board-sapphire.c            |    9 +++++++--
 arch/arm/mach-msm/board-trout.c               |    8 ++++++--
 arch/arm/mach-nuc93x/mach-nuc932evb.c         |    6 +++---
 arch/arm/mach-orion5x/common.c                |    4 ++--
 arch/arm/mach-orion5x/common.h                |    4 +---
 arch/arm/mach-pxa/cm-x2xx.c                   |    7 ++++++-
 arch/arm/mach-pxa/cm-x300.c                   |    4 ++--
 arch/arm/mach-pxa/corgi.c                     |    4 ++--
 arch/arm/mach-pxa/eseries.c                   |    3 +--
 arch/arm/mach-pxa/eseries.h                   |    3 +--
 arch/arm/mach-pxa/lpd270.c                    |    6 +++++-
 arch/arm/mach-pxa/lubbock.c                   |    6 +++++-
 arch/arm/mach-pxa/mainstone.c                 |    6 +++++-
 arch/arm/mach-pxa/pcm027.c                    |    7 +++----
 arch/arm/mach-pxa/poodle.c                    |    4 ++--
 arch/arm/mach-pxa/spitz.c                     |    4 ++--
 arch/arm/mach-pxa/tosa.c                      |    4 ++--
 arch/arm/mach-pxa/trizeps4.c                  |    9 +++++++--
 arch/arm/mach-pxa/viper.c                     |    5 ++++-
 arch/arm/mach-pxa/zeus.c                      |    7 +++++--
 arch/arm/mach-realview/core.c                 |    3 +--
 arch/arm/mach-realview/core.h                 |    4 ++--
 arch/arm/mach-realview/realview_pb1176.c      |    3 +--
 arch/arm/mach-realview/realview_pbx.c         |    6 +++---
 arch/arm/mach-rpc/riscpc.c                    |    4 ++++
 arch/arm/mach-s3c2410/mach-amlm5900.c         |    6 ++++++
 arch/arm/mach-s3c2410/mach-bast.c             |    8 +++++++-
 arch/arm/mach-s3c2410/mach-h1940.c            |    8 +++++++-
 arch/arm/mach-s3c2410/mach-n30.c              |   15 +++++++++++----
 arch/arm/mach-s3c2410/mach-otom.c             |    6 ++++++
 arch/arm/mach-s3c2410/mach-qt2410.c           |    6 ++++++
 arch/arm/mach-s3c2410/mach-smdk2410.c         |    6 ++++++
 arch/arm/mach-s3c2410/mach-tct_hammer.c       |    6 ++++++
 arch/arm/mach-s3c2410/mach-vr1000.c           |    8 +++++++-
 arch/arm/mach-s3c2410/s3c2410.c               |    7 +++++--
 arch/arm/mach-s3c2412/mach-jive.c             |    8 +++++++-
 arch/arm/mach-s3c2412/mach-smdk2413.c         |   17 ++++++++++++-----
 arch/arm/mach-s3c2412/mach-vstms.c            |   13 +++++++++----
 arch/arm/mach-s3c2412/s3c2412.c               |   11 +++++++----
 arch/arm/mach-s3c2416/mach-smdk2416.c         |    8 +++++++-
 arch/arm/mach-s3c2416/s3c2416.c               |    7 +++++--
 arch/arm/mach-s3c2440/mach-anubis.c           |    8 +++++++-
 arch/arm/mach-s3c2440/mach-at2440evb.c        |    6 ++++++
 arch/arm/mach-s3c2440/mach-gta02.c            |    6 ++++++
 arch/arm/mach-s3c2440/mach-mini2440.c         |    8 +++++++-
 arch/arm/mach-s3c2440/mach-nexcoder.c         |    6 ++++++
 arch/arm/mach-s3c2440/mach-osiris.c           |    8 +++++++-
 arch/arm/mach-s3c2440/mach-rx1950.c           |   10 ++++++++--
 arch/arm/mach-s3c2440/mach-rx3715.c           |    8 +++++++-
 arch/arm/mach-s3c2440/mach-smdk2440.c         |    8 +++++++-
 arch/arm/mach-s3c2440/s3c244x.c               |    3 +++
 arch/arm/mach-s3c2443/mach-smdk2443.c         |    8 +++++++-
 arch/arm/mach-s3c64xx/cpu.c                   |    4 ++--
 arch/arm/mach-s3c64xx/include/mach/s3c6400.h  |    4 ++--
 arch/arm/mach-s3c64xx/include/mach/s3c6410.h  |    4 ++--
 arch/arm/mach-s3c64xx/mach-anw6410.c          |    8 +++++++-
 arch/arm/mach-s3c64xx/mach-hmt.c              |    8 +++++++-
 arch/arm/mach-s3c64xx/mach-mini6410.c         |   10 ++++++++--
 arch/arm/mach-s3c64xx/mach-ncp.c              |    8 +++++++-
 arch/arm/mach-s3c64xx/mach-real6410.c         |   10 ++++++++--
 arch/arm/mach-s3c64xx/mach-smartq.c           |    5 +++++
 arch/arm/mach-s3c64xx/mach-smartq.h           |    1 +
 arch/arm/mach-s3c64xx/mach-smartq5.c          |    3 ++-
 arch/arm/mach-s3c64xx/mach-smartq7.c          |    3 ++-
 arch/arm/mach-s3c64xx/mach-smdk6400.c         |    8 +++++++-
 arch/arm/mach-s3c64xx/mach-smdk6410.c         |   10 ++++++++--
 arch/arm/mach-s3c64xx/s3c6400.c               |    2 +-
 arch/arm/mach-s3c64xx/s3c6410.c               |    2 +-
 arch/arm/mach-s5p64x0/cpu.c                   |   14 ++++++++++----
 arch/arm/mach-s5p64x0/mach-smdk6440.c         |    8 +++++++-
 arch/arm/mach-s5p64x0/mach-smdk6450.c         |    8 +++++++-
 arch/arm/mach-s5pc100/cpu.c                   |    3 +++
 arch/arm/mach-s5pc100/mach-smdkc100.c         |    8 +++++++-
 arch/arm/mach-s5pv210/cpu.c                   |    3 +++
 arch/arm/mach-s5pv210/mach-aquila.c           |    8 +++++++-
 arch/arm/mach-s5pv210/mach-goni.c             |    8 +++++++-
 arch/arm/mach-s5pv210/mach-smdkc110.c         |    8 +++++++-
 arch/arm/mach-s5pv210/mach-smdkv210.c         |    8 +++++++-
 arch/arm/mach-s5pv210/mach-torbreck.c         |    8 +++++++-
 arch/arm/mach-sa1100/assabet.c                |    7 +++++--
 arch/arm/mach-sa1100/badge4.c                 |    4 ++++
 arch/arm/mach-sa1100/cerf.c                   |    4 ++++
 arch/arm/mach-sa1100/collie.c                 |    4 ++++
 arch/arm/mach-sa1100/h3100.c                  |    7 ++++---
 arch/arm/mach-sa1100/h3600.c                  |    8 ++++----
 arch/arm/mach-sa1100/h3xxx.c                  |    3 +++
 arch/arm/mach-sa1100/hackkit.c                |    6 ++++--
 arch/arm/mach-sa1100/include/mach/h3xxx.h     |    1 +
 arch/arm/mach-sa1100/jornada720.c             |    4 ++++
 arch/arm/mach-sa1100/lart.c                   |    4 ++++
 arch/arm/mach-sa1100/pleb.c                   |    7 +++----
 arch/arm/mach-sa1100/shannon.c                |    7 +++----
 arch/arm/mach-sa1100/simpad.c                 |    4 ++++
 arch/arm/mach-shmobile/board-ap4evb.c         |    4 ++++
 arch/arm/mach-shmobile/board-g3evm.c          |    4 ++++
 arch/arm/mach-shmobile/board-g4evm.c          |    4 ++++
 arch/arm/mach-spear3xx/include/mach/generic.h |    1 +
 arch/arm/mach-spear3xx/spear300_evb.c         |    1 +
 arch/arm/mach-spear3xx/spear310_evb.c         |    1 +
 arch/arm/mach-spear3xx/spear320_evb.c         |    1 +
 arch/arm/mach-spear3xx/spear3xx.c             |    3 +++
 arch/arm/mach-spear6xx/include/mach/generic.h |    1 +
 arch/arm/mach-spear6xx/spear600_evb.c         |    1 +
 arch/arm/mach-spear6xx/spear6xx.c             |    3 +++
 arch/arm/mach-tegra/board-harmony.c           |    4 ++--
 arch/arm/mach-w90x900/mach-nuc910evb.c        |    9 ++-------
 arch/arm/mach-w90x900/mach-nuc950evb.c        |    9 ++-------
 arch/arm/mach-w90x900/mach-nuc960evb.c        |    9 ++-------
 arch/arm/plat-s3c24xx/cpu.c                   |    9 +++++++++
 arch/arm/plat-s3c24xx/include/plat/s3c2410.h  |    3 ++-
 arch/arm/plat-s3c24xx/include/plat/s3c2412.h  |    3 ++-
 arch/arm/plat-s3c24xx/include/plat/s3c2416.h  |    3 ++-
 arch/arm/plat-s3c24xx/include/plat/s3c244x.h  |    3 ++-
 arch/arm/plat-s5p/cpu.c                       |    5 +++++
 arch/arm/plat-s5p/include/plat/exynos4.h      |    2 ++
 arch/arm/plat-s5p/include/plat/s5p6440.h      |    2 ++
 arch/arm/plat-s5p/include/plat/s5p6450.h      |    2 ++
 arch/arm/plat-s5p/include/plat/s5pc100.h      |    2 ++
 arch/arm/plat-s5p/include/plat/s5pv210.h      |    2 ++
 arch/arm/plat-samsung/include/plat/cpu.h      |    2 ++
 arch/arm/plat-samsung/init.c                  |    9 ++++++++-
 160 files changed, 634 insertions(+), 209 deletions(-)

diff --git a/arch/arm/include/asm/mach/arch.h b/arch/arm/include/asm/mach/a=
rch.h
index 946f4d7..da93a84 100644
--- a/arch/arm/include/asm/mach/arch.h
+++ b/arch/arm/include/asm/mach/arch.h
@@ -30,8 +30,7 @@ struct machine_desc {
 	unsigned int		reserve_lp1 :1;	/* never has lp1	*/
 	unsigned int		reserve_lp2 :1;	/* never has lp2	*/
 	unsigned int		soft_reboot :1;	/* soft reboot		*/
-	void			(*fixup)(struct machine_desc *,
-					 struct tag *, char **,
+	void			(*fixup)(struct tag *, char **,
 					 struct meminfo *);
 	void			(*reserve)(void);/* reserve mem blocks	*/
 	void			(*map_io)(void);/* IO mapping function	*/
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index ed11fb0..df75ea7 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -857,7 +857,7 @@ static struct machine_desc * __init setup_machine_tags(=
unsigned int nr)
 	}
 =

 	if (mdesc->fixup)
-		mdesc->fixup(mdesc, tags, &from, &meminfo);
+		mdesc->fixup(tags, &from, &meminfo);
 =

 	if (tags->hdr.tag =3D=3D ATAG_CORE) {
 		if (meminfo.nr_banks !=3D 0)
diff --git a/arch/arm/mach-bcmring/arch.c b/arch/arm/mach-bcmring/arch.c
index a604b9e..31a1435 100644
--- a/arch/arm/mach-bcmring/arch.c
+++ b/arch/arm/mach-bcmring/arch.c
@@ -136,8 +136,8 @@ static void __init bcmring_init_machine(void)
 *
 **************************************************************************=
***/
 =

-static void __init bcmring_fixup(struct machine_desc *desc,
-     struct tag *t, char **cmdline, struct meminfo *mi) {
+static void __init bcmring_fixup(struct tag *t, char **cmdline,
+	struct meminfo *mi) {
 #ifdef CONFIG_BLK_DEV_INITRD
 	printk(KERN_NOTICE "bcmring_fixup\n");
 	t->hdr.tag =3D ATAG_CORE;
diff --git a/arch/arm/mach-clps711x/clep7312.c b/arch/arm/mach-clps711x/cle=
p7312.c
index 67b5abb4..0a2e74f 100644
--- a/arch/arm/mach-clps711x/clep7312.c
+++ b/arch/arm/mach-clps711x/clep7312.c
@@ -26,8 +26,7 @@
 #include "common.h"
 =

 static void __init
-fixup_clep7312(struct machine_desc *desc, struct tag *tags,
-	    char **cmdline, struct meminfo *mi)
+fixup_clep7312(struct tag *tags, char **cmdline, struct meminfo *mi)
 {
 	mi->nr_banks=3D1;
 	mi->bank[0].start =3D 0xc0000000;
diff --git a/arch/arm/mach-clps711x/edb7211-arch.c b/arch/arm/mach-clps711x=
/edb7211-arch.c
index 98ca5b2..725a7a5 100644
--- a/arch/arm/mach-clps711x/edb7211-arch.c
+++ b/arch/arm/mach-clps711x/edb7211-arch.c
@@ -37,8 +37,7 @@ static void __init edb7211_reserve(void)
 }
 =

 static void __init
-fixup_edb7211(struct machine_desc *desc, struct tag *tags,
-	      char **cmdline, struct meminfo *mi)
+fixup_edb7211(struct tag *tags, char **cmdline, struct meminfo *mi)
 {
 	/*
 	 * Bank start addresses are not present in the information
diff --git a/arch/arm/mach-clps711x/fortunet.c b/arch/arm/mach-clps711x/for=
tunet.c
index b1cb479..1947b30 100644
--- a/arch/arm/mach-clps711x/fortunet.c
+++ b/arch/arm/mach-clps711x/fortunet.c
@@ -57,8 +57,7 @@ typedef struct tag_IMAGE_PARAMS
 #define IMAGE_PARAMS_PHYS	0xC01F0000
 =

 static void __init
-fortunet_fixup(struct machine_desc *desc, struct tag *tags,
-		 char **cmdline, struct meminfo *mi)
+fortunet_fixup(struct tag *tags, char **cmdline, struct meminfo *mi)
 {
 	IMAGE_PARAMS *ip =3D phys_to_virt(IMAGE_PARAMS_PHYS);
 	*cmdline =3D phys_to_virt(ip->command_line);
diff --git a/arch/arm/mach-clps711x/p720t.c b/arch/arm/mach-clps711x/p720t.c
index cefbce0..3f796e0 100644
--- a/arch/arm/mach-clps711x/p720t.c
+++ b/arch/arm/mach-clps711x/p720t.c
@@ -56,8 +56,7 @@ static struct map_desc p720t_io_desc[] __initdata =3D {
 };
 =

 static void __init
-fixup_p720t(struct machine_desc *desc, struct tag *tag,
-	    char **cmdline, struct meminfo *mi)
+fixup_p720t(struct tag *tag, char **cmdline, struct meminfo *mi)
 {
 	/*
 	 * Our bootloader doesn't setup any tags (yet).
diff --git a/arch/arm/mach-cns3xxx/cns3420vb.c b/arch/arm/mach-cns3xxx/cns3=
420vb.c
index 08e5c87..a3b8bd8 100644
--- a/arch/arm/mach-cns3xxx/cns3420vb.c
+++ b/arch/arm/mach-cns3xxx/cns3420vb.c
@@ -191,13 +191,17 @@ static void __init cns3420_map_io(void)
 {
 	cns3xxx_map_io();
 	iotable_init(cns3420_io_desc, ARRAY_SIZE(cns3420_io_desc));
+}
 =

+static void __init cns3420_init_early(void)
+{
 	cns3420_early_serial_setup();
 }
 =

 MACHINE_START(CNS3420VB, "Cavium Networks CNS3420 Validation Board")
 	.boot_params	=3D 0x00000100,
 	.map_io		=3D cns3420_map_io,
+	.init_early	=3D cns3420_init_early,
 	.init_irq	=3D cns3xxx_init_irq,
 	.timer		=3D &cns3xxx_timer,
 	.init_machine	=3D cns3420_init,
diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
index 08813a6..50cfd0c 100644
--- a/arch/arm/mach-exynos4/cpu.c
+++ b/arch/arm/mach-exynos4/cpu.c
@@ -121,7 +121,10 @@ static void exynos4_idle(void)
 void __init exynos4_map_io(void)
 {
 	iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
+}
 =

+void __init exynos4_init_early(void)
+{
 	/* initialize device information early */
 	exynos4_default_sdhci0();
 	exynos4_default_sdhci1();
diff --git a/arch/arm/mach-exynos4/mach-smdkc210.c b/arch/arm/mach-exynos4/=
mach-smdkc210.c
index e645f7a..f6793c5 100644
--- a/arch/arm/mach-exynos4/mach-smdkc210.c
+++ b/arch/arm/mach-exynos4/mach-smdkc210.c
@@ -194,6 +194,11 @@ static void __init smdkc210_smsc911x_init(void)
 static void __init smdkc210_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+}
+
+static void __init smdkc210_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(smdkc210_uartcfgs, ARRAY_SIZE(smdkc210_uartcfgs));
 }
@@ -216,6 +221,7 @@ static void __init smdkc210_machine_init(void)
 MACHINE_START(SMDKC210, "SMDKC210")
 	/* Maintainer: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	.boot_params	=3D S5P_PA_SDRAM + 0x100,
+	.init_early	=3D exynos4_init_early,
 	.init_irq	=3D exynos4_init_irq,
 	.map_io		=3D smdkc210_map_io,
 	.init_machine	=3D smdkc210_machine_init,
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/=
mach-smdkv310.c
index 1526764..4e086dc 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -216,6 +216,11 @@ static void __init smdkv310_smsc911x_init(void)
 static void __init smdkv310_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+}
+
+static void __init smdkv310_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(smdkv310_uartcfgs, ARRAY_SIZE(smdkv310_uartcfgs));
 }
@@ -241,6 +246,7 @@ MACHINE_START(SMDKV310, "SMDKV310")
 	/* Maintainer: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	/* Maintainer: Changhwan Youn <chaos.youn-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	.boot_params	=3D S5P_PA_SDRAM + 0x100,
+	.init_early	=3D exynos4_init_early,
 	.init_irq	=3D exynos4_init_irq,
 	.map_io		=3D smdkv310_map_io,
 	.init_machine	=3D smdkv310_machine_init,
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-ex=
ynos4/mach-universal_c210.c
index 97d329f..9683d7e 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -622,6 +622,10 @@ static struct platform_device *universal_devices[] __i=
nitdata =3D {
 static void __init universal_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+}
+
+static void __init universal_init_early(void)
+{
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(universal_uartcfgs, ARRAY_SIZE(universal_uartcfgs));
 }
@@ -643,6 +647,7 @@ static void __init universal_machine_init(void)
 MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
 	/* Maintainer: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	.boot_params	=3D S5P_PA_SDRAM + 0x100,
+	.init_early	=3D universal_init_early,
 	.init_irq	=3D exynos4_init_irq,
 	.map_io		=3D universal_map_io,
 	.init_machine	=3D universal_machine_init,
diff --git a/arch/arm/mach-footbridge/cats-hw.c b/arch/arm/mach-footbridge/=
cats-hw.c
index 5b1a8db..206ff2f 100644
--- a/arch/arm/mach-footbridge/cats-hw.c
+++ b/arch/arm/mach-footbridge/cats-hw.c
@@ -76,8 +76,7 @@ __initcall(cats_hw_init);
  * hard reboots fail on early boards.
  */
 static void __init
-fixup_cats(struct machine_desc *desc, struct tag *tags,
-	   char **cmdline, struct meminfo *mi)
+fixup_cats(struct tag *tags, char **cmdline, struct meminfo *mi)
 {
 	screen_info.orig_video_lines  =3D 25;
 	screen_info.orig_video_points =3D 16;
diff --git a/arch/arm/mach-footbridge/netwinder-hw.c b/arch/arm/mach-footbr=
idge/netwinder-hw.c
index 06e514f..4cbc2e6 100644
--- a/arch/arm/mach-footbridge/netwinder-hw.c
+++ b/arch/arm/mach-footbridge/netwinder-hw.c
@@ -631,8 +631,7 @@ __initcall(nw_hw_init);
  * the parameter page.
  */
 static void __init
-fixup_netwinder(struct machine_desc *desc, struct tag *tags,
-		char **cmdline, struct meminfo *mi)
+fixup_netwinder(struct tag *tags, char **cmdline, struct meminfo *mi)
 {
 #ifdef CONFIG_ISAPNP
 	extern int isapnp_disable;
diff --git a/arch/arm/mach-ixp2000/core.c b/arch/arm/mach-ixp2000/core.c
index 4068166..e071849 100644
--- a/arch/arm/mach-ixp2000/core.c
+++ b/arch/arm/mach-ixp2000/core.c
@@ -136,7 +136,10 @@ static struct map_desc ixp2000_io_desc[] __initdata =
=3D {
 void __init ixp2000_map_io(void)
 {
 	iotable_init(ixp2000_io_desc, ARRAY_SIZE(ixp2000_io_desc));
+}
 =

+void __init ixp2000_init_early(void)
+{
 	/* Set slowport to 8-bit mode.  */
 	ixp2000_reg_wrb(IXP2000_SLOWPORT_FRM, 1);
 }
diff --git a/arch/arm/mach-ixp2000/enp2611.c b/arch/arm/mach-ixp2000/enp261=
1.c
index 88663ab..ad14d15 100644
--- a/arch/arm/mach-ixp2000/enp2611.c
+++ b/arch/arm/mach-ixp2000/enp2611.c
@@ -255,6 +255,7 @@ MACHINE_START(ENP2611, "Radisys ENP-2611 PCI network pr=
ocessor board")
 	/* Maintainer: Lennert Buytenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org> */
 	.boot_params	=3D 0x00000100,
 	.map_io		=3D enp2611_map_io,
+	.init_early	=3D ixp2000_init_early,
 	.init_irq	=3D ixp2000_init_irq,
 	.timer		=3D &enp2611_timer,
 	.init_machine	=3D enp2611_init_machine,
diff --git a/arch/arm/mach-ixp2000/include/mach/platform.h b/arch/arm/mach-=
ixp2000/include/mach/platform.h
index 42182c79..e17b84f 100644
--- a/arch/arm/mach-ixp2000/include/mach/platform.h
+++ b/arch/arm/mach-ixp2000/include/mach/platform.h
@@ -120,6 +120,7 @@ static inline unsigned int ixp2000_is_pcimaster(void)
 =

 void ixp2000_map_io(void);
 void ixp2000_uart_init(void);
+void ixp2000_init_early(void);
 void ixp2000_init_irq(void);
 void ixp2000_init_time(unsigned long);
 unsigned long ixp2000_gettimeoffset(void);
diff --git a/arch/arm/mach-ixp2000/ixdp2400.c b/arch/arm/mach-ixp2000/ixdp2=
400.c
index dfffc1e..ea65f49 100644
--- a/arch/arm/mach-ixp2000/ixdp2400.c
+++ b/arch/arm/mach-ixp2000/ixdp2400.c
@@ -172,6 +172,7 @@ MACHINE_START(IXDP2400, "Intel IXDP2400 Development Pla=
tform")
 	/* Maintainer: MontaVista Software, Inc. */
 	.boot_params	=3D 0x00000100,
 	.map_io		=3D ixdp2x00_map_io,
+	.init_early	=3D ixp2000_init_early,
 	.init_irq	=3D ixdp2400_init_irq,
 	.timer		=3D &ixdp2400_timer,
 	.init_machine	=3D ixdp2x00_init_machine,
diff --git a/arch/arm/mach-ixp2000/ixdp2800.c b/arch/arm/mach-ixp2000/ixdp2=
800.c
index cd4c9bc..f9d8f8a 100644
--- a/arch/arm/mach-ixp2000/ixdp2800.c
+++ b/arch/arm/mach-ixp2000/ixdp2800.c
@@ -287,6 +287,7 @@ MACHINE_START(IXDP2800, "Intel IXDP2800 Development Pla=
tform")
 	/* Maintainer: MontaVista Software, Inc. */
 	.boot_params	=3D 0x00000100,
 	.map_io		=3D ixdp2x00_map_io,
+	.init_early	=3D ixp2000_init_early,
 	.init_irq	=3D ixdp2800_init_irq,
 	.timer		=3D &ixdp2800_timer,
 	.init_machine	=3D ixdp2x00_init_machine,
diff --git a/arch/arm/mach-ixp2000/ixdp2x01.c b/arch/arm/mach-ixp2000/ixdp2=
x01.c
index 84835b2..f1627af 100644
--- a/arch/arm/mach-ixp2000/ixdp2x01.c
+++ b/arch/arm/mach-ixp2000/ixdp2x01.c
@@ -418,6 +418,7 @@ MACHINE_START(IXDP2401, "Intel IXDP2401 Development Pla=
tform")
 	/* Maintainer: MontaVista Software, Inc. */
 	.boot_params	=3D 0x00000100,
 	.map_io		=3D ixdp2x01_map_io,
+	.init_early	=3D ixp2000_init_early,
 	.init_irq	=3D ixdp2x01_init_irq,
 	.timer		=3D &ixdp2x01_timer,
 	.init_machine	=3D ixdp2x01_init_machine,
@@ -429,6 +430,7 @@ MACHINE_START(IXDP2801, "Intel IXDP2801 Development Pla=
tform")
 	/* Maintainer: MontaVista Software, Inc. */
 	.boot_params	=3D 0x00000100,
 	.map_io		=3D ixdp2x01_map_io,
+	.init_early	=3D ixp2000_init_early,
 	.init_irq	=3D ixdp2x01_init_irq,
 	.timer		=3D &ixdp2x01_timer,
 	.init_machine	=3D ixdp2x01_init_machine,
@@ -442,6 +444,7 @@ MACHINE_START(IXDP28X5, "Intel IXDP2805/2855 Developmen=
t Platform")
 	/* Maintainer: MontaVista Software, Inc. */
 	.boot_params	=3D 0x00000100,
 	.map_io		=3D ixdp2x01_map_io,
+	.init_early	=3D ixp2000_init_early,
 	.init_irq	=3D ixdp2x01_init_irq,
 	.timer		=3D &ixdp2x01_timer,
 	.init_machine	=3D ixdp2x01_init_machine,
diff --git a/arch/arm/mach-ks8695/board-acs5k.c b/arch/arm/mach-ks8695/boar=
d-acs5k.c
index 3ca4f8e..447689d 100644
--- a/arch/arm/mach-ks8695/board-acs5k.c
+++ b/arch/arm/mach-ks8695/board-acs5k.c
@@ -225,6 +225,7 @@ MACHINE_START(ACS5K, "Brivo Systems LLC ACS-5000 Master=
 board")
 	/* Maintainer: Simtec Electronics. */
 	.boot_params	=3D KS8695_SDRAM_PA + 0x100,
 	.map_io		=3D ks8695_map_io,
+	.init_early	=3D ks8695_init_early,
 	.init_irq	=3D ks8695_init_irq,
 	.init_machine	=3D acs5k_init,
 	.timer		=3D &ks8695_timer,
diff --git a/arch/arm/mach-ks8695/board-dsm320.c b/arch/arm/mach-ks8695/boa=
rd-dsm320.c
index ada92b6..fbc869f 100644
--- a/arch/arm/mach-ks8695/board-dsm320.c
+++ b/arch/arm/mach-ks8695/board-dsm320.c
@@ -123,6 +123,7 @@ MACHINE_START(DSM320, "D-Link DSM-320 Wireless Media Pl=
ayer")
 	/* Maintainer: Simtec Electronics. */
 	.boot_params	=3D KS8695_SDRAM_PA + 0x100,
 	.map_io		=3D ks8695_map_io,
+	.init_early	=3D ks8695_init_early,
 	.init_irq	=3D ks8695_init_irq,
 	.init_machine	=3D dsm320_init,
 	.timer		=3D &ks8695_timer,
diff --git a/arch/arm/mach-ks8695/board-micrel.c b/arch/arm/mach-ks8695/boa=
rd-micrel.c
index c7ad09b..3b8c6c4 100644
--- a/arch/arm/mach-ks8695/board-micrel.c
+++ b/arch/arm/mach-ks8695/board-micrel.c
@@ -55,6 +55,7 @@ MACHINE_START(KS8695, "KS8695 Centaur Development Board")
 	/* Maintainer: Micrel Semiconductor Inc. */
 	.boot_params	=3D KS8695_SDRAM_PA + 0x100,
 	.map_io		=3D ks8695_map_io,
+	.init_early	=3D ks8695_init_early,
 	.init_irq	=3D ks8695_init_irq,
 	.init_machine	=3D micrel_init,
 	.timer		=3D &ks8695_timer,
diff --git a/arch/arm/mach-ks8695/cpu.c b/arch/arm/mach-ks8695/cpu.c
index 7f3f240..a30ff0f 100644
--- a/arch/arm/mach-ks8695/cpu.c
+++ b/arch/arm/mach-ks8695/cpu.c
@@ -67,7 +67,10 @@ static void __init ks8695_clock_info(void)
 void __init ks8695_map_io(void)
 {
 	iotable_init(ks8695_io_desc, ARRAY_SIZE(ks8695_io_desc));
+}
 =

+void __init ks8695_init_early(void)
+{
 	ks8695_processor_info();
 	ks8695_clock_info();
 }
diff --git a/arch/arm/mach-ks8695/generic.h b/arch/arm/mach-ks8695/generic.h
index 2fbfab8..3fc88d3 100644
--- a/arch/arm/mach-ks8695/generic.h
+++ b/arch/arm/mach-ks8695/generic.h
@@ -11,5 +11,6 @@
 */
 =

 extern __init void ks8695_map_io(void);
+extern void ks8695_init_early(void);
 extern __init void ks8695_init_irq(void);
 extern struct sys_timer ks8695_timer;
diff --git a/arch/arm/mach-mmp/aspenite.c b/arch/arm/mach-mmp/aspenite.c
index 06b5fa8..1240230 100644
--- a/arch/arm/mach-mmp/aspenite.c
+++ b/arch/arm/mach-mmp/aspenite.c
@@ -237,16 +237,18 @@ static void __init common_init(void)
 }
 =

 MACHINE_START(ASPENITE, "PXA168-based Aspenite Development Platform")
-	.map_io		=3D mmp_map_io,
 	.nr_irqs	=3D IRQ_BOARD_START,
+	.map_io		=3D mmp_map_io,
+	.init_early	=3D mmp_init_early,
 	.init_irq       =3D pxa168_init_irq,
 	.timer          =3D &pxa168_timer,
 	.init_machine   =3D common_init,
 MACHINE_END
 =

 MACHINE_START(ZYLONITE2, "PXA168-based Zylonite2 Development Platform")
-	.map_io		=3D mmp_map_io,
 	.nr_irqs	=3D IRQ_BOARD_START,
+	.map_io		=3D mmp_map_io,
+	.init_early	=3D mmp_init_early,
 	.init_irq       =3D pxa168_init_irq,
 	.timer          =3D &pxa168_timer,
 	.init_machine   =3D common_init,
diff --git a/arch/arm/mach-mmp/avengers_lite.c b/arch/arm/mach-mmp/avengers=
_lite.c
index 39f0878..c9bbab3 100644
--- a/arch/arm/mach-mmp/avengers_lite.c
+++ b/arch/arm/mach-mmp/avengers_lite.c
@@ -42,6 +42,7 @@ static void __init avengers_lite_init(void)
 =

 MACHINE_START(AVENGERS_LITE, "PXA168 Avengers lite Development Platform")
 	.map_io		=3D mmp_map_io,
+	.init_early	=3D mmp_init_early,
 	.init_irq       =3D pxa168_init_irq,
 	.timer          =3D &pxa168_timer,
 	.init_machine   =3D avengers_lite_init,
diff --git a/arch/arm/mach-mmp/common.c b/arch/arm/mach-mmp/common.c
index 0ec0ca8..6ea9ba2 100644
--- a/arch/arm/mach-mmp/common.c
+++ b/arch/arm/mach-mmp/common.c
@@ -41,7 +41,10 @@ static struct map_desc standard_io_desc[] __initdata =3D=
 {
 void __init mmp_map_io(void)
 {
 	iotable_init(standard_io_desc, ARRAY_SIZE(standard_io_desc));
+}
 =

+void __init mmp_init_early(void)
+{
 	/* this is early, initialize mmp_chip_id here */
 	mmp_chip_id =3D __raw_readl(MMP_CHIPID);
 }
diff --git a/arch/arm/mach-mmp/common.h b/arch/arm/mach-mmp/common.h
index ec8d65d..d82e20c 100644
--- a/arch/arm/mach-mmp/common.h
+++ b/arch/arm/mach-mmp/common.h
@@ -6,3 +6,4 @@ extern void timer_init(int irq);
 =

 extern void __init icu_init_irq(void);
 extern void __init mmp_map_io(void);
+extern void __init mmp_init_early(void);
diff --git a/arch/arm/mach-mmp/flint.c b/arch/arm/mach-mmp/flint.c
index c4fd806..775ce3e 100644
--- a/arch/arm/mach-mmp/flint.c
+++ b/arch/arm/mach-mmp/flint.c
@@ -116,8 +116,9 @@ static void __init flint_init(void)
 }
 =

 MACHINE_START(FLINT, "Flint Development Platform")
-	.map_io		=3D mmp_map_io,
 	.nr_irqs	=3D FLINT_NR_IRQS,
+	.map_io		=3D mmp_map_io,
+	.init_early	=3D mmp_init_early,
 	.init_irq       =3D mmp2_init_irq,
 	.timer          =3D &mmp2_timer,
 	.init_machine   =3D flint_init,
diff --git a/arch/arm/mach-mmp/jasper.c b/arch/arm/mach-mmp/jasper.c
index 24172a0..8815168 100644
--- a/arch/arm/mach-mmp/jasper.c
+++ b/arch/arm/mach-mmp/jasper.c
@@ -171,8 +171,9 @@ static void __init jasper_init(void)
 }
 =

 MACHINE_START(MARVELL_JASPER, "Jasper Development Platform")
-	.map_io		=3D mmp_map_io,
 	.nr_irqs	=3D JASPER_NR_IRQS,
+	.map_io		=3D mmp_map_io,
+	.init_early	=3D mmp_init_early,
 	.init_irq       =3D mmp2_init_irq,
 	.timer          =3D &mmp2_timer,
 	.init_machine   =3D jasper_init,
diff --git a/arch/arm/mach-mmp/tavorevb.c b/arch/arm/mach-mmp/tavorevb.c
index c296b75..f8b34a6 100644
--- a/arch/arm/mach-mmp/tavorevb.c
+++ b/arch/arm/mach-mmp/tavorevb.c
@@ -100,6 +100,7 @@ static void __init tavorevb_init(void)
 =

 MACHINE_START(TAVOREVB, "PXA910 Evaluation Board (aka TavorEVB)")
 	.map_io		=3D mmp_map_io,
+	.init_early	=3D mmp_init_early,
 	.init_irq       =3D pxa910_init_irq,
 	.timer          =3D &pxa910_timer,
 	.init_machine   =3D tavorevb_init,
diff --git a/arch/arm/mach-mmp/teton_bga.c b/arch/arm/mach-mmp/teton_bga.c
index bbe4727..1902fae 100644
--- a/arch/arm/mach-mmp/teton_bga.c
+++ b/arch/arm/mach-mmp/teton_bga.c
@@ -81,8 +81,9 @@ static void __init teton_bga_init(void)
 }
 =

 MACHINE_START(TETON_BGA, "PXA168-based Teton BGA Development Platform")
-	.map_io		=3D mmp_map_io,
 	.nr_irqs	=3D IRQ_BOARD_START,
+	.map_io		=3D mmp_map_io,
+	.init_early	=3D mmp_init_early,
 	.init_irq       =3D pxa168_init_irq,
 	.timer          =3D &pxa168_timer,
 	.init_machine   =3D teton_bga_init,
diff --git a/arch/arm/mach-mmp/ttc_dkb.c b/arch/arm/mach-mmp/ttc_dkb.c
index e411039..2fe38a9 100644
--- a/arch/arm/mach-mmp/ttc_dkb.c
+++ b/arch/arm/mach-mmp/ttc_dkb.c
@@ -125,8 +125,9 @@ static void __init ttc_dkb_init(void)
 }
 =

 MACHINE_START(TTC_DKB, "PXA910-based TTC_DKB Development Platform")
-	.map_io		=3D mmp_map_io,
 	.nr_irqs	=3D TTCDKB_NR_IRQS,
+	.map_io		=3D mmp_map_io,
+	.init_early	=3D mmp_init_early,
 	.init_irq       =3D pxa910_init_irq,
 	.timer          =3D &pxa910_timer,
 	.init_machine   =3D ttc_dkb_init,
diff --git a/arch/arm/mach-msm/board-halibut.c b/arch/arm/mach-msm/board-ha=
libut.c
index 18a3c97..b00566e 100644
--- a/arch/arm/mach-msm/board-halibut.c
+++ b/arch/arm/mach-msm/board-halibut.c
@@ -78,24 +78,24 @@ static void __init halibut_init(void)
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 }
 =

-static void __init halibut_fixup(struct machine_desc *desc, struct tag *ta=
gs,
-				 char **cmdline, struct meminfo *mi)
+static void __init halibut_fixup(struct tag *tags, char **cmdline,
+				 struct meminfo *mi)
 {
 	mi->nr_banks=3D1;
 	mi->bank[0].start =3D PHYS_OFFSET;
 	mi->bank[0].size =3D (101*1024*1024);
 }
 =

-static void __init halibut_map_io(void)
+static void __init halibut_init_early(void)
 {
-	msm_map_common_io();
 	msm_clock_init(msm_clocks_7x01a, msm_num_clocks_7x01a);
 }
 =

 MACHINE_START(HALIBUT, "Halibut Board (QCT SURF7200A)")
 	.boot_params	=3D 0x10000100,
 	.fixup		=3D halibut_fixup,
-	.map_io		=3D halibut_map_io,
+	.map_io		=3D msm_map_common_io,
+	.init_early	=3D halibut_init_early,
 	.init_irq	=3D halibut_init_irq,
 	.init_machine	=3D halibut_init,
 	.timer		=3D &msm_timer,
diff --git a/arch/arm/mach-msm/board-mahimahi.c b/arch/arm/mach-msm/board-m=
ahimahi.c
index 7a9a03e..6c46098 100644
--- a/arch/arm/mach-msm/board-mahimahi.c
+++ b/arch/arm/mach-msm/board-mahimahi.c
@@ -53,8 +53,8 @@ static void __init mahimahi_init(void)
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 }
 =

-static void __init mahimahi_fixup(struct machine_desc *desc, struct tag *t=
ags,
-				 char **cmdline, struct meminfo *mi)
+static void __init mahimahi_fixup(struct tag *tags, char **cmdline,
+				  struct meminfo *mi)
 {
 	mi->nr_banks =3D 2;
 	mi->bank[0].start =3D PHYS_OFFSET;
@@ -65,9 +65,8 @@ static void __init mahimahi_fixup(struct machine_desc *de=
sc, struct tag *tags,
 	mi->bank[1].size =3D MSM_HIGHMEM_SIZE;
 }
 =

-static void __init mahimahi_map_io(void)
+static void __init mahimahi_init_early(void)
 {
-	msm_map_common_io();
 	msm_clock_init();
 }
 =

@@ -76,7 +75,8 @@ extern struct sys_timer msm_timer;
 MACHINE_START(MAHIMAHI, "mahimahi")
 	.boot_params	=3D 0x20000100,
 	.fixup		=3D mahimahi_fixup,
-	.map_io		=3D mahimahi_map_io,
+	.map_io		=3D msm_map_common_io,
+	.init_early	=3D mahimahi_init_early,
 	.init_irq	=3D msm_init_irq,
 	.init_machine	=3D mahimahi_init,
 	.timer		=3D &msm_timer,
diff --git a/arch/arm/mach-msm/board-msm7x27.c b/arch/arm/mach-msm/board-ms=
m7x27.c
index c03f269..a38f479 100644
--- a/arch/arm/mach-msm/board-msm7x27.c
+++ b/arch/arm/mach-msm/board-msm7x27.c
@@ -104,9 +104,8 @@ static void __init msm7x2x_init(void)
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 }
 =

-static void __init msm7x2x_map_io(void)
+static void __init msm7x2x_init_early(void)
 {
-	msm_map_common_io();
 	/* Technically dependent on the SoC but using machine_is
 	 * macros since socinfo is not available this early and there
 	 * are plans to restructure the code which will eliminate the
@@ -131,7 +130,8 @@ static void __init msm7x2x_map_io(void)
 =

 MACHINE_START(MSM7X27_SURF, "QCT MSM7x27 SURF")
 	.boot_params	=3D PLAT_PHYS_OFFSET + 0x100,
-	.map_io		=3D msm7x2x_map_io,
+	.map_io		=3D msm_map_common_io,
+	.init_early	=3D msm7x2x_init_early,
 	.init_irq	=3D msm7x2x_init_irq,
 	.init_machine	=3D msm7x2x_init,
 	.timer		=3D &msm_timer,
@@ -139,7 +139,8 @@ MACHINE_END
 =

 MACHINE_START(MSM7X27_FFA, "QCT MSM7x27 FFA")
 	.boot_params	=3D PLAT_PHYS_OFFSET + 0x100,
-	.map_io		=3D msm7x2x_map_io,
+	.map_io		=3D msm_map_common_io,
+	.init_early	=3D msm7x2x_init_early,
 	.init_irq	=3D msm7x2x_init_irq,
 	.init_machine	=3D msm7x2x_init,
 	.timer		=3D &msm_timer,
@@ -147,7 +148,8 @@ MACHINE_END
 =

 MACHINE_START(MSM7X25_SURF, "QCT MSM7x25 SURF")
 	.boot_params	=3D PLAT_PHYS_OFFSET + 0x100,
-	.map_io		=3D msm7x2x_map_io,
+	.map_io		=3D msm_map_common_io,
+	.init_early	=3D msm7x2x_init_early,
 	.init_irq	=3D msm7x2x_init_irq,
 	.init_machine	=3D msm7x2x_init,
 	.timer		=3D &msm_timer,
@@ -155,7 +157,8 @@ MACHINE_END
 =

 MACHINE_START(MSM7X25_FFA, "QCT MSM7x25 FFA")
 	.boot_params	=3D PLAT_PHYS_OFFSET + 0x100,
-	.map_io		=3D msm7x2x_map_io,
+	.map_io		=3D msm_map_common_io,
+	.init_early	=3D msm7x2x_init_early,
 	.init_irq	=3D msm7x2x_init_irq,
 	.init_machine	=3D msm7x2x_init,
 	.timer		=3D &msm_timer,
diff --git a/arch/arm/mach-msm/board-msm7x30.c b/arch/arm/mach-msm/board-ms=
m7x30.c
index b7a8496..dbc9037 100644
--- a/arch/arm/mach-msm/board-msm7x30.c
+++ b/arch/arm/mach-msm/board-msm7x30.c
@@ -99,15 +99,15 @@ static void __init msm7x30_init(void)
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 }
 =

-static void __init msm7x30_map_io(void)
+static void __init msm7x30_init_early(void)
 {
-	msm_map_msm7x30_io();
 	msm_clock_init(msm_clocks_7x30, msm_num_clocks_7x30);
 }
 =

 MACHINE_START(MSM7X30_SURF, "QCT MSM7X30 SURF")
 	.boot_params =3D PLAT_PHYS_OFFSET + 0x100,
-	.map_io =3D msm7x30_map_io,
+	.map_io =3D msm_map_msm7x30_io,
+	.init_early =3D msm7x30_init_early,
 	.init_irq =3D msm7x30_init_irq,
 	.init_machine =3D msm7x30_init,
 	.timer =3D &msm_timer,
@@ -115,7 +115,8 @@ MACHINE_END
 =

 MACHINE_START(MSM7X30_FFA, "QCT MSM7X30 FFA")
 	.boot_params =3D PLAT_PHYS_OFFSET + 0x100,
-	.map_io =3D msm7x30_map_io,
+	.map_io =3D msm_map_msm7x30_io,
+	.init_early =3D msm7x30_init_early,
 	.init_irq =3D msm7x30_init_irq,
 	.init_machine =3D msm7x30_init,
 	.timer =3D &msm_timer,
@@ -123,7 +124,8 @@ MACHINE_END
 =

 MACHINE_START(MSM7X30_FLUID, "QCT MSM7X30 FLUID")
 	.boot_params =3D PLAT_PHYS_OFFSET + 0x100,
-	.map_io =3D msm7x30_map_io,
+	.map_io =3D msm_map_msm7x30_io,
+	.init_early =3D msm7x30_init_early,
 	.init_irq =3D msm7x30_init_irq,
 	.init_machine =3D msm7x30_init,
 	.timer =3D &msm_timer,
diff --git a/arch/arm/mach-msm/board-qsd8x50.c b/arch/arm/mach-msm/board-qs=
d8x50.c
index 6a96911..4a567d2 100644
--- a/arch/arm/mach-msm/board-qsd8x50.c
+++ b/arch/arm/mach-msm/board-qsd8x50.c
@@ -171,9 +171,8 @@ static void __init qsd8x50_init_mmc(void)
 	msm_add_sdcc(1, &qsd8x50_sdc1_data, 0, 0);
 }
 =

-static void __init qsd8x50_map_io(void)
+static void __init qsd8x50_init_early(void)
 {
-	msm_map_qsd8x50_io();
 	msm_clock_init(msm_clocks_8x50, msm_num_clocks_8x50);
 }
 =

@@ -194,7 +193,8 @@ static void __init qsd8x50_init(void)
 =

 MACHINE_START(QSD8X50_SURF, "QCT QSD8X50 SURF")
 	.boot_params =3D PLAT_PHYS_OFFSET + 0x100,
-	.map_io =3D qsd8x50_map_io,
+	.map_io =3D msm_map_qsd8x50_io,
+	.init_early =3D qsd8x50_init_early,
 	.init_irq =3D qsd8x50_init_irq,
 	.init_machine =3D qsd8x50_init,
 	.timer =3D &msm_timer,
@@ -202,7 +202,8 @@ MACHINE_END
 =

 MACHINE_START(QSD8X50A_ST1_5, "QCT QSD8X50A ST1.5")
 	.boot_params =3D PLAT_PHYS_OFFSET + 0x100,
-	.map_io =3D qsd8x50_map_io,
+	.map_io =3D msm_map_qsd8x50_io,
+	.init_early =3D qsd8x50_init_early,
 	.init_irq =3D qsd8x50_init_irq,
 	.init_machine =3D qsd8x50_init,
 	.timer =3D &msm_timer,
diff --git a/arch/arm/mach-msm/board-sapphire.c b/arch/arm/mach-msm/board-s=
apphire.c
index 68f930f..46186c4 100644
--- a/arch/arm/mach-msm/board-sapphire.c
+++ b/arch/arm/mach-msm/board-sapphire.c
@@ -77,8 +77,8 @@ static struct map_desc sapphire_io_desc[] __initdata =3D {
 	}
 };
 =

-static void __init sapphire_fixup(struct machine_desc *desc, struct tag *t=
ags,
-				  char **cmdline, struct meminfo *mi)
+static void __init sapphire_fixup(struct tag *tags, char **cmdline,
+				  struct meminfo *mi)
 {
 	int smi_sz =3D parse_tag_smi((const struct tag *)tags);
 =

@@ -100,6 +100,10 @@ static void __init sapphire_map_io(void)
 {
 	msm_map_common_io();
 	iotable_init(sapphire_io_desc, ARRAY_SIZE(sapphire_io_desc));
+}
+
+static void __init sapphire_init_early(void)
+{
 	msm_clock_init();
 }
 =

@@ -108,6 +112,7 @@ MACHINE_START(SAPPHIRE, "sapphire")
 	.boot_params    =3D PLAT_PHYS_OFFSET + 0x100,
 	.fixup          =3D sapphire_fixup,
 	.map_io         =3D sapphire_map_io,
+	.init_early	=3D sapphire_init_early,
 	.init_irq       =3D sapphire_init_irq,
 	.init_machine   =3D sapphire_init,
 	.timer          =3D &msm_timer,
diff --git a/arch/arm/mach-msm/board-trout.c b/arch/arm/mach-msm/board-trou=
t.c
index 8143867..53f71cf 100644
--- a/arch/arm/mach-msm/board-trout.c
+++ b/arch/arm/mach-msm/board-trout.c
@@ -48,8 +48,8 @@ static void __init trout_init_irq(void)
 	msm_init_irq();
 }
 =

-static void __init trout_fixup(struct machine_desc *desc, struct tag *tags,
-				char **cmdline, struct meminfo *mi)
+static void __init trout_fixup(struct tag *tags, char **cmdline,
+			       struct meminfo *mi)
 {
 	mi->nr_banks =3D 1;
 	mi->bank[0].start =3D PHYS_OFFSET;
@@ -83,7 +83,10 @@ static void __init trout_map_io(void)
 {
 	msm_map_common_io();
 	iotable_init(trout_io_desc, ARRAY_SIZE(trout_io_desc));
+}
 =

+static void __init trout_init_early(void)
+{
 #ifdef CONFIG_MSM_DEBUG_UART3
 	/* route UART3 to the "H2W" extended usb connector */
 	writeb(0x80, TROUT_CPLD_BASE + 0x00);
@@ -96,6 +99,7 @@ MACHINE_START(TROUT, "HTC Dream")
 	.boot_params	=3D 0x10000100,
 	.fixup		=3D trout_fixup,
 	.map_io		=3D trout_map_io,
+	.init_early	=3D trout_init_early,
 	.init_irq	=3D trout_init_irq,
 	.init_machine	=3D trout_init,
 	.timer		=3D &msm_timer,
diff --git a/arch/arm/mach-nuc93x/mach-nuc932evb.c b/arch/arm/mach-nuc93x/m=
ach-nuc932evb.c
index d702570..54f9742 100644
--- a/arch/arm/mach-nuc93x/mach-nuc932evb.c
+++ b/arch/arm/mach-nuc93x/mach-nuc932evb.c
@@ -21,9 +21,8 @@
 =

 #include "nuc932.h"
 =

-static void __init nuc932evb_map_io(void)
+static void __init nuc932evb_init_early(void)
 {
-	nuc932_map_io();
 	nuc932_init_clocks();
 	nuc932_init_uartclk();
 }
@@ -36,7 +35,8 @@ static void __init nuc932evb_init(void)
 MACHINE_START(NUC932EVB, "NUC932EVB")
 	/* Maintainer: Wan ZongShun */
 	.boot_params	=3D 0,
-	.map_io		=3D nuc932evb_map_io,
+	.map_io		=3D nuc932_map_io,
+	.init_early	=3D nuc932evb_init_early,
 	.init_irq	=3D nuc93x_init_irq,
 	.init_machine	=3D nuc932evb_init,
 	.timer		=3D &nuc93x_timer,
diff --git a/arch/arm/mach-orion5x/common.c b/arch/arm/mach-orion5x/common.c
index 0ab531d..22ace0b 100644
--- a/arch/arm/mach-orion5x/common.c
+++ b/arch/arm/mach-orion5x/common.c
@@ -308,8 +308,8 @@ void __init orion5x_init(void)
  * Many orion-based systems have buggy bootloader implementations.
  * This is a common fixup for bogus memory tags.
  */
-void __init tag_fixup_mem32(struct machine_desc *mdesc, struct tag *t,
-			    char **from, struct meminfo *meminfo)
+void __init tag_fixup_mem32(struct tag *t, char **from,
+			    struct meminfo *meminfo)
 {
 	for (; t->hdr.size; t =3D tag_next(t))
 		if (t->hdr.tag =3D=3D ATAG_MEM &&
diff --git a/arch/arm/mach-orion5x/common.h b/arch/arm/mach-orion5x/common.h
index f2b2b35..fbd6c54 100644
--- a/arch/arm/mach-orion5x/common.h
+++ b/arch/arm/mach-orion5x/common.h
@@ -53,11 +53,9 @@ int orion5x_pci_sys_setup(int nr, struct pci_sys_data *s=
ys);
 struct pci_bus *orion5x_pci_sys_scan_bus(int nr, struct pci_sys_data *sys);
 int orion5x_pci_map_irq(struct pci_dev *dev, u8 slot, u8 pin);
 =

-struct machine_desc;
 struct meminfo;
 struct tag;
-extern void __init tag_fixup_mem32(struct machine_desc *, struct tag *,
-				   char **, struct meminfo *);
+extern void __init tag_fixup_mem32(struct tag *, char **, struct meminfo *=
);
 =

 =

 #endif
diff --git a/arch/arm/mach-pxa/cm-x2xx.c b/arch/arm/mach-pxa/cm-x2xx.c
index a109967..1be9c7e 100644
--- a/arch/arm/mach-pxa/cm-x2xx.c
+++ b/arch/arm/mach-pxa/cm-x2xx.c
@@ -497,7 +497,10 @@ static void __init cmx2xx_map_io(void)
 		pxa27x_map_io();
 =

 	iotable_init(cmx2xx_io_desc, ARRAY_SIZE(cmx2xx_io_desc));
+}
 =

+static void __init cmx2xx_init_early(void)
+{
 	it8152_base_address =3D CMX2XX_IT8152_VIRT;
 }
 #else
@@ -509,12 +512,14 @@ static void __init cmx2xx_map_io(void)
 	if (cpu_is_pxa27x())
 		pxa27x_map_io();
 }
+#define cmx2xx_init_early	NULL
 #endif
 =

 MACHINE_START(ARMCORE, "Compulab CM-X2XX")
 	.boot_params	=3D 0xa0000100,
-	.map_io		=3D cmx2xx_map_io,
 	.nr_irqs	=3D CMX2XX_NR_IRQS,
+	.map_io		=3D cmx2xx_map_io,
+	.init_early	=3D cmx2xx_init_early,
 	.init_irq	=3D cmx2xx_init_irq,
 	.timer		=3D &pxa_timer,
 	.init_machine	=3D cmx2xx_init,
diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
index b2248e7..e87d373 100644
--- a/arch/arm/mach-pxa/cm-x300.c
+++ b/arch/arm/mach-pxa/cm-x300.c
@@ -843,8 +843,8 @@ static void __init cm_x300_init(void)
 	cm_x300_init_bl();
 }
 =

-static void __init cm_x300_fixup(struct machine_desc *mdesc, struct tag *t=
ags,
-				 char **cmdline, struct meminfo *mi)
+static void __init cm_x300_fixup(struct tag *tags, char **cmdline,
+				 struct meminfo *mi)
 {
 	/* Make sure that mi->bank[0].start =3D PHYS_ADDR */
 	for (; tags->hdr.size; tags =3D tag_next(tags))
diff --git a/arch/arm/mach-pxa/corgi.c b/arch/arm/mach-pxa/corgi.c
index 3a5507e..249bd94 100644
--- a/arch/arm/mach-pxa/corgi.c
+++ b/arch/arm/mach-pxa/corgi.c
@@ -705,8 +705,8 @@ static void __init corgi_init(void)
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 }
 =

-static void __init fixup_corgi(struct machine_desc *desc,
-		struct tag *tags, char **cmdline, struct meminfo *mi)
+static void __init fixup_corgi(struct tag *tags, char **cmdline,
+			       struct meminfo *mi)
 {
 	sharpsl_save_param();
 	mi->nr_banks=3D1;
diff --git a/arch/arm/mach-pxa/eseries.c b/arch/arm/mach-pxa/eseries.c
index 2e3970f..1376929 100644
--- a/arch/arm/mach-pxa/eseries.c
+++ b/arch/arm/mach-pxa/eseries.c
@@ -41,8 +41,7 @@
 #include "clock.h"
 =

 /* Only e800 has 128MB RAM */
-void __init eseries_fixup(struct machine_desc *desc,
-	struct tag *tags, char **cmdline, struct meminfo *mi)
+void __init eseries_fixup(struct tag *tags, char **cmdline, struct meminfo=
 *mi)
 {
 	mi->nr_banks=3D1;
 	mi->bank[0].start =3D 0xa0000000;
diff --git a/arch/arm/mach-pxa/eseries.h b/arch/arm/mach-pxa/eseries.h
index 5930f5e..be92196 100644
--- a/arch/arm/mach-pxa/eseries.h
+++ b/arch/arm/mach-pxa/eseries.h
@@ -1,5 +1,4 @@
-void __init eseries_fixup(struct machine_desc *desc,
-	struct tag *tags, char **cmdline, struct meminfo *mi);
+void __init eseries_fixup(struct tag *tags, char **cmdline, struct meminfo=
 *mi);
 =

 extern struct pxa2xx_udc_mach_info e7xx_udc_mach_info;
 extern struct pxaficp_platform_data e7xx_ficp_platform_data;
diff --git a/arch/arm/mach-pxa/lpd270.c b/arch/arm/mach-pxa/lpd270.c
index 6cf8180..dbaa105 100644
--- a/arch/arm/mach-pxa/lpd270.c
+++ b/arch/arm/mach-pxa/lpd270.c
@@ -491,7 +491,10 @@ static void __init lpd270_map_io(void)
 {
 	pxa27x_map_io();
 	iotable_init(lpd270_io_desc, ARRAY_SIZE(lpd270_io_desc));
+}
 =

+static void __init lpd270_init_early(void)
+{
 	/* for use I SRAM as framebuffer.  */
 	PSLR |=3D 0x00000F04;
 	PCFR  =3D 0x00000066;
@@ -500,8 +503,9 @@ static void __init lpd270_map_io(void)
 MACHINE_START(LOGICPD_PXA270, "LogicPD PXA270 Card Engine")
 	/* Maintainer: Peter Barada */
 	.boot_params	=3D 0xa0000100,
-	.map_io		=3D lpd270_map_io,
 	.nr_irqs	=3D LPD270_NR_IRQS,
+	.map_io		=3D lpd270_map_io,
+	.init_early	=3D lpd270_init_early,
 	.init_irq	=3D lpd270_init_irq,
 	.timer		=3D &pxa_timer,
 	.init_machine	=3D lpd270_init,
diff --git a/arch/arm/mach-pxa/lubbock.c b/arch/arm/mach-pxa/lubbock.c
index e10ddb8..167ce68 100644
--- a/arch/arm/mach-pxa/lubbock.c
+++ b/arch/arm/mach-pxa/lubbock.c
@@ -544,14 +544,18 @@ static void __init lubbock_map_io(void)
 {
 	pxa25x_map_io();
 	iotable_init(lubbock_io_desc, ARRAY_SIZE(lubbock_io_desc));
+}
 =

+static void __init lubbock_init_early(void)
+{
 	PCFR |=3D PCFR_OPDE;
 }
 =

 MACHINE_START(LUBBOCK, "Intel DBPXA250 Development Platform (aka Lubbock)")
 	/* Maintainer: MontaVista Software Inc. */
-	.map_io		=3D lubbock_map_io,
 	.nr_irqs	=3D LUBBOCK_NR_IRQS,
+	.map_io		=3D lubbock_map_io,
+	.init_early	=3D lubbock_init_early,
 	.init_irq	=3D lubbock_init_irq,
 	.timer		=3D &pxa_timer,
 	.init_machine	=3D lubbock_init,
diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index 3479e2b..25f0319 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -608,7 +608,10 @@ static void __init mainstone_map_io(void)
 {
 	pxa27x_map_io();
 	iotable_init(mainstone_io_desc, ARRAY_SIZE(mainstone_io_desc));
+}
 =

+static void __init mainstone_init_early(void)
+{
  	/*	for use I SRAM as framebuffer.	*/
  	PSLR |=3D 0xF04;
  	PCFR =3D 0x66;
@@ -617,8 +620,9 @@ static void __init mainstone_map_io(void)
 MACHINE_START(MAINSTONE, "Intel HCDDBBVA0 Development Platform (aka Mainst=
one)")
 	/* Maintainer: MontaVista Software Inc. */
 	.boot_params	=3D 0xa0000100,	/* BLOB boot parameter setting */
-	.map_io		=3D mainstone_map_io,
 	.nr_irqs	=3D MAINSTONE_NR_IRQS,
+	.map_io		=3D mainstone_map_io,
+	.init_early	=3D mainstone_init_early,
 	.init_irq	=3D mainstone_init_irq,
 	.timer		=3D &pxa_timer,
 	.init_machine	=3D mainstone_init,
diff --git a/arch/arm/mach-pxa/pcm027.c b/arch/arm/mach-pxa/pcm027.c
index 1fc8a66..df0aff9 100644
--- a/arch/arm/mach-pxa/pcm027.c
+++ b/arch/arm/mach-pxa/pcm027.c
@@ -242,10 +242,8 @@ static void __init pcm027_init(void)
 	spi_register_board_info(spi_board_info, ARRAY_SIZE(spi_board_info));
 }
 =

-static void __init pcm027_map_io(void)
+static void __init pcm027_init_early(void)
 {
-	pxa27x_map_io();
-
 	/* initialize sleep mode regs (wake-up sources, etc) */
 	PGSR0 =3D 0x01308000;
 	PGSR1 =3D 0x00CF0002;
@@ -259,8 +257,9 @@ static void __init pcm027_map_io(void)
 MACHINE_START(PCM027, "Phytec Messtechnik GmbH phyCORE-PXA270")
 	/* Maintainer: Pengutronix */
 	.boot_params	=3D 0xa0000100,
-	.map_io		=3D pcm027_map_io,
 	.nr_irqs	=3D PCM027_NR_IRQS,
+	.map_io		=3D pxa27x_map_io,
+	.init_early	=3D pcm027_init_early,
 	.init_irq	=3D pxa27x_init_irq,
 	.timer		=3D &pxa_timer,
 	.init_machine	=3D pcm027_init,
diff --git a/arch/arm/mach-pxa/poodle.c b/arch/arm/mach-pxa/poodle.c
index 16d14fd..10b1f76 100644
--- a/arch/arm/mach-pxa/poodle.c
+++ b/arch/arm/mach-pxa/poodle.c
@@ -454,8 +454,8 @@ static void __init poodle_init(void)
 	poodle_init_spi();
 }
 =

-static void __init fixup_poodle(struct machine_desc *desc,
-		struct tag *tags, char **cmdline, struct meminfo *mi)
+static void __init fixup_poodle(struct tag *tags, char **cmdline,
+				struct meminfo *mi)
 {
 	sharpsl_save_param();
 	mi->nr_banks=3D1;
diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 01c5769..550143c 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -970,8 +970,8 @@ static void __init spitz_init(void)
 	spitz_i2c_init();
 }
 =

-static void __init spitz_fixup(struct machine_desc *desc,
-		struct tag *tags, char **cmdline, struct meminfo *mi)
+static void __init spitz_fixup(struct tag *tags, char **cmdline,
+			       struct meminfo *mi)
 {
 	sharpsl_save_param();
 	mi->nr_banks =3D 1;
diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
index 5fa1457..0f96ee2 100644
--- a/arch/arm/mach-pxa/tosa.c
+++ b/arch/arm/mach-pxa/tosa.c
@@ -960,8 +960,8 @@ static void __init tosa_init(void)
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 }
 =

-static void __init fixup_tosa(struct machine_desc *desc,
-		struct tag *tags, char **cmdline, struct meminfo *mi)
+static void __init fixup_tosa(struct tag *tags, char **cmdline,
+			      struct meminfo *mi)
 {
 	sharpsl_save_param();
 	mi->nr_banks=3D1;
diff --git a/arch/arm/mach-pxa/trizeps4.c b/arch/arm/mach-pxa/trizeps4.c
index 687417a..5adfa4c 100644
--- a/arch/arm/mach-pxa/trizeps4.c
+++ b/arch/arm/mach-pxa/trizeps4.c
@@ -540,7 +540,10 @@ static void __init trizeps4_map_io(void)
 {
 	pxa27x_map_io();
 	iotable_init(trizeps4_io_desc, ARRAY_SIZE(trizeps4_io_desc));
+}
 =

+static void __init trizeps4_init_early(void)
+{
 	if ((__raw_readl(MSC0) & 0x8) && (__raw_readl(BOOT_DEF) & 0x1)) {
 		/* if flash is 16 bit wide its a Trizeps4 WL */
 		__machine_arch_type =3D MACH_TYPE_TRIZEPS4WL;
@@ -555,17 +558,19 @@ static void __init trizeps4_map_io(void)
 MACHINE_START(TRIZEPS4, "Keith und Koep Trizeps IV module")
 	/* MAINTAINER("J=FCrgen Schindele") */
 	.boot_params	=3D TRIZEPS4_SDRAM_BASE + 0x100,
-	.init_machine	=3D trizeps4_init,
 	.map_io		=3D trizeps4_map_io,
+	.init_early	=3D trizeps4_init_early,
 	.init_irq	=3D pxa27x_init_irq,
+	.init_machine	=3D trizeps4_init,
 	.timer		=3D &pxa_timer,
 MACHINE_END
 =

 MACHINE_START(TRIZEPS4WL, "Keith und Koep Trizeps IV-WL module")
 	/* MAINTAINER("J=FCrgen Schindele") */
 	.boot_params	=3D TRIZEPS4_SDRAM_BASE + 0x100,
-	.init_machine	=3D trizeps4_init,
 	.map_io		=3D trizeps4_map_io,
+	.init_early	=3D trizeps4_init_early,
 	.init_irq	=3D pxa27x_init_irq,
+	.init_machine	=3D trizeps4_init,
 	.timer		=3D &pxa_timer,
 MACHINE_END
diff --git a/arch/arm/mach-pxa/viper.c b/arch/arm/mach-pxa/viper.c
index 903218e..3f257c1 100644
--- a/arch/arm/mach-pxa/viper.c
+++ b/arch/arm/mach-pxa/viper.c
@@ -984,9 +984,11 @@ static struct map_desc viper_io_desc[] __initdata =3D {
 static void __init viper_map_io(void)
 {
 	pxa25x_map_io();
-
 	iotable_init(viper_io_desc, ARRAY_SIZE(viper_io_desc));
+}
 =

+static void __init viper_init_early(void)
+{
 	PCFR |=3D PCFR_OPDE;
 }
 =

@@ -994,6 +996,7 @@ MACHINE_START(VIPER, "Arcom/Eurotech VIPER SBC")
 	/* Maintainer: Marc Zyngier <maz-20xNzvSXLT6hUMvJH42dtQ@public.gmane.org> */
 	.boot_params	=3D 0xa0000100,
 	.map_io		=3D viper_map_io,
+	.init_early	=3D viper_init_early,
 	.init_irq	=3D viper_init_irq,
 	.timer          =3D &pxa_timer,
 	.init_machine	=3D viper_init,
diff --git a/arch/arm/mach-pxa/zeus.c b/arch/arm/mach-pxa/zeus.c
index 00363c7..5a17d91 100644
--- a/arch/arm/mach-pxa/zeus.c
+++ b/arch/arm/mach-pxa/zeus.c
@@ -888,9 +888,11 @@ static struct map_desc zeus_io_desc[] __initdata =3D {
 static void __init zeus_map_io(void)
 {
 	pxa27x_map_io();
-
 	iotable_init(zeus_io_desc, ARRAY_SIZE(zeus_io_desc));
+}
 =

+static void __init zeus_init_early(void)
+{
 	/* Clear PSPR to ensure a full restart on wake-up. */
 	PMCR =3D PSPR =3D 0;
 =

@@ -905,8 +907,9 @@ static void __init zeus_map_io(void)
 MACHINE_START(ARCOM_ZEUS, "Arcom/Eurotech ZEUS")
 	/* Maintainer: Marc Zyngier <maz-20xNzvSXLT6hUMvJH42dtQ@public.gmane.org> */
 	.boot_params	=3D 0xa0000100,
-	.map_io		=3D zeus_map_io,
 	.nr_irqs	=3D ZEUS_NR_IRQS,
+	.map_io		=3D zeus_map_io,
+	.init_early	=3D zeus_init_early,
 	.init_irq	=3D zeus_init_irq,
 	.timer		=3D &pxa_timer,
 	.init_machine	=3D zeus_init,
diff --git a/arch/arm/mach-realview/core.c b/arch/arm/mach-realview/core.c
index 5c23450..d5ed5d4 100644
--- a/arch/arm/mach-realview/core.c
+++ b/arch/arm/mach-realview/core.c
@@ -517,8 +517,7 @@ void __init realview_timer_init(unsigned int timer_irq)
 /*
  * Setup the memory banks.
  */
-void realview_fixup(struct machine_desc *mdesc, struct tag *tags, char **f=
rom,
-		    struct meminfo *meminfo)
+void realview_fixup(struct tag *tags, char **from, struct meminfo *meminfo)
 {
 	/*
 	 * Most RealView platforms have 512MB contiguous RAM at 0x70000000.
diff --git a/arch/arm/mach-realview/core.h b/arch/arm/mach-realview/core.h
index 5c83d1e..47259c8 100644
--- a/arch/arm/mach-realview/core.h
+++ b/arch/arm/mach-realview/core.h
@@ -63,8 +63,8 @@ extern int realview_flash_register(struct resource *res, =
u32 num);
 extern int realview_eth_register(const char *name, struct resource *res);
 extern int realview_usb_register(struct resource *res);
 extern void realview_init_early(void);
-extern void realview_fixup(struct machine_desc *mdesc, struct tag *tags,
-			   char **from, struct meminfo *meminfo);
+extern void realview_fixup(struct tag *tags, char **from,
+			   struct meminfo *meminfo);
 extern void (*realview_reset)(char);
 =

 #endif
diff --git a/arch/arm/mach-realview/realview_pb1176.c b/arch/arm/mach-realv=
iew/realview_pb1176.c
index eab6070..9f00be8 100644
--- a/arch/arm/mach-realview/realview_pb1176.c
+++ b/arch/arm/mach-realview/realview_pb1176.c
@@ -316,8 +316,7 @@ static void realview_pb1176_reset(char mode)
 	__raw_writel(REALVIEW_PB1176_SYS_SOFT_RESET, reset_ctrl);
 }
 =

-static void realview_pb1176_fixup(struct machine_desc *mdesc,
-				  struct tag *tags, char **from,
+static void realview_pb1176_fixup(struct tag *tags, char **from,
 				  struct meminfo *meminfo)
 {
 	/*
diff --git a/arch/arm/mach-realview/realview_pbx.c b/arch/arm/mach-realview=
/realview_pbx.c
index 92ace2c..27f199f 100644
--- a/arch/arm/mach-realview/realview_pbx.c
+++ b/arch/arm/mach-realview/realview_pbx.c
@@ -319,8 +319,8 @@ static struct sys_timer realview_pbx_timer =3D {
 	.init		=3D realview_pbx_timer_init,
 };
 =

-static void realview_pbx_fixup(struct machine_desc *mdesc, struct tag *tag=
s,
-			       char **from, struct meminfo *meminfo)
+static void realview_pbx_fixup(struct tag *tags, char **from,
+			       struct meminfo *meminfo)
 {
 #ifdef CONFIG_SPARSEMEM
 	/*
@@ -335,7 +335,7 @@ static void realview_pbx_fixup(struct machine_desc *mde=
sc, struct tag *tags,
 	meminfo->bank[2].size =3D SZ_256M;
 	meminfo->nr_banks =3D 3;
 #else
-	realview_fixup(mdesc, tags, from, meminfo);
+	realview_fixup(tags, from, meminfo);
 #endif
 }
 =

diff --git a/arch/arm/mach-rpc/riscpc.c b/arch/arm/mach-rpc/riscpc.c
index 580b3c7..6a0f96d 100644
--- a/arch/arm/mach-rpc/riscpc.c
+++ b/arch/arm/mach-rpc/riscpc.c
@@ -84,7 +84,10 @@ static struct map_desc rpc_io_desc[] __initdata =3D {
 static void __init rpc_map_io(void)
 {
 	iotable_init(rpc_io_desc, ARRAY_SIZE(rpc_io_desc));
+}
 =

+static void __init rpc_init_early(void)
+{
 	/*
 	 * Turn off floppy.
 	 */
@@ -222,6 +225,7 @@ MACHINE_START(RISCPC, "Acorn-RiscPC")
 	.reserve_lp0	=3D 1,
 	.reserve_lp1	=3D 1,
 	.map_io		=3D rpc_map_io,
+	.init_early	=3D rpc_init_early,
 	.init_irq	=3D rpc_init_irq,
 	.timer		=3D &ioc_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c2410/mach-amlm5900.c b/arch/arm/mach-s3c2410/=
mach-amlm5900.c
index dabc141..4f085ce 100644
--- a/arch/arm/mach-s3c2410/mach-amlm5900.c
+++ b/arch/arm/mach-s3c2410/mach-amlm5900.c
@@ -161,6 +161,11 @@ static struct platform_device *amlm5900_devices[] __in=
itdata =3D {
 static void __init amlm5900_map_io(void)
 {
 	s3c24xx_init_io(amlm5900_iodesc, ARRAY_SIZE(amlm5900_iodesc));
+}
+
+static void __init amlm5900_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(amlm5900_uartcfgs, ARRAY_SIZE(amlm5900_uartcfgs));
 }
@@ -238,6 +243,7 @@ static void __init amlm5900_init(void)
 MACHINE_START(AML_M5900, "AML_M5900")
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D amlm5900_map_io,
+	.init_early	=3D amlm5900_init_early,
 	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D amlm5900_init,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2410/mach-bast.c b/arch/arm/mach-s3c2410/mach=
-bast.c
index 1e2d536..7100054 100644
--- a/arch/arm/mach-s3c2410/mach-bast.c
+++ b/arch/arm/mach-s3c2410/mach-bast.c
@@ -612,6 +612,11 @@ static struct s3c24xx_audio_simtec_pdata __initdata ba=
st_audio =3D {
 =

 static void __init bast_map_io(void)
 {
+	s3c24xx_init_io(bast_iodesc, ARRAY_SIZE(bast_iodesc));
+}
+
+static void __init bast_init_early(void)
+{
 	/* initialise the clocks */
 =

 	s3c24xx_dclk0.parent =3D &clk_upll;
@@ -629,7 +634,7 @@ static void __init bast_map_io(void)
 =

 	s3c_hwmon_set_platdata(&bast_hwmon_info);
 =

-	s3c24xx_init_io(bast_iodesc, ARRAY_SIZE(bast_iodesc));
+	s3c_init_early();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(bast_uartcfgs, ARRAY_SIZE(bast_uartcfgs));
 }
@@ -659,6 +664,7 @@ MACHINE_START(BAST, "Simtec-BAST")
 	/* Maintainer: Ben Dooks <ben-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D bast_map_io,
+	.init_early	=3D bast_init_early,
 	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D bast_init,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2410/mach-h1940.c b/arch/arm/mach-s3c2410/mac=
h-h1940.c
index 2a2fa06..ec4a19a 100644
--- a/arch/arm/mach-s3c2410/mach-h1940.c
+++ b/arch/arm/mach-s3c2410/mach-h1940.c
@@ -652,6 +652,11 @@ static struct platform_device *h1940_devices[] __initd=
ata =3D {
 static void __init h1940_map_io(void)
 {
 	s3c24xx_init_io(h1940_iodesc, ARRAY_SIZE(h1940_iodesc));
+}
+
+static void __init h1940_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(h1940_uartcfgs, ARRAY_SIZE(h1940_uartcfgs));
 =

@@ -745,8 +750,9 @@ static void __init h1940_init(void)
 MACHINE_START(H1940, "IPAQ-H1940")
 	/* Maintainer: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
-	.map_io		=3D h1940_map_io,
 	.reserve	=3D h1940_reserve,
+	.map_io		=3D h1940_map_io,
+	.init_early	=3D h1940_init_early,
 	.init_irq	=3D h1940_init_irq,
 	.init_machine	=3D h1940_init,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2410/mach-n30.c b/arch/arm/mach-s3c2410/mach-=
n30.c
index 079dcaa..51469cc 100644
--- a/arch/arm/mach-s3c2410/mach-n30.c
+++ b/arch/arm/mach-s3c2410/mach-n30.c
@@ -531,6 +531,11 @@ static void __init n30_hwinit(void)
 static void __init n30_map_io(void)
 {
 	s3c24xx_init_io(n30_iodesc, ARRAY_SIZE(n30_iodesc));
+}
+
+static void __init n30_init_early(void)
+{
+	s3c_init_early();
 	n30_hwinit();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(n30_uartcfgs, ARRAY_SIZE(n30_uartcfgs));
@@ -587,18 +592,20 @@ MACHINE_START(N30, "Acer-N30")
 				Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
 	*/
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
+	.map_io		=3D n30_map_io,
+	.init_early	=3D n30_init_early,
+	.init_irq	=3D s3c24xx_init_irq,
 	.timer		=3D &s3c24xx_timer,
 	.init_machine	=3D n30_init,
-	.init_irq	=3D s3c24xx_init_irq,
-	.map_io		=3D n30_map_io,
 MACHINE_END
 =

 MACHINE_START(N35, "Acer-N35")
 	/* Maintainer: Christer Weinigel <christer-rKHMIqA5R6gwFerOooGFRg@public.gmane.org>
 	*/
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
+	.map_io		=3D n30_map_io,
+	.init_early	=3D n30_init_early,
+	.init_irq	=3D s3c24xx_init_irq,
 	.timer		=3D &s3c24xx_timer,
 	.init_machine	=3D n30_init,
-	.init_irq	=3D s3c24xx_init_irq,
-	.map_io		=3D n30_map_io,
 MACHINE_END
diff --git a/arch/arm/mach-s3c2410/mach-otom.c b/arch/arm/mach-s3c2410/mach=
-otom.c
index 0aa16cd..21951cd 100644
--- a/arch/arm/mach-s3c2410/mach-otom.c
+++ b/arch/arm/mach-s3c2410/mach-otom.c
@@ -104,6 +104,11 @@ static struct platform_device *otom11_devices[] __init=
data =3D {
 static void __init otom11_map_io(void)
 {
 	s3c24xx_init_io(otom11_iodesc, ARRAY_SIZE(otom11_iodesc));
+}
+
+static void __init otom11_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(otom11_uartcfgs, ARRAY_SIZE(otom11_uartcfgs));
 }
@@ -118,6 +123,7 @@ MACHINE_START(OTOM, "Nex Vision - Otom 1.1")
 	/* Maintainer: Guillaume GOURAT <guillaume.gourat-SG84m9Bk/uxjrEqMGRc/AA@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D otom11_map_io,
+	.init_early	=3D otom11_init_early,
 	.init_machine	=3D otom11_init,
 	.init_irq	=3D s3c24xx_init_irq,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2410/mach-qt2410.c b/arch/arm/mach-s3c2410/ma=
ch-qt2410.c
index e8f49fe..d562857 100644
--- a/arch/arm/mach-s3c2410/mach-qt2410.c
+++ b/arch/arm/mach-s3c2410/mach-qt2410.c
@@ -326,6 +326,11 @@ __setup("tft=3D", qt2410_tft_setup);
 static void __init qt2410_map_io(void)
 {
 	s3c24xx_init_io(qt2410_iodesc, ARRAY_SIZE(qt2410_iodesc));
+}
+
+static void __init qt2410_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12*1000*1000);
 	s3c24xx_init_uarts(smdk2410_uartcfgs, ARRAY_SIZE(smdk2410_uartcfgs));
 }
@@ -364,6 +369,7 @@ static void __init qt2410_machine_init(void)
 MACHINE_START(QT2410, "QT2410")
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D qt2410_map_io,
+	.init_early	=3D qt2410_init_early,
 	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D qt2410_machine_init,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2410/mach-smdk2410.c b/arch/arm/mach-s3c2410/=
mach-smdk2410.c
index e17f033..75822ea 100644
--- a/arch/arm/mach-s3c2410/mach-smdk2410.c
+++ b/arch/arm/mach-s3c2410/mach-smdk2410.c
@@ -97,6 +97,11 @@ static struct platform_device *smdk2410_devices[] __init=
data =3D {
 static void __init smdk2410_map_io(void)
 {
 	s3c24xx_init_io(smdk2410_iodesc, ARRAY_SIZE(smdk2410_iodesc));
+}
+
+static void __init smdk2410_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(smdk2410_uartcfgs, ARRAY_SIZE(smdk2410_uartcfgs));
 }
@@ -113,6 +118,7 @@ MACHINE_START(SMDK2410, "SMDK2410") /* @TODO: request a=
 new identifier and switc
 	/* Maintainer: Jonas Dietsche */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D smdk2410_map_io,
+	.init_early	=3D smdk2410_init_early,
 	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D smdk2410_init,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2410/mach-tct_hammer.c b/arch/arm/mach-s3c241=
0/mach-tct_hammer.c
index 43c2b83..e17213c 100644
--- a/arch/arm/mach-s3c2410/mach-tct_hammer.c
+++ b/arch/arm/mach-s3c2410/mach-tct_hammer.c
@@ -135,6 +135,11 @@ static struct platform_device *tct_hammer_devices[] __=
initdata =3D {
 static void __init tct_hammer_map_io(void)
 {
 	s3c24xx_init_io(tct_hammer_iodesc, ARRAY_SIZE(tct_hammer_iodesc));
+}
+
+static void __init tct_hammer_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(tct_hammer_uartcfgs, ARRAY_SIZE(tct_hammer_uartcfgs));
 }
@@ -148,6 +153,7 @@ static void __init tct_hammer_init(void)
 MACHINE_START(TCT_HAMMER, "TCT_HAMMER")
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D tct_hammer_map_io,
+	.init_early	=3D tct_hammer_init_early,
 	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D tct_hammer_init,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2410/mach-vr1000.c b/arch/arm/mach-s3c2410/ma=
ch-vr1000.c
index 6ccce5a..a58227d 100644
--- a/arch/arm/mach-s3c2410/mach-vr1000.c
+++ b/arch/arm/mach-s3c2410/mach-vr1000.c
@@ -362,6 +362,11 @@ static void vr1000_power_off(void)
 =

 static void __init vr1000_map_io(void)
 {
+	s3c24xx_init_io(vr1000_iodesc, ARRAY_SIZE(vr1000_iodesc));
+}
+
+static void __init vr1000_init_early(void)
+{
 	/* initialise clock sources */
 =

 	s3c24xx_dclk0.parent =3D &clk_upll;
@@ -379,7 +384,7 @@ static void __init vr1000_map_io(void)
 =

 	pm_power_off =3D vr1000_power_off;
 =

-	s3c24xx_init_io(vr1000_iodesc, ARRAY_SIZE(vr1000_iodesc));
+	s3c_init_early();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(vr1000_uartcfgs, ARRAY_SIZE(vr1000_uartcfgs));
 }
@@ -402,6 +407,7 @@ MACHINE_START(VR1000, "Thorcom-VR1000")
 	/* Maintainer: Ben Dooks <ben-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D vr1000_map_io,
+	.init_early	=3D vr1000_init_early,
 	.init_machine	=3D vr1000_init,
 	.init_irq	=3D s3c24xx_init_irq,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2410/s3c2410.c b/arch/arm/mach-s3c2410/s3c241=
0.c
index f1d3bd8..b33a795 100644
--- a/arch/arm/mach-s3c2410/s3c2410.c
+++ b/arch/arm/mach-s3c2410/s3c2410.c
@@ -72,10 +72,13 @@ void __init s3c2410_init_uarts(struct s3c2410_uartcfg *=
cfg, int no)
 =

 void __init s3c2410_map_io(void)
 {
+	iotable_init(s3c2410_iodesc, ARRAY_SIZE(s3c2410_iodesc));
+}
+
+void __init s3c2410_init_early(void)
+{
 	s3c24xx_gpiocfg_default.set_pull =3D s3c_gpio_setpull_1up;
 	s3c24xx_gpiocfg_default.get_pull =3D s3c_gpio_getpull_1up;
-
-	iotable_init(s3c2410_iodesc, ARRAY_SIZE(s3c2410_iodesc));
 }
 =

 void __init_or_cpufreq s3c2410_setup_clocks(void)
diff --git a/arch/arm/mach-s3c2412/mach-jive.c b/arch/arm/mach-s3c2412/mach=
-jive.c
index 85dcaeb..86c0028 100644
--- a/arch/arm/mach-s3c2412/mach-jive.c
+++ b/arch/arm/mach-s3c2412/mach-jive.c
@@ -516,6 +516,11 @@ static struct syscore_ops jive_pm_syscore_ops =3D {
 static void __init jive_map_io(void)
 {
 	s3c24xx_init_io(jive_iodesc, ARRAY_SIZE(jive_iodesc));
+}
+
+static void __init jive_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(jive_uartcfgs, ARRAY_SIZE(jive_uartcfgs));
 }
@@ -670,8 +675,9 @@ MACHINE_START(JIVE, "JIVE")
 	/* Maintainer: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 =

-	.init_irq	=3D s3c24xx_init_irq,
 	.map_io		=3D jive_map_io,
+	.init_early	=3D jive_init_early,
+	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D jive_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c2412/mach-smdk2413.c b/arch/arm/mach-s3c2412/=
mach-smdk2413.c
index 834cfb6..1600356 100644
--- a/arch/arm/mach-s3c2412/mach-smdk2413.c
+++ b/arch/arm/mach-s3c2412/mach-smdk2413.c
@@ -92,8 +92,7 @@ static struct platform_device *smdk2413_devices[] __initd=
ata =3D {
 	&s3c_device_usbgadget,
 };
 =

-static void __init smdk2413_fixup(struct machine_desc *desc,
-				  struct tag *tags, char **cmdline,
+static void __init smdk2413_fixup(struct tag *tags, char **cmdline,
 				  struct meminfo *mi)
 {
 	if (tags !=3D phys_to_virt(S3C2410_SDRAM_PA + 0x100)) {
@@ -106,6 +105,11 @@ static void __init smdk2413_fixup(struct machine_desc =
*desc,
 static void __init smdk2413_map_io(void)
 {
 	s3c24xx_init_io(smdk2413_iodesc, ARRAY_SIZE(smdk2413_iodesc));
+}
+
+static void __init smdk2413_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2413_uartcfgs, ARRAY_SIZE(smdk2413_uartcfgs));
 }
@@ -131,8 +135,9 @@ MACHINE_START(S3C2413, "S3C2413")
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 =

 	.fixup		=3D smdk2413_fixup,
-	.init_irq	=3D s3c24xx_init_irq,
 	.map_io		=3D smdk2413_map_io,
+	.init_early	=3D smdk2413_init_early,
+	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D smdk2413_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
@@ -142,8 +147,9 @@ MACHINE_START(SMDK2412, "SMDK2412")
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 =

 	.fixup		=3D smdk2413_fixup,
-	.init_irq	=3D s3c24xx_init_irq,
 	.map_io		=3D smdk2413_map_io,
+	.init_early	=3D smdk2413_init_early,
+	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D smdk2413_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
@@ -153,8 +159,9 @@ MACHINE_START(SMDK2413, "SMDK2413")
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 =

 	.fixup		=3D smdk2413_fixup,
-	.init_irq	=3D s3c24xx_init_irq,
 	.map_io		=3D smdk2413_map_io,
+	.init_early	=3D smdk2413_init_early,
+	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D smdk2413_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c2412/mach-vstms.c b/arch/arm/mach-s3c2412/mac=
h-vstms.c
index 83544eb..f05f4a4 100644
--- a/arch/arm/mach-s3c2412/mach-vstms.c
+++ b/arch/arm/mach-s3c2412/mach-vstms.c
@@ -129,9 +129,8 @@ static struct platform_device *vstms_devices[] __initda=
ta =3D {
 	&s3c_device_nand,
 };
 =

-static void __init vstms_fixup(struct machine_desc *desc,
-				  struct tag *tags, char **cmdline,
-				  struct meminfo *mi)
+static void __init vstms_fixup(struct tag *tags, char **cmdline,
+			       struct meminfo *mi)
 {
 	if (tags !=3D phys_to_virt(S3C2410_SDRAM_PA + 0x100)) {
 		mi->nr_banks=3D1;
@@ -143,6 +142,11 @@ static void __init vstms_fixup(struct machine_desc *de=
sc,
 static void __init vstms_map_io(void)
 {
 	s3c24xx_init_io(vstms_iodesc, ARRAY_SIZE(vstms_iodesc));
+}
+
+static void __init vstms_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(vstms_uartcfgs, ARRAY_SIZE(vstms_uartcfgs));
 }
@@ -159,8 +163,9 @@ MACHINE_START(VSTMS, "VSTMS")
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 =

 	.fixup		=3D vstms_fixup,
+	.map_io		=3D vstms_map_io,
+	.init_early	=3D vstms_init_early,
 	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D vstms_init,
-	.map_io		=3D vstms_map_io,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c2412/s3c2412.c b/arch/arm/mach-s3c2412/s3c241=
2.c
index ef0958d..1704cda 100644
--- a/arch/arm/mach-s3c2412/s3c2412.c
+++ b/arch/arm/mach-s3c2412/s3c2412.c
@@ -156,6 +156,13 @@ static void s3c2412_hard_reset(void)
 =

 void __init s3c2412_map_io(void)
 {
+	/* register our io-tables */
+
+	iotable_init(s3c2412_iodesc, ARRAY_SIZE(s3c2412_iodesc));
+}
+
+void __init s3c2412_init_early(void)
+{
 	/* move base of IO */
 =

 	s3c2412_init_gpio2();
@@ -167,10 +174,6 @@ void __init s3c2412_map_io(void)
 	/* set custom reset hook */
 =

 	s3c24xx_reset_hook =3D s3c2412_hard_reset;
-
-	/* register our io-tables */
-
-	iotable_init(s3c2412_iodesc, ARRAY_SIZE(s3c2412_iodesc));
 }
 =

 void __init_or_cpufreq s3c2412_setup_clocks(void)
diff --git a/arch/arm/mach-s3c2416/mach-smdk2416.c b/arch/arm/mach-s3c2416/=
mach-smdk2416.c
index ac27ebb..2e540fb 100644
--- a/arch/arm/mach-s3c2416/mach-smdk2416.c
+++ b/arch/arm/mach-s3c2416/mach-smdk2416.c
@@ -216,6 +216,11 @@ static struct platform_device *smdk2416_devices[] __in=
itdata =3D {
 static void __init smdk2416_map_io(void)
 {
 	s3c24xx_init_io(smdk2416_iodesc, ARRAY_SIZE(smdk2416_iodesc));
+}
+
+static void __init smdk2416_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2416_uartcfgs, ARRAY_SIZE(smdk2416_uartcfgs));
 }
@@ -247,8 +252,9 @@ MACHINE_START(SMDK2416, "SMDK2416")
 	/* Maintainer: Yauhen Kharuzhy <jekhor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 =

-	.init_irq	=3D s3c24xx_init_irq,
 	.map_io		=3D smdk2416_map_io,
+	.init_early	=3D smdk2416_init_early,
+	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D smdk2416_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c2416/s3c2416.c b/arch/arm/mach-s3c2416/s3c241=
6.c
index 494ce91..9e641d4 100644
--- a/arch/arm/mach-s3c2416/s3c2416.c
+++ b/arch/arm/mach-s3c2416/s3c2416.c
@@ -118,14 +118,17 @@ void __init s3c2416_init_uarts(struct s3c2410_uartcfg=
 *cfg, int no)
 =

 void __init s3c2416_map_io(void)
 {
+	iotable_init(s3c2416_iodesc, ARRAY_SIZE(s3c2416_iodesc));
+}
+
+void __init s3c2416_init_early(void)
+{
 	s3c24xx_gpiocfg_default.set_pull =3D s3c_gpio_setpull_updown;
 	s3c24xx_gpiocfg_default.get_pull =3D s3c_gpio_getpull_updown;
 =

 	/* initialize device information early */
 	s3c2416_default_sdhci0();
 	s3c2416_default_sdhci1();
-
-	iotable_init(s3c2416_iodesc, ARRAY_SIZE(s3c2416_iodesc));
 }
 =

 /* need to register class before we actually register the device, and
diff --git a/arch/arm/mach-s3c2440/mach-anubis.c b/arch/arm/mach-s3c2440/ma=
ch-anubis.c
index d708678..1fe84849 100644
--- a/arch/arm/mach-s3c2440/mach-anubis.c
+++ b/arch/arm/mach-s3c2440/mach-anubis.c
@@ -451,6 +451,11 @@ static struct s3c24xx_audio_simtec_pdata __initdata an=
ubis_audio =3D {
 =

 static void __init anubis_map_io(void)
 {
+	s3c24xx_init_io(anubis_iodesc, ARRAY_SIZE(anubis_iodesc));
+}
+
+static void __init anubis_init_early(void)
+{
 	/* initialise the clocks */
 =

 	s3c24xx_dclk0.parent =3D &clk_upll;
@@ -466,7 +471,7 @@ static void __init anubis_map_io(void)
 =

 	s3c24xx_register_clocks(anubis_clocks, ARRAY_SIZE(anubis_clocks));
 =

-	s3c24xx_init_io(anubis_iodesc, ARRAY_SIZE(anubis_iodesc));
+	s3c_init_early();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(anubis_uartcfgs, ARRAY_SIZE(anubis_uartcfgs));
 =

@@ -500,6 +505,7 @@ MACHINE_START(ANUBIS, "Simtec-Anubis")
 	/* Maintainer: Ben Dooks <ben-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D anubis_map_io,
+	.init_early	=3D anubis_init_early,
 	.init_machine	=3D anubis_init,
 	.init_irq	=3D s3c24xx_init_irq,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2440/mach-at2440evb.c b/arch/arm/mach-s3c2440=
/mach-at2440evb.c
index 6c98b78..d2512fd 100644
--- a/arch/arm/mach-s3c2440/mach-at2440evb.c
+++ b/arch/arm/mach-s3c2440/mach-at2440evb.c
@@ -217,6 +217,11 @@ static struct platform_device *at2440evb_devices[] __i=
nitdata =3D {
 static void __init at2440evb_map_io(void)
 {
 	s3c24xx_init_io(at2440evb_iodesc, ARRAY_SIZE(at2440evb_iodesc));
+}
+
+static void __init at2440evb_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(16934400);
 	s3c24xx_init_uarts(at2440evb_uartcfgs, ARRAY_SIZE(at2440evb_uartcfgs));
 }
@@ -235,6 +240,7 @@ static void __init at2440evb_init(void)
 MACHINE_START(AT2440EVB, "AT2440EVB")
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D at2440evb_map_io,
+	.init_early	=3D at2440evb_init_early,
 	.init_machine	=3D at2440evb_init,
 	.init_irq	=3D s3c24xx_init_irq,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2440/mach-gta02.c b/arch/arm/mach-s3c2440/mac=
h-gta02.c
index 7166620..9638e4c 100644
--- a/arch/arm/mach-s3c2440/mach-gta02.c
+++ b/arch/arm/mach-s3c2440/mach-gta02.c
@@ -509,6 +509,11 @@ static struct platform_device gta02_buttons_device =3D=
 {
 static void __init gta02_map_io(void)
 {
 	s3c24xx_init_io(gta02_iodesc, ARRAY_SIZE(gta02_iodesc));
+}
+
+static void __init gta02_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(gta02_uartcfgs, ARRAY_SIZE(gta02_uartcfgs));
 }
@@ -598,6 +603,7 @@ MACHINE_START(NEO1973_GTA02, "GTA02")
 	/* Maintainer: Nelson Castillo <arhuaco-pI7LgTZv5U2z2LnJBvBa6V6hYfS7NtTn@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D gta02_map_io,
+	.init_early	=3D gta02_init_early,
 	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D gta02_machine_init,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2440/mach-mini2440.c b/arch/arm/mach-s3c2440/=
mach-mini2440.c
index dd3120d..dffa92b 100644
--- a/arch/arm/mach-s3c2440/mach-mini2440.c
+++ b/arch/arm/mach-s3c2440/mach-mini2440.c
@@ -516,6 +516,11 @@ static struct platform_device *mini2440_devices[] __in=
itdata =3D {
 static void __init mini2440_map_io(void)
 {
 	s3c24xx_init_io(mini2440_iodesc, ARRAY_SIZE(mini2440_iodesc));
+}
+
+static void __init mini2440_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(mini2440_uartcfgs, ARRAY_SIZE(mini2440_uartcfgs));
 }
@@ -678,7 +683,8 @@ MACHINE_START(MINI2440, "MINI2440")
 	/* Maintainer: Michel Pollet <buserror-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D mini2440_map_io,
-	.init_machine	=3D mini2440_init,
+	.init_early	=3D mini2440_init_early,
 	.init_irq	=3D s3c24xx_init_irq,
+	.init_machine	=3D mini2440_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c2440/mach-nexcoder.c b/arch/arm/mach-s3c2440/=
mach-nexcoder.c
index 37dd306..07a2698 100644
--- a/arch/arm/mach-s3c2440/mach-nexcoder.c
+++ b/arch/arm/mach-s3c2440/mach-nexcoder.c
@@ -137,6 +137,11 @@ static void __init nexcoder_sensorboard_init(void)
 static void __init nexcoder_map_io(void)
 {
 	s3c24xx_init_io(nexcoder_iodesc, ARRAY_SIZE(nexcoder_iodesc));
+}
+
+static void __init nexcoder_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(nexcoder_uartcfgs, ARRAY_SIZE(nexcoder_uartcfgs));
 =

@@ -153,6 +158,7 @@ MACHINE_START(NEXCODER_2440, "NexVision - Nexcoder 2440=
")
 	/* Maintainer: Guillaume GOURAT <guillaume.gourat-SG84m9Bk/uxjrEqMGRc/AA@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D nexcoder_map_io,
+	.init_early	=3D nexcoder_init_early,
 	.init_machine	=3D nexcoder_init,
 	.init_irq	=3D s3c24xx_init_irq,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2440/mach-osiris.c b/arch/arm/mach-s3c2440/ma=
ch-osiris.c
index d885363..80370cc 100644
--- a/arch/arm/mach-s3c2440/mach-osiris.c
+++ b/arch/arm/mach-s3c2440/mach-osiris.c
@@ -390,6 +390,11 @@ static struct s3c_cpufreq_board __initdata osiris_cpuf=
req =3D {
 =

 static void __init osiris_map_io(void)
 {
+	s3c24xx_init_io(osiris_iodesc, ARRAY_SIZE(osiris_iodesc));
+}
+
+static void __init osiris_init_early(void)
+{
 	unsigned long flags;
 =

 	/* initialise the clocks */
@@ -407,7 +412,7 @@ static void __init osiris_map_io(void)
 =

 	s3c24xx_register_clocks(osiris_clocks, ARRAY_SIZE(osiris_clocks));
 =

-	s3c24xx_init_io(osiris_iodesc, ARRAY_SIZE(osiris_iodesc));
+	s3c_init_early();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(osiris_uartcfgs, ARRAY_SIZE(osiris_uartcfgs));
 =

@@ -449,6 +454,7 @@ MACHINE_START(OSIRIS, "Simtec-OSIRIS")
 	/* Maintainer: Ben Dooks <ben-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 	.map_io		=3D osiris_map_io,
+	.init_early	=3D osiris_init_early,
 	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D osiris_init,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2440/mach-rx1950.c b/arch/arm/mach-s3c2440/ma=
ch-rx1950.c
index 27ea950..27fcac0 100644
--- a/arch/arm/mach-s3c2440/mach-rx1950.c
+++ b/arch/arm/mach-s3c2440/mach-rx1950.c
@@ -750,12 +750,17 @@ static struct clk *rx1950_clocks[] __initdata =3D {
 =

 static void __init rx1950_map_io(void)
 {
+	s3c24xx_init_io(rx1950_iodesc, ARRAY_SIZE(rx1950_iodesc));
+}
+
+static void __init rx1950_init_early(void)
+{
 	s3c24xx_clkout0.parent  =3D &clk_h;
 	s3c24xx_clkout1.parent  =3D &clk_f;
 =

 	s3c24xx_register_clocks(rx1950_clocks, ARRAY_SIZE(rx1950_clocks));
 =

-	s3c24xx_init_io(rx1950_iodesc, ARRAY_SIZE(rx1950_iodesc));
+	s3c_init_early();
 	s3c24xx_init_clocks(16934000);
 	s3c24xx_init_uarts(rx1950_uartcfgs, ARRAY_SIZE(rx1950_uartcfgs));
 =

@@ -826,8 +831,9 @@ static void __init rx1950_reserve(void)
 MACHINE_START(RX1950, "HP iPAQ RX1950")
     /* Maintainers: Vasily Khoruzhick */
 	.boot_params =3D S3C2410_SDRAM_PA + 0x100,
+	.reserve =3D rx1950_reserve,
 	.map_io =3D rx1950_map_io,
-	.reserve	=3D rx1950_reserve,
+	.init_early =3D rx1950_init_early,
 	.init_irq =3D s3c24xx_init_irq,
 	.init_machine =3D rx1950_init_machine,
 	.timer =3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2440/mach-rx3715.c b/arch/arm/mach-s3c2440/ma=
ch-rx3715.c
index 1472b1a..e3d5825 100644
--- a/arch/arm/mach-s3c2440/mach-rx3715.c
+++ b/arch/arm/mach-s3c2440/mach-rx3715.c
@@ -188,6 +188,11 @@ static struct platform_device *rx3715_devices[] __init=
data =3D {
 static void __init rx3715_map_io(void)
 {
 	s3c24xx_init_io(rx3715_iodesc, ARRAY_SIZE(rx3715_iodesc));
+}
+
+static void __init rx3715_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(16934000);
 	s3c24xx_init_uarts(rx3715_uartcfgs, ARRAY_SIZE(rx3715_uartcfgs));
 }
@@ -219,8 +224,9 @@ static void __init rx3715_init_machine(void)
 MACHINE_START(RX3715, "IPAQ-RX3715")
 	/* Maintainer: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
-	.map_io		=3D rx3715_map_io,
 	.reserve	=3D rx3715_reserve,
+	.map_io		=3D rx3715_map_io,
+	.init_early	=3D rx3715_init_early,
 	.init_irq	=3D rx3715_init_irq,
 	.init_machine	=3D rx3715_init_machine,
 	.timer		=3D &s3c24xx_timer,
diff --git a/arch/arm/mach-s3c2440/mach-smdk2440.c b/arch/arm/mach-s3c2440/=
mach-smdk2440.c
index eedfe0f..e7c3aee 100644
--- a/arch/arm/mach-s3c2440/mach-smdk2440.c
+++ b/arch/arm/mach-s3c2440/mach-smdk2440.c
@@ -160,6 +160,11 @@ static struct platform_device *smdk2440_devices[] __in=
itdata =3D {
 static void __init smdk2440_map_io(void)
 {
 	s3c24xx_init_io(smdk2440_iodesc, ARRAY_SIZE(smdk2440_iodesc));
+}
+
+static void __init smdk2440_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(16934400);
 	s3c24xx_init_uarts(smdk2440_uartcfgs, ARRAY_SIZE(smdk2440_uartcfgs));
 }
@@ -177,8 +182,9 @@ MACHINE_START(S3C2440, "SMDK2440")
 	/* Maintainer: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 =

-	.init_irq	=3D s3c24xx_init_irq,
 	.map_io		=3D smdk2440_map_io,
+	.init_early	=3D smdk2440_init_early,
+	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D smdk2440_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c2440/s3c244x.c b/arch/arm/mach-s3c2440/s3c244=
x.c
index 7e8a23d..51079de 100644
--- a/arch/arm/mach-s3c2440/s3c244x.c
+++ b/arch/arm/mach-s3c2440/s3c244x.c
@@ -65,7 +65,10 @@ void __init s3c244x_map_io(void)
 	/* register our io-tables */
 =

 	iotable_init(s3c244x_iodesc, ARRAY_SIZE(s3c244x_iodesc));
+}
 =

+void __init s3c244x_init_early(void)
+{
 	/* rename any peripherals used differing from the s3c2410 */
 =

 	s3c_device_sdi.name  =3D "s3c2440-sdi";
diff --git a/arch/arm/mach-s3c2443/mach-smdk2443.c b/arch/arm/mach-s3c2443/=
mach-smdk2443.c
index 514275e..e488490 100644
--- a/arch/arm/mach-s3c2443/mach-smdk2443.c
+++ b/arch/arm/mach-s3c2443/mach-smdk2443.c
@@ -121,6 +121,11 @@ static struct platform_device *smdk2443_devices[] __in=
itdata =3D {
 static void __init smdk2443_map_io(void)
 {
 	s3c24xx_init_io(smdk2443_iodesc, ARRAY_SIZE(smdk2443_iodesc));
+}
+
+static void __init smdk2443_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2443_uartcfgs, ARRAY_SIZE(smdk2443_uartcfgs));
 }
@@ -141,8 +146,9 @@ MACHINE_START(SMDK2443, "SMDK2443")
 	/* Maintainer: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> */
 	.boot_params	=3D S3C2410_SDRAM_PA + 0x100,
 =

-	.init_irq	=3D s3c24xx_init_irq,
 	.map_io		=3D smdk2443_map_io,
+	.init_early	=3D smdk2443_init_early,
+	.init_irq	=3D s3c24xx_init_irq,
 	.init_machine	=3D smdk2443_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/cpu.c b/arch/arm/mach-s3c64xx/cpu.c
index 374e45e..7ea1014 100644
--- a/arch/arm/mach-s3c64xx/cpu.c
+++ b/arch/arm/mach-s3c64xx/cpu.c
@@ -45,7 +45,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 	{
 		.idcode		=3D 0x36400000,
 		.idmask		=3D 0xfffff000,
-		.map_io		=3D s3c6400_map_io,
+		.init_early	=3D s3c6400_init_early,
 		.init_clocks	=3D s3c6400_init_clocks,
 		.init_uarts	=3D s3c6400_init_uarts,
 		.init		=3D s3c6400_init,
@@ -53,7 +53,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 	}, {
 		.idcode		=3D 0x36410100,
 		.idmask		=3D 0xffffff00,
-		.map_io		=3D s3c6410_map_io,
+		.init_early	=3D s3c6410_init_early,
 		.init_clocks	=3D s3c6410_init_clocks,
 		.init_uarts	=3D s3c6410_init_uarts,
 		.init		=3D s3c6410_init,
diff --git a/arch/arm/mach-s3c64xx/include/mach/s3c6400.h b/arch/arm/mach-s=
3c64xx/include/mach/s3c6400.h
index f86958d..be18bc2 100644
--- a/arch/arm/mach-s3c64xx/include/mach/s3c6400.h
+++ b/arch/arm/mach-s3c64xx/include/mach/s3c6400.h
@@ -22,15 +22,15 @@ extern void s3c64xx_register_clocks(unsigned long xtal,=
 unsigned armclk_limit);
 #ifdef CONFIG_CPU_S3C6400
 =

 extern  int s3c6400_init(void);
+extern void s3c6400_init_early(void);
 extern void s3c6400_init_irq(void);
-extern void s3c6400_map_io(void);
 extern void s3c6400_init_clocks(int xtal);
 =

 #define s3c6400_init_uarts s3c6400_common_init_uarts
 =

 #else
+#define s3c6400_init_early NULL
 #define s3c6400_init_clocks NULL
 #define s3c6400_init_uarts NULL
-#define s3c6400_map_io NULL
 #define s3c6400_init NULL
 #endif
diff --git a/arch/arm/mach-s3c64xx/include/mach/s3c6410.h b/arch/arm/mach-s=
3c64xx/include/mach/s3c6410.h
index 24f1141..23df174 100644
--- a/arch/arm/mach-s3c64xx/include/mach/s3c6410.h
+++ b/arch/arm/mach-s3c64xx/include/mach/s3c6410.h
@@ -15,15 +15,15 @@
 #ifdef CONFIG_CPU_S3C6410
 =

 extern  int s3c6410_init(void);
+extern void s3c6410_init_early(void);
 extern void s3c6410_init_irq(void);
-extern void s3c6410_map_io(void);
 extern void s3c6410_init_clocks(int xtal);
 =

 #define s3c6410_init_uarts s3c6400_common_init_uarts
 =

 #else
+#define s3c6410_init_early NULL
 #define s3c6410_init_clocks NULL
 #define s3c6410_init_uarts NULL
-#define s3c6410_map_io NULL
 #define s3c6410_init NULL
 #endif
diff --git a/arch/arm/mach-s3c64xx/mach-anw6410.c b/arch/arm/mach-s3c64xx/m=
ach-anw6410.c
index a53cf14..5c7ed76 100644
--- a/arch/arm/mach-s3c64xx/mach-anw6410.c
+++ b/arch/arm/mach-s3c64xx/mach-anw6410.c
@@ -213,6 +213,11 @@ static struct platform_device *anw6410_devices[] __ini=
tdata =3D {
 static void __init anw6410_map_io(void)
 {
 	s3c64xx_init_io(anw6410_iodesc, ARRAY_SIZE(anw6410_iodesc));
+}
+
+static void __init anw6410_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(anw6410_uartcfgs, ARRAY_SIZE(anw6410_uartcfgs));
 =

@@ -235,8 +240,9 @@ MACHINE_START(ANW6410, "A&W6410")
 	/* Maintainer: Kwangwoo Lee <kwangwoo.lee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> */
 	.boot_params	=3D S3C64XX_PA_SDRAM + 0x100,
 =

-	.init_irq	=3D s3c6410_init_irq,
 	.map_io		=3D anw6410_map_io,
+	.init_early	=3D anw6410_init_early,
+	.init_irq	=3D s3c6410_init_irq,
 	.init_machine	=3D anw6410_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-hmt.c b/arch/arm/mach-s3c64xx/mach-=
hmt.c
index b263958..aaaaa5e 100644
--- a/arch/arm/mach-s3c64xx/mach-hmt.c
+++ b/arch/arm/mach-s3c64xx/mach-hmt.c
@@ -241,6 +241,11 @@ static struct platform_device *hmt_devices[] __initdat=
a =3D {
 static void __init hmt_map_io(void)
 {
 	s3c64xx_init_io(hmt_iodesc, ARRAY_SIZE(hmt_iodesc));
+}
+
+static void __init hmt_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(hmt_uartcfgs, ARRAY_SIZE(hmt_uartcfgs));
 }
@@ -266,8 +271,9 @@ static void __init hmt_machine_init(void)
 MACHINE_START(HMT, "Airgoo-HMT")
 	/* Maintainer: Peter Korsgaard <jacmet-OfajU3CKLf1/SzgSGea1oA@public.gmane.org> */
 	.boot_params	=3D S3C64XX_PA_SDRAM + 0x100,
-	.init_irq	=3D s3c6410_init_irq,
 	.map_io		=3D hmt_map_io,
+	.init_early	=3D hmt_init_early,
+	.init_irq	=3D s3c6410_init_irq,
 	.init_machine	=3D hmt_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-mini6410.c b/arch/arm/mach-s3c64xx/=
mach-mini6410.c
index 89f35e0..5e0d3d6 100644
--- a/arch/arm/mach-s3c64xx/mach-mini6410.c
+++ b/arch/arm/mach-s3c64xx/mach-mini6410.c
@@ -225,9 +225,14 @@ static struct platform_device *mini6410_devices[] __in=
itdata =3D {
 =

 static void __init mini6410_map_io(void)
 {
+	s3c64xx_init_io(NULL, 0);
+}
+
+static void __init mini6410_init_early(void)
+{
 	u32 tmp;
 =

-	s3c64xx_init_io(NULL, 0);
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(mini6410_uartcfgs, ARRAY_SIZE(mini6410_uartcfgs));
 =

@@ -350,8 +355,9 @@ static void __init mini6410_machine_init(void)
 MACHINE_START(MINI6410, "MINI6410")
 	/* Maintainer: Darius Augulis <augulis.darius-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> */
 	.boot_params	=3D S3C64XX_PA_SDRAM + 0x100,
-	.init_irq	=3D s3c6410_init_irq,
 	.map_io		=3D mini6410_map_io,
+	.init_early	=3D mini6410_init_early,
+	.init_irq	=3D s3c6410_init_irq,
 	.init_machine	=3D mini6410_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-ncp.c b/arch/arm/mach-s3c64xx/mach-=
ncp.c
index c498649..f00a136 100644
--- a/arch/arm/mach-s3c64xx/mach-ncp.c
+++ b/arch/arm/mach-s3c64xx/mach-ncp.c
@@ -84,6 +84,11 @@ static struct map_desc ncp_iodesc[] __initdata =3D {};
 static void __init ncp_map_io(void)
 {
 	s3c64xx_init_io(ncp_iodesc, ARRAY_SIZE(ncp_iodesc));
+}
+
+static void __init ncp_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(ncp_uartcfgs, ARRAY_SIZE(ncp_uartcfgs));
 }
@@ -98,8 +103,9 @@ static void __init ncp_machine_init(void)
 MACHINE_START(NCP, "NCP")
 	/* Maintainer: Samsung Electronics */
 	.boot_params	=3D S3C64XX_PA_SDRAM + 0x100,
-	.init_irq	=3D s3c6410_init_irq,
 	.map_io		=3D ncp_map_io,
+	.init_early	=3D ncp_init_early,
+	.init_irq	=3D s3c6410_init_irq,
 	.init_machine	=3D ncp_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-real6410.c b/arch/arm/mach-s3c64xx/=
mach-real6410.c
index 4957ab0..b722fd8 100644
--- a/arch/arm/mach-s3c64xx/mach-real6410.c
+++ b/arch/arm/mach-s3c64xx/mach-real6410.c
@@ -206,9 +206,14 @@ static struct s3c2410_ts_mach_info s3c_ts_platform __i=
nitdata =3D {
 =

 static void __init real6410_map_io(void)
 {
+	s3c64xx_init_io(NULL, 0);
+}
+
+static void __init real6410_init_early(void)
+{
 	u32 tmp;
 =

-	s3c64xx_init_io(NULL, 0);
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(real6410_uartcfgs, ARRAY_SIZE(real6410_uartcfgs));
 =

@@ -331,8 +336,9 @@ MACHINE_START(REAL6410, "REAL6410")
 	/* Maintainer: Darius Augulis <augulis.darius-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> */
 	.boot_params	=3D S3C64XX_PA_SDRAM + 0x100,
 =

-	.init_irq	=3D s3c6410_init_irq,
 	.map_io		=3D real6410_map_io,
+	.init_early	=3D real6410_init_early,
+	.init_irq	=3D s3c6410_init_irq,
 	.init_machine	=3D real6410_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64xx/ma=
ch-smartq.c
index cb1ebeb..1c05c4e 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -372,6 +372,11 @@ static struct map_desc smartq_iodesc[] __initdata =3D =
{};
 void __init smartq_map_io(void)
 {
 	s3c64xx_init_io(smartq_iodesc, ARRAY_SIZE(smartq_iodesc));
+}
+
+void __init smartq_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smartq_uartcfgs, ARRAY_SIZE(smartq_uartcfgs));
 =

diff --git a/arch/arm/mach-s3c64xx/mach-smartq.h b/arch/arm/mach-s3c64xx/ma=
ch-smartq.h
index 8e8b693..3d1c73a 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.h
+++ b/arch/arm/mach-s3c64xx/mach-smartq.h
@@ -15,6 +15,7 @@
 #include <linux/init.h>
 =

 extern void __init smartq_map_io(void);
+extern void __init smartq_init_early(void);
 extern void __init smartq_machine_init(void);
 =

 #endif /* __MACH_SMARTQ_H */
diff --git a/arch/arm/mach-s3c64xx/mach-smartq5.c b/arch/arm/mach-s3c64xx/m=
ach-smartq5.c
index 3a3e5ac..884aecd 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq5.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq5.c
@@ -147,8 +147,9 @@ static void __init smartq5_machine_init(void)
 MACHINE_START(SMARTQ5, "SmartQ 5")
 	/* Maintainer: Maurus Cuelenaere <mcuelenaere AT gmail DOT com> */
 	.boot_params	=3D S3C64XX_PA_SDRAM + 0x100,
-	.init_irq	=3D s3c6410_init_irq,
 	.map_io		=3D smartq_map_io,
+	.init_early	=3D smartq_init_early,
+	.init_irq	=3D s3c6410_init_irq,
 	.init_machine	=3D smartq5_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smartq7.c b/arch/arm/mach-s3c64xx/m=
ach-smartq7.c
index e653758..b8978ed 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq7.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq7.c
@@ -163,8 +163,9 @@ static void __init smartq7_machine_init(void)
 MACHINE_START(SMARTQ7, "SmartQ 7")
 	/* Maintainer: Maurus Cuelenaere <mcuelenaere AT gmail DOT com> */
 	.boot_params	=3D S3C64XX_PA_SDRAM + 0x100,
-	.init_irq	=3D s3c6410_init_irq,
 	.map_io		=3D smartq_map_io,
+	.init_early	=3D smartq_init_early,
+	.init_irq	=3D s3c6410_init_irq,
 	.init_machine	=3D smartq7_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6400.c b/arch/arm/mach-s3c64xx/=
mach-smdk6400.c
index 3cca642..2af88bc 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6400.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6400.c
@@ -63,6 +63,11 @@ static struct map_desc smdk6400_iodesc[] =3D {};
 static void __init smdk6400_map_io(void)
 {
 	s3c64xx_init_io(smdk6400_iodesc, ARRAY_SIZE(smdk6400_iodesc));
+}
+
+static void __init smdk6400_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk6400_uartcfgs, ARRAY_SIZE(smdk6400_uartcfgs));
 }
@@ -87,8 +92,9 @@ MACHINE_START(SMDK6400, "SMDK6400")
 	/* Maintainer: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> */
 	.boot_params	=3D S3C64XX_PA_SDRAM + 0x100,
 =

-	.init_irq	=3D s3c6400_init_irq,
 	.map_io		=3D smdk6400_map_io,
+	.init_early	=3D smdk6400_init_early,
+	.init_irq	=3D s3c6400_init_irq,
 	.init_machine	=3D smdk6400_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/=
mach-smdk6410.c
index 2c0353a..efcd691 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -681,9 +681,14 @@ static struct s3c2410_ts_mach_info s3c_ts_platform __i=
nitdata =3D {
 =

 static void __init smdk6410_map_io(void)
 {
+	s3c64xx_init_io(smdk6410_iodesc, ARRAY_SIZE(smdk6410_iodesc));
+}
+
+static void __init smdk6410_init_early(void)
+{
 	u32 tmp;
 =

-	s3c64xx_init_io(smdk6410_iodesc, ARRAY_SIZE(smdk6410_iodesc));
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk6410_uartcfgs, ARRAY_SIZE(smdk6410_uartcfgs));
 =

@@ -747,8 +752,9 @@ MACHINE_START(SMDK6410, "SMDK6410")
 	/* Maintainer: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> */
 	.boot_params	=3D S3C64XX_PA_SDRAM + 0x100,
 =

-	.init_irq	=3D s3c6410_init_irq,
 	.map_io		=3D smdk6410_map_io,
+	.init_early	=3D smdk6410_init_early,
+	.init_irq	=3D s3c6410_init_irq,
 	.init_machine	=3D smdk6410_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/s3c6400.c b/arch/arm/mach-s3c64xx/s3c640=
0.c
index 5e93fe3..68c90c9 100644
--- a/arch/arm/mach-s3c64xx/s3c6400.c
+++ b/arch/arm/mach-s3c64xx/s3c6400.c
@@ -40,7 +40,7 @@
 #include <plat/onenand-core.h>
 #include <mach/s3c6400.h>
 =

-void __init s3c6400_map_io(void)
+void __init s3c6400_init_early(void)
 {
 	/* setup SDHCI */
 =

diff --git a/arch/arm/mach-s3c64xx/s3c6410.c b/arch/arm/mach-s3c64xx/s3c641=
0.c
index 312aa6b..47c464c 100644
--- a/arch/arm/mach-s3c64xx/s3c6410.c
+++ b/arch/arm/mach-s3c64xx/s3c6410.c
@@ -44,7 +44,7 @@
 #include <mach/s3c6400.h>
 #include <mach/s3c6410.h>
 =

-void __init s3c6410_map_io(void)
+void __init s3c6410_init_early(void)
 {
 	/* initialise device information early */
 	s3c6410_default_sdhci0();
diff --git a/arch/arm/mach-s5p64x0/cpu.c b/arch/arm/mach-s5p64x0/cpu.c
index a5c0095..2516453 100644
--- a/arch/arm/mach-s5p64x0/cpu.c
+++ b/arch/arm/mach-s5p64x0/cpu.c
@@ -106,22 +106,28 @@ static void s5p64x0_idle(void)
 =

 void __init s5p6440_map_io(void)
 {
-	/* initialize any device information early */
-	s3c_adc_setname("s3c64xx-adc");
-
 	iotable_init(s5p64x0_iodesc, ARRAY_SIZE(s5p64x0_iodesc));
 	iotable_init(s5p6440_iodesc, ARRAY_SIZE(s5p6440_iodesc));
 }
 =

-void __init s5p6450_map_io(void)
+void __init s5p6440_init_early(void)
 {
 	/* initialize any device information early */
 	s3c_adc_setname("s3c64xx-adc");
+}
 =

+void __init s5p6450_map_io(void)
+{
 	iotable_init(s5p64x0_iodesc, ARRAY_SIZE(s5p64x0_iodesc));
 	iotable_init(s5p6450_iodesc, ARRAY_SIZE(s5p6450_iodesc));
 }
 =

+void __init s5p6450_init_early(void)
+{
+	/* initialize any device information early */
+	s3c_adc_setname("s3c64xx-adc");
+}
+
 /*
  * s5p64x0_init_clocks
  *
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-s5p64x0/=
mach-smdk6440.c
index 2d559f1..e5a13d8 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
@@ -178,6 +178,11 @@ static struct s3c2410_ts_mach_info s3c_ts_platform __i=
nitdata =3D {
 static void __init smdk6440_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P64X0_SYS_ID);
+}
+
+static void __init smdk6440_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk6440_uartcfgs, ARRAY_SIZE(smdk6440_uartcfgs));
 	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
@@ -201,8 +206,9 @@ MACHINE_START(SMDK6440, "SMDK6440")
 	/* Maintainer: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	.boot_params	=3D S5P64X0_PA_SDRAM + 0x100,
 =

-	.init_irq	=3D s5p6440_init_irq,
 	.map_io		=3D smdk6440_map_io,
+	.init_early	=3D smdk6440_init_early,
+	.init_irq	=3D s5p6440_init_irq,
 	.init_machine	=3D smdk6440_machine_init,
 	.timer		=3D &s5p_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-s5p64x0/=
mach-smdk6450.c
index d19c469..c7af808 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
@@ -197,6 +197,11 @@ static struct s3c2410_ts_mach_info s3c_ts_platform __i=
nitdata =3D {
 static void __init smdk6450_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P64X0_SYS_ID);
+}
+
+static void __init smdk6450_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(19200000);
 	s3c24xx_init_uarts(smdk6450_uartcfgs, ARRAY_SIZE(smdk6450_uartcfgs));
 	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
@@ -220,8 +225,9 @@ MACHINE_START(SMDK6450, "SMDK6450")
 	/* Maintainer: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	.boot_params	=3D S5P64X0_PA_SDRAM + 0x100,
 =

-	.init_irq	=3D s5p6450_init_irq,
 	.map_io		=3D smdk6450_map_io,
+	.init_early	=3D smdk6450_init_early,
+	.init_irq	=3D s5p6450_init_irq,
 	.init_machine	=3D smdk6450_machine_init,
 	.timer		=3D &s5p_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s5pc100/cpu.c b/arch/arm/mach-s5pc100/cpu.c
index fd2708e..7d05916 100644
--- a/arch/arm/mach-s5pc100/cpu.c
+++ b/arch/arm/mach-s5pc100/cpu.c
@@ -108,7 +108,10 @@ static void s5pc100_idle(void)
 void __init s5pc100_map_io(void)
 {
 	iotable_init(s5pc100_iodesc, ARRAY_SIZE(s5pc100_iodesc));
+}
 =

+void __init s5pc100_init_early(void)
+{
 	/* initialise device information early */
 	s5pc100_default_sdhci0();
 	s5pc100_default_sdhci1();
diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/=
mach-smdkc100.c
index 0525cb3..c8db153 100644
--- a/arch/arm/mach-s5pc100/mach-smdkc100.c
+++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
@@ -252,6 +252,11 @@ static struct s3c2410_ts_mach_info s3c_ts_platform __i=
nitdata =3D {
 static void __init smdkc100_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+}
+
+static void __init smdkc100_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdkc100_uartcfgs, ARRAY_SIZE(smdkc100_uartcfgs));
 }
@@ -282,8 +287,9 @@ static void __init smdkc100_machine_init(void)
 MACHINE_START(SMDKC100, "SMDKC100")
 	/* Maintainer: Byungho Min <bhmin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	.boot_params	=3D S5P_PA_SDRAM + 0x100,
-	.init_irq	=3D s5pc100_init_irq,
 	.map_io		=3D smdkc100_map_io,
+	.init_early	=3D smdkc100_init_early,
+	.init_irq	=3D s5pc100_init_irq,
 	.init_machine	=3D smdkc100_machine_init,
 	.timer		=3D &s3c24xx_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 61e6c24..fc13f58 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -119,7 +119,10 @@ static void s5pv210_sw_reset(void)
 void __init s5pv210_map_io(void)
 {
 	iotable_init(s5pv210_iodesc, ARRAY_SIZE(s5pv210_iodesc));
+}
 =

+void __init s5pv210_init_early(void)
+{
 	/* initialise device information early */
 	s5pv210_default_sdhci0();
 	s5pv210_default_sdhci1();
diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/ma=
ch-aquila.c
index 4e1d8ff..384e52c 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -645,6 +645,11 @@ static void __init aquila_sound_init(void)
 static void __init aquila_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+}
+
+static void __init aquila_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(aquila_uartcfgs, ARRAY_SIZE(aquila_uartcfgs));
 	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
@@ -679,8 +684,9 @@ MACHINE_START(AQUILA, "Aquila")
 	   Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
 	   Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	.boot_params	=3D S5P_PA_SDRAM + 0x100,
-	.init_irq	=3D s5pv210_init_irq,
 	.map_io		=3D aquila_map_io,
+	.init_early	=3D aquila_init_early,
+	.init_irq	=3D s5pv210_init_irq,
 	.init_machine	=3D aquila_machine_init,
 	.timer		=3D &s5p_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach=
-goni.c
index 31d5aa7..e1e3e63 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -836,6 +836,11 @@ static void __init goni_sound_init(void)
 static void __init goni_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+}
+
+static void __init goni_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(goni_uartcfgs, ARRAY_SIZE(goni_uartcfgs));
 	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
@@ -889,8 +894,9 @@ static void __init goni_machine_init(void)
 MACHINE_START(GONI, "GONI")
 	/* Maintainers: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	.boot_params	=3D S5P_PA_SDRAM + 0x100,
-	.init_irq	=3D s5pv210_init_irq,
 	.map_io		=3D goni_map_io,
+	.init_early	=3D goni_init_early,
+	.init_irq	=3D s5pv210_init_irq,
 	.init_machine	=3D goni_machine_init,
 	.timer		=3D &s5p_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s5pv210/=
mach-smdkc110.c
index 6c412c8..f53ca24 100644
--- a/arch/arm/mach-s5pv210/mach-smdkc110.c
+++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
@@ -110,6 +110,11 @@ static struct i2c_board_info smdkc110_i2c_devs2[] __in=
itdata =3D {
 static void __init smdkc110_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+}
+
+static void __init smdkc110_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs));
 	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
@@ -137,8 +142,9 @@ static void __init smdkc110_machine_init(void)
 MACHINE_START(SMDKC110, "SMDKC110")
 	/* Maintainer: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	.boot_params	=3D S5P_PA_SDRAM + 0x100,
-	.init_irq	=3D s5pv210_init_irq,
 	.map_io		=3D smdkc110_map_io,
+	.init_early	=3D smdkc110_init_early,
+	.init_irq	=3D s5pv210_init_irq,
 	.init_machine	=3D smdkc110_machine_init,
 	.timer		=3D &s5p_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/=
mach-smdkv210.c
index c6a9e86..fdc73aa 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -313,6 +313,11 @@ static struct s3c2410_ts_mach_info s3c_ts_platform __i=
nitdata =3D {
 static void __init smdkv210_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+}
+
+static void __init smdkv210_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs));
 	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
@@ -347,8 +352,9 @@ static void __init smdkv210_machine_init(void)
 MACHINE_START(SMDKV210, "SMDKV210")
 	/* Maintainer: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
 	.boot_params	=3D S5P_PA_SDRAM + 0x100,
-	.init_irq	=3D s5pv210_init_irq,
 	.map_io		=3D smdkv210_map_io,
+	.init_early	=3D smdkv210_init_early,
+	.init_irq	=3D s5pv210_init_irq,
 	.init_machine	=3D smdkv210_machine_init,
 	.timer		=3D &s5p_timer,
 MACHINE_END
diff --git a/arch/arm/mach-s5pv210/mach-torbreck.c b/arch/arm/mach-s5pv210/=
mach-torbreck.c
index 925fc0d..2500d8a 100644
--- a/arch/arm/mach-s5pv210/mach-torbreck.c
+++ b/arch/arm/mach-s5pv210/mach-torbreck.c
@@ -103,6 +103,11 @@ static struct i2c_board_info torbreck_i2c_devs2[] __in=
itdata =3D {
 static void __init torbreck_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+}
+
+static void __init torbreck_init_early(void)
+{
+	s3c_init_early();
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(torbreck_uartcfgs, ARRAY_SIZE(torbreck_uartcfgs));
 	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
@@ -126,8 +131,9 @@ static void __init torbreck_machine_init(void)
 MACHINE_START(TORBRECK, "TORBRECK")
 	/* Maintainer: Hyunchul Ko <ghcstop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> */
 	.boot_params	=3D S5P_PA_SDRAM + 0x100,
-	.init_irq	=3D s5pv210_init_irq,
 	.map_io		=3D torbreck_map_io,
+	.init_early	=3D torbreck_init_early,
+	.init_irq	=3D s5pv210_init_irq,
 	.init_machine	=3D torbreck_machine_init,
 	.timer		=3D &s5p_timer,
 MACHINE_END
diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 5778274..2bc7c82 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -301,8 +301,7 @@ static void __init get_assabet_scr(void)
 }
 =

 static void __init
-fixup_assabet(struct machine_desc *desc, struct tag *tags,
-	      char **cmdline, struct meminfo *mi)
+fixup_assabet(struct tag *tags, char **cmdline, struct meminfo *mi)
 {
 	/* This must be done before any call to machine_has_neponset() */
 	map_sa1100_gpio_regs();
@@ -406,7 +405,10 @@ static void __init assabet_map_io(void)
 {
 	sa1100_map_io();
 	iotable_init(assabet_io_desc, ARRAY_SIZE(assabet_io_desc));
+}
 =

+static void __init assabet_init_early(void)
+{
 	/*
 	 * Set SUS bit in SDCR0 so serial port 1 functions.
 	 * Its called GPCLKR0 in my SA1110 manual.
@@ -450,6 +452,7 @@ MACHINE_START(ASSABET, "Intel-Assabet")
 	.boot_params	=3D 0xc0000100,
 	.fixup		=3D fixup_assabet,
 	.map_io		=3D assabet_map_io,
+	.init_early	=3D assabet_init_early,
 	.init_irq	=3D sa1100_init_irq,
 	.timer		=3D &sa1100_timer,
 	.init_machine	=3D assabet_init,
diff --git a/arch/arm/mach-sa1100/badge4.c b/arch/arm/mach-sa1100/badge4.c
index 4f19ff8..592a019 100644
--- a/arch/arm/mach-sa1100/badge4.c
+++ b/arch/arm/mach-sa1100/badge4.c
@@ -295,7 +295,10 @@ static void __init badge4_map_io(void)
 {
 	sa1100_map_io();
 	iotable_init(badge4_io_desc, ARRAY_SIZE(badge4_io_desc));
+}
 =

+static void __init badge4_init_early(void)
+{
 	sa1100_register_uart_fns(&badge4_port_fns);
 	sa1100_register_uart(0, 3);
 	sa1100_register_uart(1, 1);
@@ -304,6 +307,7 @@ static void __init badge4_map_io(void)
 MACHINE_START(BADGE4, "Hewlett-Packard Laboratories BadgePAD 4")
 	.boot_params	=3D 0xc0000100,
 	.map_io		=3D badge4_map_io,
+	.init_early	=3D badge4_init_early,
 	.init_irq	=3D sa1100_init_irq,
 	.timer		=3D &sa1100_timer,
 MACHINE_END
diff --git a/arch/arm/mach-sa1100/cerf.c b/arch/arm/mach-sa1100/cerf.c
index 7f3da4b..7813b4f 100644
--- a/arch/arm/mach-sa1100/cerf.c
+++ b/arch/arm/mach-sa1100/cerf.c
@@ -112,7 +112,10 @@ static void __init cerf_map_io(void)
 {
 	sa1100_map_io();
 	iotable_init(cerf_io_desc, ARRAY_SIZE(cerf_io_desc));
+}
 =

+static void __init cerf_init_early(void)
+{
 	sa1100_register_uart(0, 3);
 	sa1100_register_uart(1, 2); /* disable this and the uart2 device for sa11=
00_fir */
 	sa1100_register_uart(2, 1);
@@ -136,6 +139,7 @@ static void __init cerf_init(void)
 MACHINE_START(CERF, "Intrinsyc CerfBoard/CerfCube")
 	/* Maintainer: support-a2zIG6VkHR58UrSeD/g0lQ@public.gmane.org */
 	.map_io		=3D cerf_map_io,
+	.init_early	=3D cerf_init_early,
 	.init_irq	=3D cerf_init_irq,
 	.timer		=3D &sa1100_timer,
 	.init_machine	=3D cerf_init,
diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
index bd3e1bf..035bf29 100644
--- a/arch/arm/mach-sa1100/collie.c
+++ b/arch/arm/mach-sa1100/collie.c
@@ -373,7 +373,10 @@ static void __init collie_map_io(void)
 {
 	sa1100_map_io();
 	iotable_init(collie_io_desc, ARRAY_SIZE(collie_io_desc));
+}
 =

+static void __init collie_init_early(void)
+{
 #ifdef CONFIG_SHARP_LOCOMO
 	sa1100_register_uart_fns(&collie_port_fns);
 #endif
@@ -383,6 +386,7 @@ static void __init collie_map_io(void)
 =

 MACHINE_START(COLLIE, "Sharp-Collie")
 	.map_io		=3D collie_map_io,
+	.init_early	=3D collie_init_early,
 	.init_irq	=3D sa1100_init_irq,
 	.timer		=3D &sa1100_timer,
 	.init_machine	=3D collie_init,
diff --git a/arch/arm/mach-sa1100/h3100.c b/arch/arm/mach-sa1100/h3100.c
index 03d7376..8d08740 100644
--- a/arch/arm/mach-sa1100/h3100.c
+++ b/arch/arm/mach-sa1100/h3100.c
@@ -37,9 +37,9 @@ static void h3100_lcd_power(int enable)
 }
 =

 =

-static void __init h3100_map_io(void)
+static void __init h3100_init_early(void)
 {
-	h3xxx_map_io();
+	h3xxx_init_early();
 =

 	sa1100fb_lcd_power =3D h3100_lcd_power;
 =

@@ -85,7 +85,8 @@ static void __init h3100_mach_init(void)
 =

 MACHINE_START(H3100, "Compaq iPAQ H3100")
 	.boot_params	=3D 0xc0000100,
-	.map_io		=3D h3100_map_io,
+	.map_io		=3D h3xxx_map_io,
+	.init_early	=3D h3100_init_early,
 	.init_irq	=3D sa1100_init_irq,
 	.timer		=3D &sa1100_timer,
 	.init_machine	=3D h3100_mach_init,
diff --git a/arch/arm/mach-sa1100/h3600.c b/arch/arm/mach-sa1100/h3600.c
index 965f64a..d512453 100644
--- a/arch/arm/mach-sa1100/h3600.c
+++ b/arch/arm/mach-sa1100/h3600.c
@@ -56,10 +56,9 @@ err2:	gpio_free(H3XXX_EGPIO_LCD_ON);
 err1:	return;
 }
 =

-static void __init h3600_map_io(void)
+static void __init h3600_init_early(void)
 {
-	h3xxx_map_io();
-
+	h3xxx_init_early();
 	sa1100fb_lcd_power =3D h3600_lcd_power;
 }
 =

@@ -126,7 +125,8 @@ static void __init h3600_mach_init(void)
 =

 MACHINE_START(H3600, "Compaq iPAQ H3600")
 	.boot_params	=3D 0xc0000100,
-	.map_io		=3D h3600_map_io,
+	.map_io		=3D h3xxx_map_io,
+	.init_early	=3D h3600_init_early,
 	.init_irq	=3D sa1100_init_irq,
 	.timer		=3D &sa1100_timer,
 	.init_machine	=3D h3600_mach_init,
diff --git a/arch/arm/mach-sa1100/h3xxx.c b/arch/arm/mach-sa1100/h3xxx.c
index b0784c9..f638a01 100644
--- a/arch/arm/mach-sa1100/h3xxx.c
+++ b/arch/arm/mach-sa1100/h3xxx.c
@@ -294,7 +294,10 @@ void __init h3xxx_map_io(void)
 {
 	sa1100_map_io();
 	iotable_init(h3600_io_desc, ARRAY_SIZE(h3600_io_desc));
+}
 =

+void __init h3xxx_init_early(void)
+{
 	sa1100_register_uart(0, 3); /* Common serial port */
 //	sa1100_register_uart(1, 1); /* Microcontroller on 3100/3600 */
 =

diff --git a/arch/arm/mach-sa1100/hackkit.c b/arch/arm/mach-sa1100/hackkit.c
index db5e434..8712553 100644
--- a/arch/arm/mach-sa1100/hackkit.c
+++ b/arch/arm/mach-sa1100/hackkit.c
@@ -42,8 +42,6 @@
  */
 =

 /* init funcs */
-static void __init hackkit_map_io(void);
-
 static u_int hackkit_get_mctrl(struct uart_port *port);
 static void hackkit_set_mctrl(struct uart_port *port, u_int mctrl);
 static void hackkit_uart_pm(struct uart_port *port, u_int state, u_int old=
state);
@@ -79,7 +77,10 @@ static void __init hackkit_map_io(void)
 {
 	sa1100_map_io();
 	iotable_init(hackkit_io_desc, ARRAY_SIZE(hackkit_io_desc));
+}
 =

+static void __init hackkit_init_early(void)
+{
 	sa1100_register_uart_fns(&hackkit_port_fns);
 	sa1100_register_uart(0, 1);	/* com port */
 	sa1100_register_uart(1, 2);
@@ -197,6 +198,7 @@ static void __init hackkit_init(void)
 MACHINE_START(HACKKIT, "HackKit Cpu Board")
 	.boot_params	=3D 0xc0000100,
 	.map_io		=3D hackkit_map_io,
+	.init_early	=3D hackkit_init_early,
 	.init_irq	=3D sa1100_init_irq,
 	.timer		=3D &sa1100_timer,
 	.init_machine	=3D hackkit_init,
diff --git a/arch/arm/mach-sa1100/include/mach/h3xxx.h b/arch/arm/mach-sa11=
00/include/mach/h3xxx.h
index 7d9df16..82b64b9 100644
--- a/arch/arm/mach-sa1100/include/mach/h3xxx.h
+++ b/arch/arm/mach-sa1100/include/mach/h3xxx.h
@@ -89,6 +89,7 @@ struct gpio_default_state {
 =

 void h3xxx_init_gpio(struct gpio_default_state *s, size_t n);
 void __init h3xxx_map_io(void);
+void __init h3xxx_init_early(void);
 void __init h3xxx_mach_init(void);
 =

 #endif /* _INCLUDE_H3XXX_H_ */
diff --git a/arch/arm/mach-sa1100/jornada720.c b/arch/arm/mach-sa1100/jorna=
da720.c
index 491ac9f..3bd2c5d 100644
--- a/arch/arm/mach-sa1100/jornada720.c
+++ b/arch/arm/mach-sa1100/jornada720.c
@@ -295,7 +295,10 @@ static void __init jornada720_map_io(void)
 {
 	sa1100_map_io();
 	iotable_init(jornada720_io_desc, ARRAY_SIZE(jornada720_io_desc));
+}
 =

+static void __init jornada720_init_early(void)
+{
 	sa1100_register_uart(0, 3);
 	sa1100_register_uart(1, 1);
 }
@@ -366,6 +369,7 @@ MACHINE_START(JORNADA720, "HP Jornada 720")
 	/* Maintainer: Kristoffer Ericson <Kristoffer.Ericson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> */
 	.boot_params	=3D 0xc0000100,
 	.map_io		=3D jornada720_map_io,
+	.init_early	=3D jornada720_init_early,
 	.init_irq	=3D sa1100_init_irq,
 	.timer		=3D &sa1100_timer,
 	.init_machine	=3D jornada720_mach_init,
diff --git a/arch/arm/mach-sa1100/lart.c b/arch/arm/mach-sa1100/lart.c
index 7b9556b..2b999ea 100644
--- a/arch/arm/mach-sa1100/lart.c
+++ b/arch/arm/mach-sa1100/lart.c
@@ -49,7 +49,10 @@ static void __init lart_map_io(void)
 {
 	sa1100_map_io();
 	iotable_init(lart_io_desc, ARRAY_SIZE(lart_io_desc));
+}
 =

+static void __init lart_init_early(void)
+{
 	sa1100_register_uart(0, 3);
 	sa1100_register_uart(1, 1);
 	sa1100_register_uart(2, 2);
@@ -63,6 +66,7 @@ static void __init lart_map_io(void)
 MACHINE_START(LART, "LART")
 	.boot_params	=3D 0xc0000100,
 	.map_io		=3D lart_map_io,
+	.init_early	=3D lart_init_early,
 	.init_irq	=3D sa1100_init_irq,
 	.init_machine	=3D lart_init,
 	.timer		=3D &sa1100_timer,
diff --git a/arch/arm/mach-sa1100/pleb.c b/arch/arm/mach-sa1100/pleb.c
index 65161f2..652e04f 100644
--- a/arch/arm/mach-sa1100/pleb.c
+++ b/arch/arm/mach-sa1100/pleb.c
@@ -117,10 +117,8 @@ static void __init pleb_init(void)
 }
 =

 =

-static void __init pleb_map_io(void)
+static void __init pleb_init_early(void)
 {
-	sa1100_map_io();
-
 	sa1100_register_uart(0, 3);
 	sa1100_register_uart(1, 1);
 =

@@ -146,7 +144,8 @@ static void __init pleb_map_io(void)
 }
 =

 MACHINE_START(PLEB, "PLEB")
-	.map_io		=3D pleb_map_io,
+	.map_io		=3D sa1100_map_io,
+	.init_early	=3D pleb_init_early,
 	.init_irq	=3D sa1100_init_irq,
 	.timer		=3D &sa1100_timer,
 	.init_machine   =3D pleb_init,
diff --git a/arch/arm/mach-sa1100/shannon.c b/arch/arm/mach-sa1100/shannon.c
index 7917b24..f62616e 100644
--- a/arch/arm/mach-sa1100/shannon.c
+++ b/arch/arm/mach-sa1100/shannon.c
@@ -63,10 +63,8 @@ static void __init shannon_init(void)
 	sa11x0_register_mcp(&shannon_mcp_data);
 }
 =

-static void __init shannon_map_io(void)
+static void __init shannon_init_early(void)
 {
-	sa1100_map_io();
-
 	sa1100_register_uart(0, 3);
 	sa1100_register_uart(1, 1);
 =

@@ -83,7 +81,8 @@ static void __init shannon_map_io(void)
 =

 MACHINE_START(SHANNON, "Shannon (AKA: Tuxscreen)")
 	.boot_params	=3D 0xc0000100,
-	.map_io		=3D shannon_map_io,
+	.map_io		=3D sa1100_map_io,
+	.init_early	=3D shannon_init_early,
 	.init_irq	=3D sa1100_init_irq,
 	.timer		=3D &sa1100_timer,
 	.init_machine	=3D shannon_init,
diff --git a/arch/arm/mach-sa1100/simpad.c b/arch/arm/mach-sa1100/simpad.c
index cfb7607..995c47e 100644
--- a/arch/arm/mach-sa1100/simpad.c
+++ b/arch/arm/mach-sa1100/simpad.c
@@ -141,7 +141,10 @@ static void __init simpad_map_io(void)
 	sa1100_map_io();
 =

 	iotable_init(simpad_io_desc, ARRAY_SIZE(simpad_io_desc));
+}
 =

+static void __init simpad_init_early(void)
+{
 	set_cs3_bit (EN1 | EN0 | LED2_ON | DISPLAY_ON | RS232_ON |
 		      ENABLE_5V | RESET_SIMCARD | DECT_POWER_ON);
 =

@@ -231,6 +234,7 @@ MACHINE_START(SIMPAD, "Simpad")
 	/* Maintainer: Holger Freyther */
 	.boot_params	=3D 0xc0000100,
 	.map_io		=3D simpad_map_io,
+	.init_early	=3D simpad_init_early,
 	.init_irq	=3D sa1100_init_irq,
 	.timer		=3D &sa1100_timer,
 MACHINE_END
diff --git a/arch/arm/mach-shmobile/board-ap4evb.c b/arch/arm/mach-shmobile=
/board-ap4evb.c
index 08acb6e..aa0f089 100644
--- a/arch/arm/mach-shmobile/board-ap4evb.c
+++ b/arch/arm/mach-shmobile/board-ap4evb.c
@@ -1118,7 +1118,10 @@ static struct map_desc ap4evb_io_desc[] __initdata =
=3D {
 static void __init ap4evb_map_io(void)
 {
 	iotable_init(ap4evb_io_desc, ARRAY_SIZE(ap4evb_io_desc));
+}
 =

+static void __init ap4evb_init_early(void)
+{
 	/* setup early devices and console here as well */
 	sh7372_add_early_devices();
 	shmobile_setup_console();
@@ -1372,6 +1375,7 @@ static struct sys_timer ap4evb_timer =3D {
 =

 MACHINE_START(AP4EVB, "ap4evb")
 	.map_io		=3D ap4evb_map_io,
+	.init_early	=3D ap4evb_init_early,
 	.init_irq	=3D sh7372_init_irq,
 	.handle_irq	=3D shmobile_handle_irq_intc,
 	.init_machine	=3D ap4evb_init,
diff --git a/arch/arm/mach-shmobile/board-g3evm.c b/arch/arm/mach-shmobile/=
board-g3evm.c
index ef4613b..2089f33 100644
--- a/arch/arm/mach-shmobile/board-g3evm.c
+++ b/arch/arm/mach-shmobile/board-g3evm.c
@@ -260,7 +260,10 @@ static struct map_desc g3evm_io_desc[] __initdata =3D {
 static void __init g3evm_map_io(void)
 {
 	iotable_init(g3evm_io_desc, ARRAY_SIZE(g3evm_io_desc));
+}
 =

+static void __init g3evm_init_early(void)
+{
 	/* setup early devices and console here as well */
 	sh7367_add_early_devices();
 	shmobile_setup_console();
@@ -365,6 +368,7 @@ static struct sys_timer g3evm_timer =3D {
 =

 MACHINE_START(G3EVM, "g3evm")
 	.map_io		=3D g3evm_map_io,
+	.init_early	=3D g3evm_init_early,
 	.init_irq	=3D sh7367_init_irq,
 	.handle_irq	=3D shmobile_handle_irq_intc,
 	.init_machine	=3D g3evm_init,
diff --git a/arch/arm/mach-shmobile/board-g4evm.c b/arch/arm/mach-shmobile/=
board-g4evm.c
index 8e3c555..0885db3 100644
--- a/arch/arm/mach-shmobile/board-g4evm.c
+++ b/arch/arm/mach-shmobile/board-g4evm.c
@@ -274,7 +274,10 @@ static struct map_desc g4evm_io_desc[] __initdata =3D {
 static void __init g4evm_map_io(void)
 {
 	iotable_init(g4evm_io_desc, ARRAY_SIZE(g4evm_io_desc));
+}
 =

+static void __init g4evm_init_early(void)
+{
 	/* setup early devices and console here as well */
 	sh7377_add_early_devices();
 	shmobile_setup_console();
@@ -408,6 +411,7 @@ static struct sys_timer g4evm_timer =3D {
 =

 MACHINE_START(G4EVM, "g4evm")
 	.map_io		=3D g4evm_map_io,
+	.init_early	=3D g4evm_init_early,
 	.init_irq	=3D sh7377_init_irq,
 	.handle_irq	=3D shmobile_handle_irq_intc,
 	.init_machine	=3D g4evm_init,
diff --git a/arch/arm/mach-spear3xx/include/mach/generic.h b/arch/arm/mach-=
spear3xx/include/mach/generic.h
index b8f31c3..dd79808 100644
--- a/arch/arm/mach-spear3xx/include/mach/generic.h
+++ b/arch/arm/mach-spear3xx/include/mach/generic.h
@@ -39,6 +39,7 @@ extern struct sys_timer spear3xx_timer;
 void __init spear3xx_clk_init(void);
 void __init spear_setup_timer(void);
 void __init spear3xx_map_io(void);
+void __init spear3xx_init_early(void);
 void __init spear3xx_init_irq(void);
 void __init spear3xx_init(void);
 =

diff --git a/arch/arm/mach-spear3xx/spear300_evb.c b/arch/arm/mach-spear3xx=
/spear300_evb.c
index 69006f6..69494cc 100644
--- a/arch/arm/mach-spear3xx/spear300_evb.c
+++ b/arch/arm/mach-spear3xx/spear300_evb.c
@@ -66,6 +66,7 @@ static void __init spear300_evb_init(void)
 MACHINE_START(SPEAR300, "ST-SPEAR300-EVB")
 	.boot_params	=3D	0x00000100,
 	.map_io		=3D	spear3xx_map_io,
+	.init_early	=3D	spear3xx_init_early,
 	.init_irq	=3D	spear3xx_init_irq,
 	.timer		=3D	&spear3xx_timer,
 	.init_machine	=3D	spear300_evb_init,
diff --git a/arch/arm/mach-spear3xx/spear310_evb.c b/arch/arm/mach-spear3xx=
/spear310_evb.c
index c8684ce..d067e9c 100644
--- a/arch/arm/mach-spear3xx/spear310_evb.c
+++ b/arch/arm/mach-spear3xx/spear310_evb.c
@@ -72,6 +72,7 @@ static void __init spear310_evb_init(void)
 MACHINE_START(SPEAR310, "ST-SPEAR310-EVB")
 	.boot_params	=3D	0x00000100,
 	.map_io		=3D	spear3xx_map_io,
+	.init_early	=3D	spear3xx_init_early,
 	.init_irq	=3D	spear3xx_init_irq,
 	.timer		=3D	&spear3xx_timer,
 	.init_machine	=3D	spear310_evb_init,
diff --git a/arch/arm/mach-spear3xx/spear320_evb.c b/arch/arm/mach-spear3xx=
/spear320_evb.c
index a12b353..6a32af0 100644
--- a/arch/arm/mach-spear3xx/spear320_evb.c
+++ b/arch/arm/mach-spear3xx/spear320_evb.c
@@ -70,6 +70,7 @@ static void __init spear320_evb_init(void)
 MACHINE_START(SPEAR320, "ST-SPEAR320-EVB")
 	.boot_params	=3D	0x00000100,
 	.map_io		=3D	spear3xx_map_io,
+	.init_early	=3D 	spear3xx_init_early,
 	.init_irq	=3D	spear3xx_init_irq,
 	.timer		=3D	&spear3xx_timer,
 	.init_machine	=3D	spear320_evb_init,
diff --git a/arch/arm/mach-spear3xx/spear3xx.c b/arch/arm/mach-spear3xx/spe=
ar3xx.c
index 10af45d..c2b77b1 100644
--- a/arch/arm/mach-spear3xx/spear3xx.c
+++ b/arch/arm/mach-spear3xx/spear3xx.c
@@ -95,7 +95,10 @@ struct map_desc spear3xx_io_desc[] __initdata =3D {
 void __init spear3xx_map_io(void)
 {
 	iotable_init(spear3xx_io_desc, ARRAY_SIZE(spear3xx_io_desc));
+}
 =

+void __init spear3xx_init_early(void)
+{
 	/* This will initialize clock framework */
 	spear3xx_clk_init();
 }
diff --git a/arch/arm/mach-spear6xx/include/mach/generic.h b/arch/arm/mach-=
spear6xx/include/mach/generic.h
index 183f023..b79b11b 100644
--- a/arch/arm/mach-spear6xx/include/mach/generic.h
+++ b/arch/arm/mach-spear6xx/include/mach/generic.h
@@ -36,6 +36,7 @@ extern struct sys_timer spear6xx_timer;
 /* Add spear6xx family function declarations here */
 void __init spear_setup_timer(void);
 void __init spear6xx_map_io(void);
+void __init spear6xx_init_early(void);
 void __init spear6xx_init_irq(void);
 void __init spear6xx_init(void);
 void __init spear600_init(void);
diff --git a/arch/arm/mach-spear6xx/spear600_evb.c b/arch/arm/mach-spear6xx=
/spear600_evb.c
index f19cefe..d4fbf64 100644
--- a/arch/arm/mach-spear6xx/spear600_evb.c
+++ b/arch/arm/mach-spear6xx/spear600_evb.c
@@ -45,6 +45,7 @@ static void __init spear600_evb_init(void)
 MACHINE_START(SPEAR600, "ST-SPEAR600-EVB")
 	.boot_params	=3D	0x00000100,
 	.map_io		=3D	spear6xx_map_io,
+	.init_early	=3D	spear6xx_init_early,
 	.init_irq	=3D	spear6xx_init_irq,
 	.timer		=3D	&spear6xx_timer,
 	.init_machine	=3D	spear600_evb_init,
diff --git a/arch/arm/mach-spear6xx/spear6xx.c b/arch/arm/mach-spear6xx/spe=
ar6xx.c
index e0f6628..28917ae 100644
--- a/arch/arm/mach-spear6xx/spear6xx.c
+++ b/arch/arm/mach-spear6xx/spear6xx.c
@@ -146,7 +146,10 @@ static struct map_desc spear6xx_io_desc[] __initdata =
=3D {
 void __init spear6xx_map_io(void)
 {
 	iotable_init(spear6xx_io_desc, ARRAY_SIZE(spear6xx_io_desc));
+}
 =

+void __init spear6xx_init_early(void)
+{
 	/* This will initialize clock framework */
 	spear6xx_clk_init();
 }
diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/boar=
d-harmony.c
index 30e18bc..63717ac 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -145,8 +145,8 @@ static struct platform_device *harmony_devices[] __init=
data =3D {
 	&harmony_audio_device,
 };
 =

-static void __init tegra_harmony_fixup(struct machine_desc *desc,
-	struct tag *tags, char **cmdline, struct meminfo *mi)
+static void __init tegra_harmony_fixup(struct tag *tags, char **cmdline,
+	struct meminfo *mi)
 {
 	mi->nr_banks =3D 2;
 	mi->bank[0].start =3D PHYS_OFFSET;
diff --git a/arch/arm/mach-w90x900/mach-nuc910evb.c b/arch/arm/mach-w90x900=
/mach-nuc910evb.c
index 30fccde..fb8faf7 100644
--- a/arch/arm/mach-w90x900/mach-nuc910evb.c
+++ b/arch/arm/mach-w90x900/mach-nuc910evb.c
@@ -21,12 +21,6 @@
 =

 #include "nuc910.h"
 =

-static void __init nuc910evb_map_io(void)
-{
-	nuc910_map_io();
-	nuc910_init_clocks();
-}
-
 static void __init nuc910evb_init(void)
 {
 	nuc910_board_init();
@@ -35,7 +29,8 @@ static void __init nuc910evb_init(void)
 MACHINE_START(W90P910EVB, "W90P910EVB")
 	/* Maintainer: Wan ZongShun */
 	.boot_params	=3D 0,
-	.map_io		=3D nuc910evb_map_io,
+	.map_io		=3D nuc910_map_io,
+	.init_early	=3D nuc910_init_clocks,
 	.init_irq	=3D nuc900_init_irq,
 	.init_machine	=3D nuc910evb_init,
 	.timer		=3D &nuc900_timer,
diff --git a/arch/arm/mach-w90x900/mach-nuc950evb.c b/arch/arm/mach-w90x900=
/mach-nuc950evb.c
index 590c99b..07eb073 100644
--- a/arch/arm/mach-w90x900/mach-nuc950evb.c
+++ b/arch/arm/mach-w90x900/mach-nuc950evb.c
@@ -24,12 +24,6 @@
 =

 #include "nuc950.h"
 =

-static void __init nuc950evb_map_io(void)
-{
-	nuc950_map_io();
-	nuc950_init_clocks();
-}
-
 static void __init nuc950evb_init(void)
 {
 	nuc950_board_init();
@@ -38,7 +32,8 @@ static void __init nuc950evb_init(void)
 MACHINE_START(W90P950EVB, "W90P950EVB")
 	/* Maintainer: Wan ZongShun */
 	.boot_params	=3D 0,
-	.map_io		=3D nuc950evb_map_io,
+	.map_io		=3D nuc950_map_io,
+	.init_early	=3D nuc950_init_clocks,
 	.init_irq	=3D nuc900_init_irq,
 	.init_machine	=3D nuc950evb_init,
 	.timer		=3D &nuc900_timer,
diff --git a/arch/arm/mach-w90x900/mach-nuc960evb.c b/arch/arm/mach-w90x900=
/mach-nuc960evb.c
index e09c645..504719e 100644
--- a/arch/arm/mach-w90x900/mach-nuc960evb.c
+++ b/arch/arm/mach-w90x900/mach-nuc960evb.c
@@ -21,12 +21,6 @@
 =

 #include "nuc960.h"
 =

-static void __init nuc960evb_map_io(void)
-{
-	nuc960_map_io();
-	nuc960_init_clocks();
-}
-
 static void __init nuc960evb_init(void)
 {
 	nuc960_board_init();
@@ -35,7 +29,8 @@ static void __init nuc960evb_init(void)
 MACHINE_START(W90N960EVB, "W90N960EVB")
 	/* Maintainer: Wan ZongShun */
 	.boot_params	=3D 0,
-	.map_io		=3D nuc960evb_map_io,
+	.map_io		=3D nuc960_map_io,
+	.init_early	=3D nuc960_init_clocks,
 	.init_irq	=3D nuc900_init_irq,
 	.init_machine	=3D nuc960evb_init,
 	.timer		=3D &nuc900_timer,
diff --git a/arch/arm/plat-s3c24xx/cpu.c b/arch/arm/plat-s3c24xx/cpu.c
index 4a10c0f..a6cd25f 100644
--- a/arch/arm/plat-s3c24xx/cpu.c
+++ b/arch/arm/plat-s3c24xx/cpu.c
@@ -71,6 +71,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x32410000,
 		.idmask		=3D 0xffffffff,
 		.map_io		=3D s3c2410_map_io,
+		.init_early	=3D s3c2410_init_early,
 		.init_clocks	=3D s3c2410_init_clocks,
 		.init_uarts	=3D s3c2410_init_uarts,
 		.init		=3D s3c2410_init,
@@ -80,6 +81,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x32410002,
 		.idmask		=3D 0xffffffff,
 		.map_io		=3D s3c2410_map_io,
+		.init_early	=3D s3c2410_init_early,
 		.init_clocks	=3D s3c2410_init_clocks,
 		.init_uarts	=3D s3c2410_init_uarts,
 		.init		=3D s3c2410a_init,
@@ -89,6 +91,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x32440000,
 		.idmask		=3D 0xffffffff,
 		.map_io		=3D s3c2440_map_io,
+		.init_early	=3D s3c244x_init_early,
 		.init_clocks	=3D s3c244x_init_clocks,
 		.init_uarts	=3D s3c244x_init_uarts,
 		.init		=3D s3c2440_init,
@@ -98,6 +101,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x32440001,
 		.idmask		=3D 0xffffffff,
 		.map_io		=3D s3c2440_map_io,
+		.init_early	=3D s3c244x_init_early,
 		.init_clocks	=3D s3c244x_init_clocks,
 		.init_uarts	=3D s3c244x_init_uarts,
 		.init		=3D s3c2440_init,
@@ -107,6 +111,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x32440aaa,
 		.idmask		=3D 0xffffffff,
 		.map_io		=3D s3c2442_map_io,
+		.init_early	=3D s3c244x_init_early,
 		.init_clocks	=3D s3c244x_init_clocks,
 		.init_uarts	=3D s3c244x_init_uarts,
 		.init		=3D s3c2442_init,
@@ -116,6 +121,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x32440aab,
 		.idmask		=3D 0xffffffff,
 		.map_io		=3D s3c2442_map_io,
+		.init_early	=3D s3c244x_init_early,
 		.init_clocks	=3D s3c244x_init_clocks,
 		.init_uarts	=3D s3c244x_init_uarts,
 		.init		=3D s3c2442_init,
@@ -125,6 +131,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x32412001,
 		.idmask		=3D 0xffffffff,
 		.map_io		=3D s3c2412_map_io,
+		.init_early	=3D s3c2412_init_early,
 		.init_clocks	=3D s3c2412_init_clocks,
 		.init_uarts	=3D s3c2412_init_uarts,
 		.init		=3D s3c2412_init,
@@ -134,6 +141,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x32412003,
 		.idmask		=3D 0xffffffff,
 		.map_io		=3D s3c2412_map_io,
+		.init_early	=3D s3c2412_init_early,
 		.init_clocks	=3D s3c2412_init_clocks,
 		.init_uarts	=3D s3c2412_init_uarts,
 		.init		=3D s3c2412_init,
@@ -143,6 +151,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x32450003,
 		.idmask		=3D 0xffffffff,
 		.map_io		=3D s3c2416_map_io,
+		.init_early	=3D s3c2416_init_early,
 		.init_clocks	=3D s3c2416_init_clocks,
 		.init_uarts	=3D s3c2416_init_uarts,
 		.init		=3D s3c2416_init,
diff --git a/arch/arm/plat-s3c24xx/include/plat/s3c2410.h b/arch/arm/plat-s=
3c24xx/include/plat/s3c2410.h
index 82ab4aad..77bff52 100644
--- a/arch/arm/plat-s3c24xx/include/plat/s3c2410.h
+++ b/arch/arm/plat-s3c24xx/include/plat/s3c2410.h
@@ -17,7 +17,7 @@ extern  int s3c2410_init(void);
 extern  int s3c2410a_init(void);
 =

 extern void s3c2410_map_io(void);
-
+extern void s3c2410_init_early(void);
 extern void s3c2410_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 =

 extern void s3c2410_init_clocks(int xtal);
@@ -26,6 +26,7 @@ extern void s3c2410_init_clocks(int xtal);
 #define s3c2410_init_clocks NULL
 #define s3c2410_init_uarts NULL
 #define s3c2410_map_io NULL
+#define s3c2410_init_early NULL
 #define s3c2410_init NULL
 #define s3c2410a_init NULL
 #endif
diff --git a/arch/arm/plat-s3c24xx/include/plat/s3c2412.h b/arch/arm/plat-s=
3c24xx/include/plat/s3c2412.h
index bb15d3b..dc98eb5 100644
--- a/arch/arm/plat-s3c24xx/include/plat/s3c2412.h
+++ b/arch/arm/plat-s3c24xx/include/plat/s3c2412.h
@@ -15,13 +15,14 @@
 extern  int s3c2412_init(void);
 =

 extern void s3c2412_map_io(void);
-
+extern void s3c2412_init_early(void);
 extern void s3c2412_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 =

 extern void s3c2412_init_clocks(int xtal);
 =

 extern  int s3c2412_baseclk_add(void);
 #else
+#define s3c2412_init_early NULL
 #define s3c2412_init_clocks NULL
 #define s3c2412_init_uarts NULL
 #define s3c2412_map_io NULL
diff --git a/arch/arm/plat-s3c24xx/include/plat/s3c2416.h b/arch/arm/plat-s=
3c24xx/include/plat/s3c2416.h
index dc3c090..961e6cc 100644
--- a/arch/arm/plat-s3c24xx/include/plat/s3c2416.h
+++ b/arch/arm/plat-s3c24xx/include/plat/s3c2416.h
@@ -16,7 +16,7 @@ struct s3c2410_uartcfg;
 extern  int s3c2416_init(void);
 =

 extern void s3c2416_map_io(void);
-
+extern void s3c2416_init_early(void);
 extern void s3c2416_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 =

 extern void s3c2416_init_clocks(int xtal);
@@ -24,6 +24,7 @@ extern void s3c2416_init_clocks(int xtal);
 extern  int s3c2416_baseclk_add(void);
 =

 #else
+#define s3c2416_init_early NULL
 #define s3c2416_init_clocks NULL
 #define s3c2416_init_uarts NULL
 #define s3c2416_map_io NULL
diff --git a/arch/arm/plat-s3c24xx/include/plat/s3c244x.h b/arch/arm/plat-s=
3c24xx/include/plat/s3c244x.h
index 89e8d0a..06fb41d 100644
--- a/arch/arm/plat-s3c24xx/include/plat/s3c244x.h
+++ b/arch/arm/plat-s3c24xx/include/plat/s3c244x.h
@@ -13,12 +13,13 @@
 #if defined(CONFIG_CPU_S3C2440) || defined(CONFIG_CPU_S3C2442)
 =

 extern void s3c244x_map_io(void);
-
+extern void s3c244x_init_early(void);
 extern void s3c244x_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 =

 extern void s3c244x_init_clocks(int xtal);
 =

 #else
+#define s3c244x_init_early NULL
 #define s3c244x_init_clocks NULL
 #define s3c244x_init_uarts NULL
 #endif
diff --git a/arch/arm/plat-s5p/cpu.c b/arch/arm/plat-s5p/cpu.c
index bbc2aa7..41d5e49 100644
--- a/arch/arm/plat-s5p/cpu.c
+++ b/arch/arm/plat-s5p/cpu.c
@@ -39,6 +39,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x56440100,
 		.idmask		=3D 0xfffff000,
 		.map_io		=3D s5p6440_map_io,
+		.init_early	=3D s5p6440_init_early,
 		.init_clocks	=3D s5p6440_init_clocks,
 		.init_uarts	=3D s5p6440_init_uarts,
 		.init		=3D s5p64x0_init,
@@ -47,6 +48,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x36450000,
 		.idmask		=3D 0xfffff000,
 		.map_io		=3D s5p6450_map_io,
+		.init_early	=3D s5p6450_init_early,
 		.init_clocks	=3D s5p6450_init_clocks,
 		.init_uarts	=3D s5p6450_init_uarts,
 		.init		=3D s5p64x0_init,
@@ -55,6 +57,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x43100000,
 		.idmask		=3D 0xfffff000,
 		.map_io		=3D s5pc100_map_io,
+		.init_early	=3D s5pc100_init_early,
 		.init_clocks	=3D s5pc100_init_clocks,
 		.init_uarts	=3D s5pc100_init_uarts,
 		.init		=3D s5pc100_init,
@@ -63,6 +66,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x43110000,
 		.idmask		=3D 0xfffff000,
 		.map_io		=3D s5pv210_map_io,
+		.init_early	=3D s5pv210_init_early,
 		.init_clocks	=3D s5pv210_init_clocks,
 		.init_uarts	=3D s5pv210_init_uarts,
 		.init		=3D s5pv210_init,
@@ -71,6 +75,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
 		.idcode		=3D 0x43210000,
 		.idmask		=3D 0xfffe0000,
 		.map_io		=3D exynos4_map_io,
+		.init_early	=3D exynos4_init_early,
 		.init_clocks	=3D exynos4_init_clocks,
 		.init_uarts	=3D exynos4_init_uarts,
 		.init		=3D exynos4_init,
diff --git a/arch/arm/plat-s5p/include/plat/exynos4.h b/arch/arm/plat-s5p/i=
nclude/plat/exynos4.h
index 907caab..3b45890 100644
--- a/arch/arm/plat-s5p/include/plat/exynos4.h
+++ b/arch/arm/plat-s5p/include/plat/exynos4.h
@@ -19,6 +19,7 @@ extern void exynos4_setup_clocks(void);
 #ifdef CONFIG_CPU_EXYNOS4210
 =

 extern  int exynos4_init(void);
+extern void exynos4_init_early(void);
 extern void exynos4_init_irq(void);
 extern void exynos4_map_io(void);
 extern void exynos4_init_clocks(int xtal);
@@ -27,6 +28,7 @@ extern struct sys_timer exynos4_timer;
 #define exynos4_init_uarts exynos4_common_init_uarts
 =

 #else
+#define exynos4_init_early NULL
 #define exynos4_init_clocks NULL
 #define exynos4_init_uarts NULL
 #define exynos4_map_io NULL
diff --git a/arch/arm/plat-s5p/include/plat/s5p6440.h b/arch/arm/plat-s5p/i=
nclude/plat/s5p6440.h
index 528585d..654a766 100644
--- a/arch/arm/plat-s5p/include/plat/s5p6440.h
+++ b/arch/arm/plat-s5p/include/plat/s5p6440.h
@@ -18,6 +18,7 @@ extern void s5p6440_setup_clocks(void);
 #ifdef CONFIG_CPU_S5P6440
 =

 extern  int s5p64x0_init(void);
+extern void s5p6440_init_early(void);
 extern void s5p6440_init_irq(void);
 extern void s5p6440_map_io(void);
 extern void s5p6440_init_clocks(int xtal);
@@ -25,6 +26,7 @@ extern void s5p6440_init_clocks(int xtal);
 extern void s5p6440_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 =

 #else
+#define s5p6440_init_early NULL
 #define s5p6440_init_clocks NULL
 #define s5p6440_init_uarts NULL
 #define s5p6440_map_io NULL
diff --git a/arch/arm/plat-s5p/include/plat/s5p6450.h b/arch/arm/plat-s5p/i=
nclude/plat/s5p6450.h
index 640a41c..f4a9fc0 100644
--- a/arch/arm/plat-s5p/include/plat/s5p6450.h
+++ b/arch/arm/plat-s5p/include/plat/s5p6450.h
@@ -18,6 +18,7 @@ extern void s5p6450_setup_clocks(void);
 #ifdef CONFIG_CPU_S5P6450
 =

 extern  int s5p64x0_init(void);
+extern void s5p6450_init_early(void);
 extern void s5p6450_init_irq(void);
 extern void s5p6450_map_io(void);
 extern void s5p6450_init_clocks(int xtal);
@@ -25,6 +26,7 @@ extern void s5p6450_init_clocks(int xtal);
 extern void s5p6450_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 =

 #else
+#define s5p6450_init_early NULL
 #define s5p6450_init_clocks NULL
 #define s5p6450_init_uarts NULL
 #define s5p6450_map_io NULL
diff --git a/arch/arm/plat-s5p/include/plat/s5pc100.h b/arch/arm/plat-s5p/i=
nclude/plat/s5pc100.h
index 5f6099d..308f05d 100644
--- a/arch/arm/plat-s5p/include/plat/s5pc100.h
+++ b/arch/arm/plat-s5p/include/plat/s5pc100.h
@@ -19,6 +19,7 @@ extern void s5pc100_setup_clocks(void);
 #ifdef CONFIG_CPU_S5PC100
 =

 extern  int s5pc100_init(void);
+extern void s5pc100_init_early(void);
 extern void s5pc100_init_irq(void);
 extern void s5pc100_map_io(void);
 extern void s5pc100_init_clocks(int xtal);
@@ -26,6 +27,7 @@ extern void s5pc100_init_clocks(int xtal);
 #define s5pc100_init_uarts s5pc100_common_init_uarts
 =

 #else
+#define s5pc100_init_early NULL
 #define s5pc100_init_clocks NULL
 #define s5pc100_init_uarts NULL
 #define s5pc100_map_io NULL
diff --git a/arch/arm/plat-s5p/include/plat/s5pv210.h b/arch/arm/plat-s5p/i=
nclude/plat/s5pv210.h
index 6c93a0c..b31a02b 100644
--- a/arch/arm/plat-s5p/include/plat/s5pv210.h
+++ b/arch/arm/plat-s5p/include/plat/s5pv210.h
@@ -19,6 +19,7 @@ extern void s5pv210_setup_clocks(void);
 #ifdef CONFIG_CPU_S5PV210
 =

 extern  int s5pv210_init(void);
+extern void s5pv210_init_early(void);
 extern void s5pv210_init_irq(void);
 extern void s5pv210_map_io(void);
 extern void s5pv210_init_clocks(int xtal);
@@ -26,6 +27,7 @@ extern void s5pv210_init_clocks(int xtal);
 #define s5pv210_init_uarts s5pv210_common_init_uarts
 =

 #else
+#define s5pv210_init_early NULL
 #define s5pv210_init_clocks NULL
 #define s5pv210_init_uarts NULL
 #define s5pv210_map_io NULL
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsu=
ng/include/plat/cpu.h
index c0a5741..14ec469 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -35,6 +35,7 @@ struct cpu_table {
 	unsigned long	idcode;
 	unsigned long	idmask;
 	void		(*map_io)(void);
+	void		(*init_early)(void);
 	void		(*init_uarts)(struct s3c2410_uartcfg *cfg, int no);
 	void		(*init_clocks)(int xtal);
 	int		(*init)(void);
@@ -43,6 +44,7 @@ struct cpu_table {
 =

 extern void s3c_init_cpu(unsigned long idcode,
 			 struct cpu_table *cpus, unsigned int cputab_size);
+extern void s3c_init_early(void);
 =

 /* core initialisation functions */
 =

diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
index 79d10fc..c27b92f 100644
--- a/arch/arm/plat-samsung/init.c
+++ b/arch/arm/plat-samsung/init.c
@@ -60,7 +60,14 @@ void __init s3c_init_cpu(unsigned long idcode,
 		panic("Unsupported Samsung CPU");
 	}
 =

-	cpu->map_io();
+	if (cpu->map_io)
+		cpu->map_io();
+}
+
+void __init s3c_init_early(void)
+{
+	if (cpu->init_early)
+		cpu->init_early();
 }
 =

 /* s3c24xx_init_clocks
