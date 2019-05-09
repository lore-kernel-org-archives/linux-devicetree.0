From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] arm64: add support for rng-seed
Date: Wed, 08 May 2019 17:01:23 -0700
Message-ID: <155736008376.14659.15159246866536630666@swboyd.mtv.corp.google.com>
References: <20190507045433.542-1-hsinyi@chromium.org> <CAL_Jsq+rGeFKAPVmPvv_Z+G=BppKUK-tEUphBajZVxFtbRBJvQ@mail.gmail.com> <CAJMQK-iVhScf0ybZ85kqP0B5_QPoYZ9PZt35jHRUh8FNHKvu7w@mail.gmail.com> <CAL_JsqJZ+mOnrLWt0Cpo_Ybr_ohxwWom1qiyV8_EFocULde7=Q@mail.gmail.com> <CAJMQK-jjzYwX3NZAKJ-8ypjcN75o-ZX4iOVD=84JecEd4qV1bA@mail.gmail.com> <CAL_JsqLnmedF5cJYH+91U2Q_WX755O8TQs6Ue9mqtEiFKcjGWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLnmedF5cJYH+91U2Q_WX755O8TQs6Ue9mqtEiFKcjGWQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Architecture Mailman List <boot-architecture@lists.linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2019-05-08 09:07:11)
> On Wed, May 8, 2019 at 10:06 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > On Wed, May 8, 2019 at 10:04 PM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Tue, May 7, 2019 at 11:08 PM Hsin-Yi Wang <hsinyi@chromium.org> wr=
ote:
> > > >
> > > > On Wed, May 8, 2019 at 3:47 AM Rob Herring <robh+dt@kernel.org> wro=
te:
> > > > >
> > > > > +boot-architecture list as there was some discussion about this I=
IRC.
> > > > >
> > > > > On Mon, May 6, 2019 at 11:54 PM Hsin-Yi Wang <hsinyi@chromium.org=
> wrote:
> > > > > >
> > > > > > Introducing a chosen node, rng-seed, which is an 64 bytes entro=
py
> > > > > > that can be passed to kernel called very early to increase devi=
ce
> > > > > > randomness. Bootloader should provide this entropy and the valu=
e is
> > > > > > read from /chosen/rng-seed in DT.
> > > > > >
> > > > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > > >
> > > > > > ---
> > > > > >  Documentation/devicetree/bindings/chosen.txt | 14 +++++++++
> > > > >
> > > > > Actually, this file has been converted to json-schema and lives
> > > > > here[1]. I need to remove this one (or leave it with a reference =
to
> > > > > the new one).
> > > > >
> > > > > >  arch/arm64/kernel/setup.c                    |  2 ++
> > > > > >  drivers/of/fdt.c                             | 33 ++++++++++++=
++++++++
> > > > > >  include/linux/of_fdt.h                       |  1 +
> > > > > >  4 files changed, 50 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Doc=
umentation/devicetree/bindings/chosen.txt
> > > > > > index 45e79172a646..bfd360691650 100644
> > > > > > --- a/Documentation/devicetree/bindings/chosen.txt
> > > > > > +++ b/Documentation/devicetree/bindings/chosen.txt
> > > > > > @@ -28,6 +28,20 @@ mode) when EFI_RNG_PROTOCOL is supported, it=
 will be overwritten by
