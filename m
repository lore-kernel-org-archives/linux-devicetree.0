From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 0/9] Support for creating generic PCI host bridges
 from DT
Date: Fri, 11 Jul 2014 10:11:39 +0100
Message-ID: <20140711091139.GM6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <CAL_JsqK_CfagmiFOpOXVYGry22nGnCZL0ZXeJhYxb9zp=P2fsQ@mail.gmail.com>
 <20140708171828.GM6501@e106497-lin.cambridge.arm.com>
 <CACoXjcn3b7otcbxdr+RAVNHHjHyVsvw0QcmK5jd-QBF8SQX5iw@mail.gmail.com>
 <004501cf9cda$65703610$3050a230$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <004501cf9cda$65703610$3050a230$%han@samsung.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Tanmay Inamdar' <tinamdar@apm.com>, 'Rob Herring' <robherring2@gmail.com>, 'linux-pci' <linux-pci@vger.kernel.org>, 'Bjorn Helgaas' <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, 'Benjamin Herrenschmidt' <benh@kernel.crashing.org>, 'Arnd Bergmann' <arnd@arndb.de>, 'linaro-kernel' <linaro-kernel@lists.linaro.org>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Sinan Kaya' <okaya@codeaurora.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Suravee Suthikulanit' <suravee.suthikulpanit@amd.com>, 'Device Tree ML' <devicetree@vger.kernel.org>, 'LKML' <linux-kernel@vger.kernel.org>, 'LAKML' <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 11, 2014 at 08:33:23AM +0100, Jingoo Han wrote:
> On Friday, July 11, 2014 9:44 AM, Tanmay Inamdar wrote:
> > On Tue, Jul 8, 2014 at 10:18 AM, Liviu Dudau <Liviu.Dudau@arm.com> =
wrote:
> > > On Sun, Jul 06, 2014 at 04:23:43PM +0100, Rob Herring wrote:
> > >> On Tue, Jul 1, 2014 at 1:43 PM, Liviu Dudau <Liviu.Dudau@arm.com=
> wrote:
> > >> > This is my resurected attempt at adding support for generic PC=
I host
> > >> > bridge controllers that make use of device tree information to
> > >> > configure themselves. I've tagged it as v8 although the patche=
s
> > >> > have now been reshuffled in order to ease adoption so referrin=
g to
> > >> > the older versions might be a bit of a hoop jumping exercise.
> > >> >
> > >> > Changes from v7:
> > >> >   - Reordered the patches so that fixes and non-controversial =
patches
> > >> >     from v7 can be accepted more easily. If agreed I can split=
 the
> > >> >     series again into patches that can be upstreamed easily an=
d ones
> > >> >     that still need discussion.
> > >> >   - Moved the of_create_host_bridge() function to drivers/of/o=
f_pci.c
> > >> >     to better reflect its target use.
> > >> >   - Added the function to remap the bus I/O resources that use=
d to be
> > >> >     provided in my arm64 patch series and (re)named it pci_rem=
ap_iospace()
> > >> >   - Removed error code checking from parsing and mapping of IR=
Q from DT
> > >> >     in recognition that some PCI devices will not have legacy =
IRQ mappings.
> > >> >
> > >> > v7 thread here with all the historic information: https://lkml=
=2Eorg/lkml/2014/3/14/279
> > >>
> > >> Can you publish a branch for this series please.
> > >>
> > >> Rob
> > >>
> > >
> > > Hi Rob,
> > >
> > > I have pushed a brach that matches my v8 patchset +1 obvious miss=
ing header include
> > > here: http://www.linux-arm.org/git?p=3Dlinux-ld.git;a=3Dshortlog;=
h=3Drefs/heads/for-upstream/pci_v8
> > >
> >=20
> > I was still getting following compilation error after applying arm6=
4
> > pci headers. Please let me know if I am missing something.
> >=20
> > linux-git/drivers/of/of_pci.c: In function =E2=80=98pci_host_bridge=
_of_get_ranges=E2=80=99:
> > linux-git/drivers/of/of_pci.c:114:22: error: storage size of =E2=80=
=98range=E2=80=99 isn=E2=80=99t known
> >   struct of_pci_range range;
> >                       ^
> > linux-git/drivers/of/of_pci.c:115:29: error: storage size of =E2=80=
=98parser=E2=80=99
> > isn=E2=80=99t known
> >   struct of_pci_range_parser parser;
> >                              ^
> > linux-git/drivers/of/of_pci.c:121:2: error: implicit declaration of
> > function =E2=80=98of_pci_range_parser_init=E2=80=99
> > [-Werror=3Dimplicit-function-declaration]
> >   err =3D of_pci_range_parser_init(&parser, dev);
> >=20
> >=20
> > Below patch fixes the errors.
> >=20
> > diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> > index 55d8320..da88dac 100644
> > --- a/drivers/of/of_pci.c
> > +++ b/drivers/of/of_pci.c
> > @@ -2,6 +2,7 @@
> >  #include <linux/export.h>
> >  #include <linux/of.h>
> >  #include <linux/of_pci.h>
> > +#include <linux/of_address.h>
>=20
> Yes, right. I also found the build errors as above mentioned.
> "of_address.h" should be included, in order to fix the build errors.
> However, for readability, the following would be better.
>=20
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_pci.h>
>=20
> Best regards,
> Jingoo Han


Thanks, guys! Like I've said, it was not my day when I've submitted v8 =
series.
I've cherry picked the patches into a clean branch but forgot to be tho=
rough
and was compiling in the old working directory.

Sorry,
Liviu

>=20
> >=20
> >  static inline int __of_pci_pci_compare(struct device_node *node,
> >                                        unsigned int data)
> >=20
> >=20
> > > Best regards,
> > > Liviu

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
