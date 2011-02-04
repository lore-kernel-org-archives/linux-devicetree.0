From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 2/2] ARM:boot:device tree: Merge specific atags into the
	device tree
Date: Thu, 3 Feb 2011 21:59:38 -0700
Message-ID: <AANLkTik5M_82RCaPemn2_KaqJ6cH8RoGG1=cGx_1NqrH@mail.gmail.com>
References: <20110126212220.6723.28773.stgit@riker>
	<20110126212324.6723.25307.stgit@riker>
	<alpine.LFD.2.00.1102032342320.12104@xanadu.home>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6893465455685558778=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1102032342320.12104-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============6893465455685558778==
Content-Type: multipart/alternative; boundary=001485e7e948d49fd3049b6dbf20

--001485e7e948d49fd3049b6dbf20
Content-Type: text/plain; charset=ISO-8859-1

On Feb 3, 2011 9:44 PM, "Nicolas Pitre" <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> wrote:
>
> On Wed, 26 Jan 2011, John Bonesio wrote:
>
> > This patch is to merge in key atags into the appended device tree.  An
appended
> > device tree is where the zImage has a dtb binary appended at the end of
it. The
> > boot code looks for an appended device tree, then looks for a few key
atags
> > passed in by the bootloader.
> >
> > The bootargs and memory size settings, if they exist, override existing
values
> > in the appended device tree. If these values don't currently exist in
the
> > appended device tree, they are added.
> >
> > Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> This is just for testing/evaluation purpose and not intended to be
> merged upstream at some point, right?

Correct.