> > > > > >  the Linux EFI stub (which will populate the property itself, u=
sing
> > > > > >  EFI_RNG_PROTOCOL).
> > > > > >
> > > > > > +rng-seed
> > > > > > +-----------
> > > > > > +
> > > > > > +This property served as an entropy to add device randomness. I=
t is parsed
> > > > > > +as a 64 byte value, e.g.
> > > > >
> > > > > Why only 64-bytes?
> > > > We can also not specify size and read what bootloader can provide.
> > > > >
> > > > > > +
> > > > > > +/ {
> > > > > > +       chosen {
> > > > > > +               rng-seed =3D <0x31951b3c 0xc9fab3a5 0xffdf1660 =
...>
> > > > > > +       };
> > > > > > +};
> > > > > > +
> > > > > > +This random value should be provided by bootloader.
> > > > > > +
> > > > > >  stdout-path
> > > > > >  -----------
> > > > > >
> > > > > > diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setu=
p.c
> > > > > > index 413d566405d1..ade4261516dd 100644
> > > > > > --- a/arch/arm64/kernel/setup.c
> > > > > > +++ b/arch/arm64/kernel/setup.c
> > > > > > @@ -292,6 +292,8 @@ void __init setup_arch(char **cmdline_p)
> > > > > >         early_fixmap_init();
> > > > > >         early_ioremap_init();
> > > > > >
> > > > > > +       early_init_dt_rng_seed(__fdt_pointer);
> > > > > > +
> > > > >
> > > > > I'm trying to reduce or eliminate all these early_init_dt_* calls.
> > > > >
> > > > > Why is this arch specific and why can't this be done after
> > > > > unflattening? It doesn't look like add_device_randomness() needs
> > > > > anything early.
> > > > Currently unflattening is called after setup_machine_fdt(), which
> > > > called fixmap_remap_fdt() //__fixmap_remap_fdt(dt_phys, &size,
> > > > PAGE_KERNEL_RO), and we can't modify DT after that since it's read
> > > > only. But we need to clear (eg. write 0 to it) the rng-seed after
> > > > reading from DT.
> > >
> > > Why do you need to clear it? That wasn't necessary for kaslr-seed.
> > I think it's for security purpose. If we know the random seed, it's
> > more likely we can predict randomness.
> > Currently on arm64, kaslr-seed will be wiped out (in
> > arch/arm64/kernel/kaslr.c#get_kaslr_seed(), it's set to 0) so we can't
> > read from sysfs (eg. /sys/firmware/devicetree/.../kaslr-seed)
> > I'm not sure on other arch if it will be wiped out.
>=20
> The difference is if I have the kaslr seed, I can calculate the kernel
> base address.
>=20
> In your case, you are feeding an RNG which continually has entropy
> added to it. I can't see that knowing one piece of the entropy data is
> a security hole. It looks more like you've just copied what what done
> for kaslr-seed.
>=20
> > > Why not change the mapping to RW? It would be nice if this worked on
> > > more than one arch.
>=20
> Still wondering on this question. Mapping it R/W would mean rng-seed
> could be handled later and completely out of the arch code and so
> could the zeroing of the kaslr-seed. Also, we generally assume the FDT
> is modifiable for any fixups. This happens on arm32 and powerpc, but I
> guess we haven't needed that yet on arm64.
>=20

Maybe we can make the mapping of the FDT be RW until unflattening and
then provide a weak arch hook to remap the FDT as RO if the architecture
supports it? This way arm64 can mark it RO after any fixes have been
made.

BTW, maybe we should put the 'initial_boot_params' pointer into
__ro_after_init? That way it can't be repointed after init, but it looks
like almost no code uses the flat DT after init anyway besides sysfs
raw read.

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 4734223ab702..483e48f860ec 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -38,7 +38,7 @@
  * memory entries in the /memory node. This function may be called
  * any time after initial_boot_param is set.
  */
-void of_fdt_limit_memory(int limit)
+void __init of_fdt_limit_memory(int limit)
 {
 	int memory;
 	int len;
@@ -145,8 +145,8 @@ static bool of_fdt_device_is_available(const void *blob=
, unsigned long node)
 /**
  * of_fdt_match - Return true if node matches a list of compatible values
  */
-int of_fdt_match(const void *blob, unsigned long node,
-                 const char *const *compat)
+static int __init of_fdt_match(const void *blob, unsigned long node,
+			       const char *const *compat)
 {
 	unsigned int tmp, score =3D 0;
=20
@@ -535,7 +535,7 @@ EXPORT_SYMBOL_GPL(of_fdt_unflatten_tree);
 int __initdata dt_root_addr_cells;
 int __initdata dt_root_size_cells;
=20
-void *initial_boot_params;
+void *initial_boot_params __ro_after_init;
=20
 #ifdef CONFIG_OF_EARLY_FLATTREE
=20
@@ -758,7 +758,7 @@ int __init of_scan_flat_dt_subnodes(unsigned long paren=
t,
  * @return offset of the subnode, or -FDT_ERR_NOTFOUND if there is none
  */
=20
-int of_get_flat_dt_subnode_by_name(unsigned long node, const char *uname)
+int __init of_get_flat_dt_subnode_by_name(unsigned long node, const char *=
uname)
 {
 	return fdt_subnode_offset(initial_boot_params, node, uname);
 }
@@ -804,7 +804,7 @@ int __init of_flat_dt_is_compatible(unsigned long node,=
 const char *compat)
 /**
  * of_flat_dt_match - Return true if node matches a list of compatible val=
ues
  */
-int __init of_flat_dt_match(unsigned long node, const char *const *compat)
+static int __init of_flat_dt_match(unsigned long node, const char *const *=
compat)
 {
 	return of_fdt_match(initial_boot_params, node, compat);
 }
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index a713e5d156d8..97b646e0ff2c 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -30,8 +30,6 @@ extern void *of_fdt_get_property(const void *blob,
 				 int *size);
 extern bool of_fdt_is_big_endian(const void *blob,
 				 unsigned long node);
-extern int of_fdt_match(const void *blob, unsigned long node,
-			const char *const *compat);
 extern void *of_fdt_unflatten_tree(const unsigned long *blob,
 				   struct device_node *dad,
 				   struct device_node **mynodes);
@@ -64,7 +62,6 @@ extern int of_get_flat_dt_subnode_by_name(unsigned long n=
ode,
 extern const void *of_get_flat_dt_prop(unsigned long node, const char *nam=
e,
 				       int *size);
 extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
-extern int of_flat_dt_match(unsigned long node, const char *const *matches=
);
 extern unsigned long of_get_flat_dt_root(void);
 extern int of_get_flat_dt_size(void);
 extern uint32_t of_get_flat_dt_phandle(unsigned long node);
