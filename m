From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: ARM_ATAG_DTB_COMPAT fails on fdt_ro.c compiling
Date: Tue, 9 Oct 2012 00:25:44 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1210090018470.16518@xanadu.home>
References: <20121009031715.GC21822@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-597392010-1349756745=:16518"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121009031715.GC21822-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-597392010-1349756745=:16518
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Oct 2012, Shawn Guo wrote:

> I have seen this error on mainline for a couple days when
> ARM_ATAG_DTB_COMPAT is enabled.
>=20
>   CC      arch/arm/boot/compressed/fdt_ro.o
> arch/arm/boot/compressed/fdt_ro.c: In function =E2=80=98fdt_path_offset=
=E2=80=99:
> arch/arm/boot/compressed/fdt_ro.c:172:3: error: implicit declaration of=
 function =E2=80=98fdt_get_alias_namelen=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
> arch/arm/boot/compressed/fdt_ro.c:172:5: warning: assignment makes poin=
ter from integer without a cast [enabled by default]
> arch/arm/boot/compressed/fdt_ro.c: At top level:
> arch/arm/boot/compressed/fdt_ro.c:340:13: error: conflicting types for =
=E2=80=98fdt_get_alias_namelen=E2=80=99
> arch/arm/boot/compressed/fdt_ro.c:172:7: note: previous implicit declar=
ation of =E2=80=98fdt_get_alias_namelen=E2=80=99 was here
> cc1: some warnings being treated as errors

I just tried building mainline now.  It is at commit f5a246eab9.

  [...]
  CC      arch/arm/boot/compressed/misc.o
  CC      arch/arm/boot/compressed/decompress.o
  CC      arch/arm/boot/compressed/string.o
  SHIPPED arch/arm/boot/compressed/fdt_rw.c
  SHIPPED arch/arm/boot/compressed/fdt.h
  SHIPPED arch/arm/boot/compressed/libfdt.h
  SHIPPED arch/arm/boot/compressed/libfdt_internal.h
  CC      arch/arm/boot/compressed/fdt_rw.o
  SHIPPED arch/arm/boot/compressed/fdt_ro.c
  CC      arch/arm/boot/compressed/fdt_ro.o
  SHIPPED arch/arm/boot/compressed/fdt_wip.c
  CC      arch/arm/boot/compressed/fdt_wip.o
  SHIPPED arch/arm/boot/compressed/fdt.c
  CC      arch/arm/boot/compressed/fdt.o
  CC      arch/arm/boot/compressed/atags_to_fdt.o
  SHIPPED arch/arm/boot/compressed/lib1funcs.S
  AS      arch/arm/boot/compressed/lib1funcs.o
  SHIPPED arch/arm/boot/compressed/ashldi3.S
  AS      arch/arm/boot/compressed/ashldi3.o
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready

What config do you use?


Nicolas
--8323328-597392010-1349756745=:16518
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--8323328-597392010-1349756745=:16518--
