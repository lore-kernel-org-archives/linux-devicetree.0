From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/flattree: Use common ALIGN() macro instead of
	archspecific _ALIGN
Date: Fri, 25 Jun 2010 17:16:24 -0600
Message-ID: <AANLkTilvOpCVrbT4YPaw3NZUCnKgUN7IUQzQGMfihbSG@mail.gmail.com>
References: <20100625220300.6903.3519.stgit@angua>
	<b392c10f-78bb-466d-a3e0-cf5b95edb4cb@VA3EHSMHS014.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <b392c10f-78bb-466d-a3e0-cf5b95edb4cb-+Ck8Kgl/v0/UuUXyfqFqSbjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 25, 2010 at 4:49 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Grant,
>
> I need this for the PCI project. =A0I also have a couple of other
> generalizations of the drivers/of code
> to get it to run after boot time in an X86 system...

Send me your patches!  :-)  Get them to me soon and I'll queue them up
for the next merge window.

g.

>
> Steve
>
> Reviewed-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>
>> -----Original Message-----
>> From:
> devicetree-discuss-bounces+stephen.neuendorffer=3Dxilinx.com-uLR06cmDAlaKREJ1Ck/qmQ@public.gmane.org
> org [mailto:devicetree-
>> discuss-bounces+stephen.neuendorffer=3Dxilinx.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On
> Behalf Of Grant Likely
>> Sent: Friday, June 25, 2010 3:03 PM
>> To: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
>> Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org;
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-
>> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org;
> sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
>> Subject: [PATCH] of/flattree: Use common ALIGN() macro instead of
> archspecific _ALIGN
>>
>> There's no reason to use the powerpc-specific _ALIGN macro in the fdt
>> code. =A0Replace it with ALIGN() from kernel.h
>>
>> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> ---
>> =A0arch/microblaze/include/asm/page.h | =A0 =A07 -------
>> =A0drivers/of/fdt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 20 +++++++=
+++----------
>> =A02 files changed, 10 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/microblaze/include/asm/page.h
> b/arch/microblaze/include/asm/page.h
>> index 464ff32..2fd4761 100644
>> --- a/arch/microblaze/include/asm/page.h
>> +++ b/arch/microblaze/include/asm/page.h
>> @@ -39,13 +39,6 @@
>> =A0#define PAGE_UP(addr)
> (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
>> =A0#define PAGE_DOWN(addr) =A0 =A0 =A0((addr)&(~((PAGE_SIZE)-1)))
>>
>> -/* align addr on a size boundary - adjust address up/down if needed
> */
>> -#define _ALIGN_UP(addr, size)
> (((addr)+((size)-1))&(~((size)-1)))
>> -#define _ALIGN_DOWN(addr, size) =A0 =A0 =A0((addr)&(~((size)-1)))
>> -
>> -/* align addr on a size boundary - adjust address up if needed */
>> -#define _ALIGN(addr, size) =A0 _ALIGN_UP(addr, size)
>> -
>> =A0#ifndef CONFIG_MMU
>> =A0/*
>> =A0 * PAGE_OFFSET -- the first address of the first page of memory. When
> not
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index b6987bb..d61fda8 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -69,9 +69,9 @@ int __init of_scan_flat_dt(int (*it)(unsigned long
> node,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 sz =3D be32_to_cpup((__b=
e32 *)p);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p +=3D 8;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (be32_to_cpu(initial_boot=
_params->version) <
> 0x10)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D _ALIGN(p=
, sz >=3D 8 ? 8 : 4);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D ALIGN(p,=
 sz >=3D 8 ? 8 : 4);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p +=3D sz;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D _ALIGN(p, 4);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D ALIGN(p, 4);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (tag !=3D OF_DT_BEGIN_NODE) {
>> @@ -80,7 +80,7 @@ int __init of_scan_flat_dt(int (*it)(unsigned long
> node,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 depth++;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pathp =3D (char *)p;
>> - =A0 =A0 =A0 =A0 =A0 =A0 p =3D _ALIGN(p + strlen(pathp) + 1, 4);
>> + =A0 =A0 =A0 =A0 =A0 =A0 p =3D ALIGN(p + strlen(pathp) + 1, 4);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((*pathp) =3D=3D '/') {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char *lp, *np;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (lp =3D NULL, np =3D pat=
hp; *np; np++)
>> @@ -109,7 +109,7 @@ unsigned long __init of_get_flat_dt_root(void)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 p +=3D 4;
>> =A0 =A0 =A0 BUG_ON(be32_to_cpup((__be32 *)p) !=3D OF_DT_BEGIN_NODE);
>> =A0 =A0 =A0 p +=3D 4;
>> - =A0 =A0 return _ALIGN(p + strlen((char *)p) + 1, 4);
>> + =A0 =A0 return ALIGN(p + strlen((char *)p) + 1, 4);
>> =A0}
>>
>> =A0/**
>> @@ -138,7 +138,7 @@ void *__init of_get_flat_dt_prop(unsigned long
> node, const char *name,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 noff =3D be32_to_cpup((__be32 *)(p + 4));
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 p +=3D 8;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (be32_to_cpu(initial_boot_params->version=
) < 0x10)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D _ALIGN(p, sz >=3D 8 ? 8 =
: 4);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D ALIGN(p, sz >=3D 8 ? 8 :=
 4);
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 nstr =3D find_flat_dt_string(noff);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (nstr =3D=3D NULL) {
>> @@ -151,7 +151,7 @@ void *__init of_get_flat_dt_prop(unsigned long
> node, const char *name,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return (void *)p;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 p +=3D sz;
>> - =A0 =A0 =A0 =A0 =A0 =A0 p =3D _ALIGN(p, 4);
>> + =A0 =A0 =A0 =A0 =A0 =A0 p =3D ALIGN(p, 4);
>> =A0 =A0 =A0 } while (1);
>> =A0}
>>
>> @@ -184,7 +184,7 @@ static void *__init unflatten_dt_alloc(unsigned
> long *mem, unsigned long size,
>> =A0{
>> =A0 =A0 =A0 void *res;
>>
>> - =A0 =A0 *mem =3D _ALIGN(*mem, align);
>> + =A0 =A0 *mem =3D ALIGN(*mem, align);
>> =A0 =A0 =A0 res =3D (void *)*mem;
>> =A0 =A0 =A0 *mem +=3D size;
>>
>> @@ -220,7 +220,7 @@ unsigned long __init unflatten_dt_node(unsigned
> long mem,
>> =A0 =A0 =A0 *p +=3D 4;
>> =A0 =A0 =A0 pathp =3D (char *)*p;
>> =A0 =A0 =A0 l =3D allocl =3D strlen(pathp) + 1;
>> - =A0 =A0 *p =3D _ALIGN(*p + l, 4);
>> + =A0 =A0 *p =3D ALIGN(*p + l, 4);
>>
>> =A0 =A0 =A0 /* version 0x10 has a more compact unit name here instead of=
 the
> full
>> =A0 =A0 =A0 =A0* path. we accumulate the full path size using "fpsize", =
we'll
> rebuild
>> @@ -299,7 +299,7 @@ unsigned long __init unflatten_dt_node(unsigned
> long mem,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 noff =3D be32_to_cpup((__be32 *)((*p) + 4));
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 *p +=3D 8;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (be32_to_cpu(initial_boot_params->version=
) < 0x10)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *p =3D _ALIGN(*p, sz >=3D 8 ? =
8 : 4);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *p =3D ALIGN(*p, sz >=3D 8 ? 8=
 : 4);
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pname =3D find_flat_dt_string(noff);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pname =3D=3D NULL) {
>> @@ -333,7 +333,7 @@ unsigned long __init unflatten_dt_node(unsigned
> long mem,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *prev_pp =3D pp;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prev_pp =3D &pp->next;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 =A0 =A0 =A0 =A0 *p =3D _ALIGN((*p) + sz, 4);
>> + =A0 =A0 =A0 =A0 =A0 =A0 *p =3D ALIGN((*p) + sz, 4);
>> =A0 =A0 =A0 }
>> =A0 =A0 =A0 /* with version 0x10 we may not have the name property, recr=
eate
>> =A0 =A0 =A0 =A0* it here from the unit name if absent
>>
>> _______________________________________________
>> devicetree-discuss mailing list
>> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
>
> This email and any attachments are intended for the sole use of the named=
 recipient(s) and contain(s) confidential information that may be proprieta=
ry, privileged or copyrighted under applicable law. If you are not the inte=
nded recipient, do not read, copy, or forward this email message or any att=
achments. Delete this email message and any attachments immediately.
>
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