>
> > ---
> >
> >  arch/arm/boot/compressed/Makefile |   31 +++++++++++++++++---
> >  arch/arm/boot/compressed/atags.c  |   50
++++++++++++++++++++++++++++++++
> >  arch/arm/boot/compressed/head.S   |    7 ++++
> >  arch/arm/boot/compressed/misc.c   |   58
++++++++++++++++++++++++++++++++++++-
> >  4 files changed, 139 insertions(+), 7 deletions(-)
> >  create mode 100644 arch/arm/boot/compressed/atags.c
> >
> > diff --git a/arch/arm/boot/compressed/Makefile
b/arch/arm/boot/compressed/Makefile
> > index 0a8f748..7978a39 100644
> > --- a/arch/arm/boot/compressed/Makefile
> > +++ b/arch/arm/boot/compressed/Makefile
> > @@ -49,6 +49,10 @@ ifeq ($(CONFIG_ARCH_SHMOBILE),y)
> >  OBJS         += head-shmobile.o
> >  endif
> >
> > +ifeq ($(CONFIG_ARM_APPENDED_DTB),y)
> > +OBJS         += atags.o libfdt.a
> > +endif
> > +
> >  #
> >  # We now have a PIC decompressor implementation.  Decompressors running
> >  # from RAM should not define ZTEXTADDR.  Decompressors running directly
> > @@ -80,7 +84,9 @@ ORIG_CFLAGS := $(KBUILD_CFLAGS)
> >  KBUILD_CFLAGS = $(subst -pg, , $(ORIG_CFLAGS))
> >  endif
> >
> > -EXTRA_CFLAGS  := -fpic -fno-builtin
> > +fdttree      := $(srctree)/scripts/dtc/libfdt
> > +
> > +EXTRA_CFLAGS  := -fpic -fno-builtin -I$(fdttree) -I$(obj)
> >  EXTRA_AFLAGS  := -Wa,-march=all
> >
> >  # Supply ZRELADDR to the decompressor via a linker symbol.
> > @@ -100,13 +106,28 @@ LDFLAGS_vmlinux += -X
> >  LDFLAGS_vmlinux += -T
> >
> >  # For __aeabi_uidivmod
> > -lib1funcs = $(obj)/lib1funcs.o
> > +libfuncs = $(obj)/lib1funcs.o
> >
> > -$(obj)/lib1funcs.S: $(srctree)/arch/$(SRCARCH)/lib/lib1funcs.S FORCE
> > -     $(call cmd,shipped)
> > +ifeq ($(CONFIG_ARM_APPENDED_DTB),y)
> > +# For memchr, memmove, etc
> > +libfuncs += $(obj)/memchr.o $(obj)/strchr.o $(obj)/memmove.o
$(obj)/memzero.o
> > +endif
> > +
> > +
> > +libfdtheader := $(fdttree)/fdt.h $(fdttree)/libfdt.h
$(fdttree)/libfdt_internal.h
> > +libfdtobj    := $(obj)/fdt.o $(obj)/fdt_ro.o $(obj)/fdt_wip.o
$(obj)/fdt_sw.o $(obj)/fdt_rw.o $(obj)/fdt_strerror.o
> > +
> > +$(libfdtobj): $(obj)/%.o: $(srctree)/scripts/dtc/libfdt/%.c
$(libfdtheader)
> > +     $(call cmd_cc_o_c)
> > +
> > +$(obj)/libfdt.a: $(libfdtobj)
> > +     $(AR) rcs $@ $^
> > +
> > +$(libfuncs): $(obj)/%.o: $(srctree)/arch/$(SRCARCH)/lib/%.S
> > +     $(call cmd_as_o_S)
> >
> >  $(obj)/vmlinux: $(obj)/vmlinux.lds $(obj)/$(HEAD)
$(obj)/piggy.$(suffix_y).o \
> > -             $(addprefix $(obj)/, $(OBJS)) $(lib1funcs) FORCE
> > +             $(addprefix $(obj)/, $(OBJS)) $(libfuncs) FORCE
> >       $(call if_changed,ld)
> >       @:
> >
> > diff --git a/arch/arm/boot/compressed/atags.c
b/arch/arm/boot/compressed/atags.c
> > new file mode 100644
> > index 0000000..e37d8de
> > --- /dev/null
> > +++ b/arch/arm/boot/compressed/atags.c
> > @@ -0,0 +1,50 @@
> > +#include <stddef.h>
> > +#include <asm/byteorder.h>
> > +#include <asm/setup.h>
> > +#include <fdt.h>
> > +#include <libfdt.h>
> > +
> > +
> > +int dt_setprop(void *fdt, const char *node_path, const char *property,
> > +               uint32_t *val_array, int size)
> > +{
> > +     int offset;
> > +
> > +     offset = fdt_path_offset(fdt, node_path);
> > +     if (offset < 0)
> > +             return offset;
> > +
> > +     return fdt_setprop(fdt, offset, property, val_array, size);
> > +}
> > +
> > +int dt_setprop_string(void *fdt, const char *node_path,
> > +                      const char *property, const char *string)
> > +{
> > +     int offset;
> > +
> > +     offset = fdt_path_offset(fdt, node_path);
> > +     if (offset < 0)
> > +             return offset;
> > +
> > +     return fdt_setprop_string(fdt, offset, property, string);
> > +}
> > +
> > +void dt_merge_atags(void *dt,  void *ataglist)
> > +{
> > +     struct tag *atag = ataglist;
> > +     uint32_t mem_reg_property[2];
> > +
> > +     while (atag && atag->hdr.tag != 0) {
> > +             if (atag->hdr.tag == ATAG_CMDLINE) {
> > +                     dt_setprop_string(dt, "/chosen", "bootargs",
> > +                                       atag->u.cmdline.cmdline);
> > +             } else if (atag->hdr.tag == ATAG_MEM) {
> > +                     mem_reg_property[0] =
cpu_to_fdt32(atag->u.mem.start);
> > +                     mem_reg_property[1] =
cpu_to_fdt32(atag->u.mem.size);
> > +                     dt_setprop(dt, "/memory", "reg", mem_reg_property,
> > +                                sizeof(mem_reg_property));
> > +             }
> > +             atag = tag_next(atag);
> > +     }
> > +}
> > +
> > diff --git a/arch/arm/boot/compressed/head.S
b/arch/arm/boot/compressed/head.S
> > index db860b3..09e659d 100644
> > --- a/arch/arm/boot/compressed/head.S
> > +++ b/arch/arm/boot/compressed/head.S
> > @@ -257,6 +257,13 @@ not_relocated:
> >               cmp     r1, r9
> >               bne     keep_atags
> >
> > +             /* Merge some of the atags into the device tree */
> > +             push    {r2, r3, r10, r11}
> > +             mov     r0, r2
> > +             mov     r1, r8
> > +             bl      dt_merge_atags
> > +             pop     {r2, r3, r10, r11}
> > +
> >               /* copy the device tree binary to 0x0 */
> >               ldr     r9, [r10, #4]   @ device tree size
> >
> > diff --git a/arch/arm/boot/compressed/misc.c
b/arch/arm/boot/compressed/misc.c
> > index e653a6d..2d4da4c 100644
> > --- a/arch/arm/boot/compressed/misc.c
> > +++ b/arch/arm/boot/compressed/misc.c
> > @@ -29,7 +29,7 @@ unsigned int __machine_arch_type;
> >  #include <asm/unaligned.h>
> >
> >
> > -static void putstr(const char *ptr);
> > +void putstr(const char *ptr);
> >  extern void error(char *x);
> >
> >  #include <mach/uncompress.h>
> > @@ -100,7 +100,7 @@ static void icedcc_putc(int ch)
> >  #define putc(ch)     icedcc_putc(ch)
> >  #endif
> >
> > -static void putstr(const char *ptr)
> > +void putstr(const char *ptr)
> >  {
> >       char c;
> >
> > @@ -114,6 +114,60 @@ static void putstr(const char *ptr)
> >  }
> >
> >
> > +#ifdef CONFIG_ARM_APPENDED_DTB
> > +/**
> > + * strlen - Find the length of a string
> > + * @s: The string to be sized
> > + */
> > +size_t strlen(const char *s)
> > +{
> > +        const char *sc;
> > +
> > +        for (sc = s; *sc != '\0'; ++sc)
> > +                /* nothing */;
> > +        return sc - s;
> > +}
> > +
> > +/**
> > + * strcmp - Compare two strings
> > + * @cs: One string
> > + * @ct: Another string
> > + */
> > +#undef strcmp
> > +int strcmp(const char *cs, const char *ct)
> > +{
> > +     unsigned char c1, c2;
> > +
> > +     while (1) {
> > +             c1 = *cs++;
> > +             c2 = *ct++;
> > +             if (c1 != c2)
> > +                     return c1 < c2 ? -1 : 1;
> > +             if (!c1)
> > +                     break;
> > +     }
> > +     return 0;
> > +}
> > +
> > +/**
> > + * memcmp - Compare two areas of memory
> > + * @cs: One area of memory
> > + * @ct: Another area of memory
> > + * @count: The size of the area.
> > + */
> > +#undef memcmp
> > +int memcmp(const void *cs, const void *ct, size_t count)
> > +{
> > +     const unsigned char *su1, *su2;
> > +     int res = 0;
> > +
> > +     for (su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
> > +             if ((res = *su1 - *su2) != 0)
> > +                     break;
> > +     return res;
> > +}
> > +#endif
> > +
> >  void *memcpy(void *__dest, __const void *__src, size_t __n)
> >  {
> >       int i = 0;
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >

--001485e7e948d49fd3049b6dbf20
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Feb 3, 2011 9:44 PM, &quot;Nicolas Pitre&quot; &lt;<a href=3D"mailto:nic=
o@fluxnic.net">nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, 26 Jan 2011, John Bonesio wrote:<br>
&gt;<br>
&gt; &gt; This patch is to merge in key atags into the appended device tree=
. =A0An appended<br>
&gt; &gt; device tree is where the zImage has a dtb binary appended at the =
end of it. The<br>
&gt; &gt; boot code looks for an appended device tree, then looks for a few=
 key atags<br>
&gt; &gt; passed in by the bootloader.<br>
&gt; &gt;<br>
&gt; &gt; The bootargs and memory size settings, if they exist, override ex=
isting values<br>
&gt; &gt; in the appended device tree. If these values don&#39;t currently =
exist in the<br>
&gt; &gt; appended device tree, they are added.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: John Bonesio &lt;<a href=3D"mailto:bones@secretlab=
.ca">bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;<br>
&gt; &gt; Acked-by: Grant Likely &lt;<a href=3D"mailto:grant.likely@secretl=
ab.ca">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;<br>
&gt;<br>
&gt; This is just for testing/evaluation purpose and not intended to be<br>
&gt; merged upstream at some point, right?</p>
<p>Correct.</p>
<p>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; =A0arch/arm/boot/compressed/Makefile | =A0 31 +++++++++++++++++--=
-<br>
&gt; &gt; =A0arch/arm/boot/compressed/atags.c =A0| =A0 50 +++++++++++++++++=
+++++++++++++++<br>
&gt; &gt; =A0arch/arm/boot/compressed/head.S =A0 | =A0 =A07 ++++<br>
&gt; &gt; =A0arch/arm/boot/compressed/misc.c =A0 | =A0 58 +++++++++++++++++=
+++++++++++++++++++-<br>
&gt; &gt; =A04 files changed, 139 insertions(+), 7 deletions(-)<br>
&gt; &gt; =A0create mode 100644 arch/arm/boot/compressed/atags.c<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/co=
mpressed/Makefile<br>
&gt; &gt; index 0a8f748..7978a39 100644<br>
&gt; &gt; --- a/arch/arm/boot/compressed/Makefile<br>
&gt; &gt; +++ b/arch/arm/boot/compressed/Makefile<br>
&gt; &gt; @@ -49,6 +49,10 @@ ifeq ($(CONFIG_ARCH_SHMOBILE),y)<br>
&gt; &gt; =A0OBJS =A0 =A0 =A0 =A0 +=3D head-shmobile.o<br>
&gt; &gt; =A0endif<br>
&gt; &gt;<br>
&gt; &gt; +ifeq ($(CONFIG_ARM_APPENDED_DTB),y)<br>
&gt; &gt; +OBJS =A0 =A0 =A0 =A0 +=3D atags.o libfdt.a<br>
&gt; &gt; +endif<br>
&gt; &gt; +<br>
&gt; &gt; =A0#<br>
&gt; &gt; =A0# We now have a PIC decompressor implementation. =A0Decompress=
ors running<br>
&gt; &gt; =A0# from RAM should not define ZTEXTADDR. =A0Decompressors runni=
ng directly<br>
&gt; &gt; @@ -80,7 +84,9 @@ ORIG_CFLAGS :=3D $(KBUILD_CFLAGS)<br>
&gt; &gt; =A0KBUILD_CFLAGS =3D $(subst -pg, , $(ORIG_CFLAGS))<br>
&gt; &gt; =A0endif<br>
&gt; &gt;<br>
&gt; &gt; -EXTRA_CFLAGS =A0:=3D -fpic -fno-builtin<br>
&gt; &gt; +fdttree =A0 =A0 =A0:=3D $(srctree)/scripts/dtc/libfdt<br>
&gt; &gt; +<br>
&gt; &gt; +EXTRA_CFLAGS =A0:=3D -fpic -fno-builtin -I$(fdttree) -I$(obj)<br=
>
&gt; &gt; =A0EXTRA_AFLAGS =A0:=3D -Wa,-march=3Dall<br>
&gt; &gt;<br>
&gt; &gt; =A0# Supply ZRELADDR to the decompressor via a linker symbol.<br>
&gt; &gt; @@ -100,13 +106,28 @@ LDFLAGS_vmlinux +=3D -X<br>
&gt; &gt; =A0LDFLAGS_vmlinux +=3D -T<br>
&gt; &gt;<br>
&gt; &gt; =A0# For __aeabi_uidivmod<br>
&gt; &gt; -lib1funcs =3D $(obj)/lib1funcs.o<br>
&gt; &gt; +libfuncs =3D $(obj)/lib1funcs.o<br>
&gt; &gt;<br>
&gt; &gt; -$(obj)/lib1funcs.S: $(srctree)/arch/$(SRCARCH)/lib/lib1funcs.S F=
ORCE<br>
&gt; &gt; - =A0 =A0 $(call cmd,shipped)<br>
&gt; &gt; +ifeq ($(CONFIG_ARM_APPENDED_DTB),y)<br>
&gt; &gt; +# For memchr, memmove, etc<br>
&gt; &gt; +libfuncs +=3D $(obj)/memchr.o $(obj)/strchr.o $(obj)/memmove.o $=
(obj)/memzero.o<br>
&gt; &gt; +endif<br>
&gt; &gt; +<br>
&gt; &gt; +<br>
&gt; &gt; +libfdtheader :=3D $(fdttree)/fdt.h $(fdttree)/libfdt.h $(fdttree=
)/libfdt_internal.h<br>
&gt; &gt; +libfdtobj =A0 =A0:=3D $(obj)/fdt.o $(obj)/fdt_ro.o $(obj)/fdt_wi=
p.o $(obj)/fdt_sw.o $(obj)/fdt_rw.o $(obj)/fdt_strerror.o<br>
&gt; &gt; +<br>
&gt; &gt; +$(libfdtobj): $(obj)/%.o: $(srctree)/scripts/dtc/libfdt/%.c $(li=
bfdtheader)<br>
&gt; &gt; + =A0 =A0 $(call cmd_cc_o_c)<br>
&gt; &gt; +<br>
&gt; &gt; +$(obj)/libfdt.a: $(libfdtobj)<br>
&gt; &gt; + =A0 =A0 $(AR) rcs $@ $^<br>
&gt; &gt; +<br>
&gt; &gt; +$(libfuncs): $(obj)/%.o: $(srctree)/arch/$(SRCARCH)/lib/%.S<br>
&gt; &gt; + =A0 =A0 $(call cmd_as_o_S)<br>
&gt; &gt;<br>
&gt; &gt; =A0$(obj)/vmlinux: $(obj)/vmlinux.lds $(obj)/$(HEAD) $(obj)/piggy=
.$(suffix_y).o \<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 $(addprefix $(obj)/, $(OBJS)) $(lib1fun=
cs) FORCE<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 $(addprefix $(obj)/, $(OBJS)) $(libfunc=
s) FORCE<br>
&gt; &gt; =A0 =A0 =A0 $(call if_changed,ld)<br>
&gt; &gt; =A0 =A0 =A0 @:<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/arch/arm/boot/compressed/atags.c b/arch/arm/boot/com=
pressed/atags.c<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..e37d8de<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/arch/arm/boot/compressed/atags.c<br>
&gt; &gt; @@ -0,0 +1,50 @@<br>
&gt; &gt; +#include &lt;stddef.h&gt;<br>
&gt; &gt; +#include &lt;asm/byteorder.h&gt;<br>
&gt; &gt; +#include &lt;asm/setup.h&gt;<br>
&gt; &gt; +#include &lt;fdt.h&gt;<br>
&gt; &gt; +#include &lt;libfdt.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +<br>
&gt; &gt; +int dt_setprop(void *fdt, const char *node_path, const char *pro=
perty,<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint32_t *val_array, int size)<br>
&gt; &gt; +{<br>
&gt; &gt; + =A0 =A0 int offset;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 offset =3D fdt_path_offset(fdt, node_path);<br>
&gt; &gt; + =A0 =A0 if (offset &lt; 0)<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 return offset;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 return fdt_setprop(fdt, offset, property, val_array, si=
ze);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +int dt_setprop_string(void *fdt, const char *node_path,<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *property=
, const char *string)<br>
&gt; &gt; +{<br>
&gt; &gt; + =A0 =A0 int offset;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 offset =3D fdt_path_offset(fdt, node_path);<br>
&gt; &gt; + =A0 =A0 if (offset &lt; 0)<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 return offset;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 return fdt_setprop_string(fdt, offset, property, string=
);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +void dt_merge_atags(void *dt, =A0void *ataglist)<br>
&gt; &gt; +{<br>
&gt; &gt; + =A0 =A0 struct tag *atag =3D ataglist;<br>
&gt; &gt; + =A0 =A0 uint32_t mem_reg_property[2];<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 while (atag &amp;&amp; atag-&gt;hdr.tag !=3D 0) {<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 if (atag-&gt;hdr.tag =3D=3D ATAG_CMDLIN=
E) {<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dt_setprop_string(dt, &=
quot;/chosen&quot;, &quot;bootargs&quot;,<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 atag-&gt;u.cmdline.cmdline);<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 } else if (atag-&gt;hdr.tag =3D=3D ATAG=
_MEM) {<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mem_reg_property[0] =3D=
 cpu_to_fdt32(atag-&gt;u.mem.start);<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mem_reg_property[1] =3D=
 cpu_to_fdt32(atag-&gt;u.mem.size);<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dt_setprop(dt, &quot;/m=
emory&quot;, &quot;reg&quot;, mem_reg_property,<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
sizeof(mem_reg_property));<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 atag =3D tag_next(atag);<br>
&gt; &gt; + =A0 =A0 }<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/comp=
ressed/head.S<br>
&gt; &gt; index db860b3..09e659d 100644<br>
&gt; &gt; --- a/arch/arm/boot/compressed/head.S<br>
&gt; &gt; +++ b/arch/arm/boot/compressed/head.S<br>
&gt; &gt; @@ -257,6 +257,13 @@ not_relocated:<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmp =A0 =A0 r1, r9<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 bne =A0 =A0 keep_atags<br>
&gt; &gt;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 /* Merge some of the atags into the dev=
ice tree */<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 push =A0 =A0{r2, r3, r10, r11}<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 r0, r2<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 r1, r8<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 bl =A0 =A0 =A0dt_merge_atags<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 pop =A0 =A0 {r2, r3, r10, r11}<br>
&gt; &gt; +<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* copy the device tree binary to 0x0=
 */<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 r9, [r10, #4] =A0 @ devic=
e tree size<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/arch/arm/boot/compressed/misc.c b/arch/arm/boot/comp=
ressed/misc.c<br>
&gt; &gt; index e653a6d..2d4da4c 100644<br>
&gt; &gt; --- a/arch/arm/boot/compressed/misc.c<br>
&gt; &gt; +++ b/arch/arm/boot/compressed/misc.c<br>
&gt; &gt; @@ -29,7 +29,7 @@ unsigned int __machine_arch_type;<br>
&gt; &gt; =A0#include &lt;asm/unaligned.h&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -static void putstr(const char *ptr);<br>
&gt; &gt; +void putstr(const char *ptr);<br>
&gt; &gt; =A0extern void error(char *x);<br>
&gt; &gt;<br>
&gt; &gt; =A0#include &lt;mach/uncompress.h&gt;<br>
&gt; &gt; @@ -100,7 +100,7 @@ static void icedcc_putc(int ch)<br>
&gt; &gt; =A0#define putc(ch) =A0 =A0 icedcc_putc(ch)<br>
&gt; &gt; =A0#endif<br>
&gt; &gt;<br>
&gt; &gt; -static void putstr(const char *ptr)<br>
&gt; &gt; +void putstr(const char *ptr)<br>
&gt; &gt; =A0{<br>
&gt; &gt; =A0 =A0 =A0 char c;<br>
&gt; &gt;<br>
&gt; &gt; @@ -114,6 +114,60 @@ static void putstr(const char *ptr)<br>
&gt; &gt; =A0}<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; +#ifdef CONFIG_ARM_APPENDED_DTB<br>
&gt; &gt; +/**<br>
&gt; &gt; + * strlen - Find the length of a string<br>
&gt; &gt; + * @s: The string to be sized<br>
&gt; &gt; + */<br>
&gt; &gt; +size_t strlen(const char *s)<br>
&gt; &gt; +{<br>
&gt; &gt; + =A0 =A0 =A0 =A0const char *sc;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 =A0 =A0for (sc =3D s; *sc !=3D &#39;\0&#39;; ++sc)<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* nothing */;<br>
&gt; &gt; + =A0 =A0 =A0 =A0return sc - s;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * strcmp - Compare two strings<br>
&gt; &gt; + * @cs: One string<br>
&gt; &gt; + * @ct: Another string<br>
&gt; &gt; + */<br>
&gt; &gt; +#undef strcmp<br>
&gt; &gt; +int strcmp(const char *cs, const char *ct)<br>
&gt; &gt; +{<br>
&gt; &gt; + =A0 =A0 unsigned char c1, c2;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 while (1) {<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 c1 =3D *cs++;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 c2 =3D *ct++;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 if (c1 !=3D c2)<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return c1 &lt; c2 ? -1 =
: 1;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 if (!c1)<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
&gt; &gt; + =A0 =A0 }<br>
&gt; &gt; + =A0 =A0 return 0;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * memcmp - Compare two areas of memory<br>
&gt; &gt; + * @cs: One area of memory<br>
&gt; &gt; + * @ct: Another area of memory<br>
&gt; &gt; + * @count: The size of the area.<br>
&gt; &gt; + */<br>
&gt; &gt; +#undef memcmp<br>
&gt; &gt; +int memcmp(const void *cs, const void *ct, size_t count)<br>
&gt; &gt; +{<br>
&gt; &gt; + =A0 =A0 const unsigned char *su1, *su2;<br>
&gt; &gt; + =A0 =A0 int res =3D 0;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 for (su1 =3D cs, su2 =3D ct; 0 &lt; count; ++su1, ++su2=
, count--)<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 if ((res =3D *su1 - *su2) !=3D 0)<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
&gt; &gt; + =A0 =A0 return res;<br>
&gt; &gt; +}<br>
&gt; &gt; +#endif<br>
&gt; &gt; +<br>
&gt; &gt; =A0void *memcpy(void *__dest, __const void *__src, size_t __n)<br=
>
&gt; &gt; =A0{<br>
&gt; &gt; =A0 =A0 =A0 int i =3D 0;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; linux-arm-kernel mailing list<br>
&gt; &gt; <a href=3D"mailto:linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org">linux-arm=
-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org</a><br>
&gt; &gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-=
kernel">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a><br=
>
&gt; &gt;<br>
</p>

--001485e7e948d49fd3049b6dbf20--

--===============6893465455685558778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6893465455685558778==--
