From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 0/9] Support for creating generic PCI host bridges
 from DT
Date: Mon, 7 Jul 2014 12:12:52 +0100
Message-ID: <20140707111252.GQ6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <CAL_JsqK_CfagmiFOpOXVYGry22nGnCZL0ZXeJhYxb9zp=P2fsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK_CfagmiFOpOXVYGry22nGnCZL0ZXeJhYxb9zp=P2fsQ@mail.gmail.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, Device Tree ML <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 06, 2014 at 04:23:43PM +0100, Rob Herring wrote:
> On Tue, Jul 1, 2014 at 1:43 PM, Liviu Dudau <Liviu.Dudau@arm.com> wro=
te:
> > This is my resurected attempt at adding support for generic PCI hos=
t
> > bridge controllers that make use of device tree information to
> > configure themselves. I've tagged it as v8 although the patches
> > have now been reshuffled in order to ease adoption so referring to
> > the older versions might be a bit of a hoop jumping exercise.
> >
> > Changes from v7:
> >   - Reordered the patches so that fixes and non-controversial patch=
es
> >     from v7 can be accepted more easily. If agreed I can split the
> >     series again into patches that can be upstreamed easily and one=
s
> >     that still need discussion.
> >   - Moved the of_create_host_bridge() function to drivers/of/of_pci=
=2Ec
> >     to better reflect its target use.
> >   - Added the function to remap the bus I/O resources that used to =
be
> >     provided in my arm64 patch series and (re)named it pci_remap_io=
space()
> >   - Removed error code checking from parsing and mapping of IRQ fro=
m DT
> >     in recognition that some PCI devices will not have legacy IRQ m=
appings.
> >
> > v7 thread here with all the historic information: https://lkml.org/=
lkml/2014/3/14/279
>=20
> Can you publish a branch for this series please.

Do you want a branch that has the series as publised (+the one obvious =
miss
on the header include) or a branch that has the comments rolled in, but=
 is
is not published yet as I'm waiting on answers from Bjorn regarding dom=
ain
number handling?

Best regards,
Liviu

>=20
> Rob
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
