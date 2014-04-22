From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v5 2/4] arm64: dts: APM X-Gene PCIe device tree nodes
Date: Tue, 22 Apr 2014 13:49:37 +0100
Message-ID: <20140422124937.GE865@e106497-lin.cambridge.arm.com>
References: <1395270762-6055-1-git-send-email-tinamdar@apm.com>
 <1395270762-6055-3-git-send-email-tinamdar@apm.com>
 <CAL_Jsq+XxAtUeNKFi0hH=ehb_fhFvkM0U1Zm_j1LdtQZbvSzfA@mail.gmail.com>
 <20140416170545.GD4858@bart>
 <20140416212104.GA3469@obsidianresearch.com>
 <20140417002041.GE4858@bart>
 <20140417012434.GA8734@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140417012434.GA8734@obsidianresearch.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Rob Herring <robherring2@gmail.com>, Tanmay Inamdar <tinamdar@apm.com>, Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Rob Landley <rob@landley.net>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patches@apm.com" <patches@apm.com>, "jcm@redhat.com" <jcm@redhat.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 17, 2014 at 02:24:34AM +0100, Jason Gunthorpe wrote:
> On Thu, Apr 17, 2014 at 01:20:42AM +0100, Liviu Dudau wrote:
>=20
> > > No spec says you can put config space into the ranges at all, nob=
ody
> > > should be doing that today, obviously some cases were missed duri=
ng
> > > review..
> >=20
> > ePAPR documents allows that when ss =3D=3D 00.
>=20
> Which do you mean? The 'PCI Bus Binding' spec has fairly specific
> language on how ranges should be used and interpreted, and it
> precludes doing anything meaningful with config space (like requiring
> b,d,f and r to be zeroed when doing compares against ranges, requirin=
g
> the ranges to represent the bridge windows, etc).
>=20
> There is certainly room to invent something (like ECAM mapping) but
> nothing is specified in that document.

On more carefull reading of the Power_ePAPR_APPROVED_v1.0.pdf document
that I have I agree, there is no meaningful way of describing one's
config ranges.

>=20
> The ePAPR document I have doesn't talk about PCI..
>=20
> If you've found a document that defines how it works then that change=
s
> things.. ;)
>=20
> > > The comment about ECAM was intended as a general guidance on what
> > > config space in ranges could/should be used for.
> > >=20
> > > Right now config space shouldn't propagate out side any driver, s=
o you
> > > can probably just filter it in your generic code, and make it ver=
y hard
> > > and obviously wrong for a driver to parse ranges for config space=
, so
> > > we don't get more usages.
> >=20
> > OK, this goes slightly against your email from 26th March:
> >=20
> > "When we talked about this earlier on the DT bindings list the
> > consensus seemed to be that configuration MMIO ranges should only b=
e
> > used if the underlying memory was exactly ECAM, and was not to be u=
sed
> > for random configuration related register blocks.
> >=20
> > The rational being that generic code, upon seeing that ranges entry=
,
> > could just go ahead and assume ECAM mapping."
> >=20
> > What I'm saying is that the only code that will see this ranges ent=
ry will
> > be the parsing code as if we try to create a resource out of the ra=
nge
> > and add it to the host bridge structure (not driver) we will confus=
e the
> > rest of the pci_host_bridge API. So we cannot do any ECAM accesses =
(yet?).
>=20
> Sorry if this seems unclear, what you quoted was from a specification
> standpoint - someday defining config space ranges to be the ECAM
> window makes the most sense. This is from the direction of precluding
> drivers from using it for random purposes.
>=20
> From a Linux standpoint, there is simply no infrastructure for generi=
c
> config access outside the driver, so config space must remain
> contained in the driver, and shouldn't leak into the host bridge or
> other core structures.
>=20
> I think the shared code you are working on should simply ignore confi=
g
> ss ranges entirely, they have no defined meaning..

Agree. Less things to code for is always better!

Best regards,
Liviu

>=20
> Regards,
> Jason
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
