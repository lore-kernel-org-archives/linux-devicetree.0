From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 1/6] pci: Introduce pci_register_io_range() helper
 function.
Date: Thu, 26 Jun 2014 10:30:29 +0100
Message-ID: <20140626093029.GB12812@e106497-lin.cambridge.arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <20140405001953.GE15806@google.com>
 <20140407083120.GE17163@e106497-lin.cambridge.arm.com>
 <5183143.FxBNM0xTAV@wuerfel>
 <CAErSpo4iEV6khP63ZTF+YUTKi9WLFXzMv13nxw15y3qDg15Ztg@mail.gmail.com>
 <20140626085926.GB11244@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140626085926.GB11244@arm.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Jon Masters <jonathan@jonmasters.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 26, 2014 at 09:59:26AM +0100, Catalin Marinas wrote:
> (sorry for replying to a months old thread)
>=20
> On Mon, Apr 07, 2014 at 06:58:24PM +0100, Bjorn Helgaas wrote:
> > On Mon, Apr 7, 2014 at 5:36 AM, Arnd Bergmann <arnd@arndb.de> wrote=
:
> >=20
> > > I think migrating other architectures to use the same code should=
 be
> > > a separate effort from adding a generic implementation that can b=
e
> > > used by arm64. It's probably a good idea to have patches to conve=
rt
> > > arm32 and/or microblaze.
> >=20
> > Let me reiterate that I am 100% in favor of replacing arch-specific
> > code with more generic implementations.
> >=20
> > However, I am not 100% in favor of doing it as separate efforts
> > (although maybe I could be convinced).  The reasons I hesitate are
> > that (1) if only one architecture uses a new "generic" implementati=
on,
> > we really don't know whether it is generic enough, (2) until I see =
the
> > patches to convert other architectures, I have to assume that I'm t=
he
> > one who will write them, and (3) as soon as we add the code to
> > drivers/pci, it becomes partly my headache to maintain it, even if
> > only one arch benefits from it.
>=20
> I agree and understand your point.
>=20
> > Please don't think I'm questioning anyone's intent or good will.  I=
t's
> > just that I understand the business pressures, and I know how hard =
it
> > can be to justify this sort of work to one's management, especially
> > after the immediate problem has been solved.
>=20
> But, unfortunately, that's something we failed to address in reasonab=
le
> time (even though I was one of the proponents of the generic PCIe
> implementation). This work is very likely to slip further into the la=
te
> part of this year and I am aware that several ARM partners are blocke=
d
> on the (upstream) availability of PCIe support for the arm64 kernel.
>=20
> Although a bit late, I'm raising this now and hopefully we'll come to=
 a
> conclusion soon. Delaying arm64 PCIe support even further is not a re=
al
> option, which leaves us with:
>=20
> 1. Someone else (with enough PCIe knowledge) volunteering to take ove=
r
>    soon or
> 2. Dropping Liviu's work and going for an arm64-specific implementati=
on
>    (most likely based on the arm32 implementation, see below)
>=20
> First option is ideal but there is work to do as laid out by Arnd her=
e:
>=20
> http://article.gmane.org/gmane.linux.kernel/1679304
>=20
> The latest patches from Liviu are here (they only target arm64 and th=
ere
> are additional comments to be addressed from the above thread):
>=20
> http://linux-arm.org/git?p=3Dlinux-ld.git;a=3Dshortlog;h=3Drefs/heads=
/for-upstream/pci-next
>=20
> The main reason for the second option is timing. We could temporarily
> move Liviu's code under arch/arm64 with the hope that we generalise i=
t
> later. However, the risk is even higher that once the code is in
> mainline, the generic implementation won't happen. In which case, I
> don't see much point in departing from the arm32 PCI API, making bios=
32
> clone the best second option.
>=20
> For the alternative implementation above, we already have a heavily c=
ut
> down version of the arm32 PCI support but only tested in a virtual
> environment so far:
>=20
> https://git.kernel.org/cgit/linux/kernel/git/will/linux.git/log/?h=3D=
pci/bios32
>=20
> In conclusion, unless someone volunteers for the first option fairly
> soon, we'll post the alternative patches for review and take it from
> there.

That would be a huge step backwards IMO and a huge dissapointment. If
you go with the alternative patches from Will you will basically reset
every partner's implementation that has been built on top of my
patches (when they did so with the understanding that my series will be
the one ARM will support and publish) *and* make anyone's attempt to
create a generic implementation harder, as they will have to undo this
code to remove the arch-specific parts.

While I have part of a personal blame to carry as I have dragged some
of the work for too long, there are things that I could not have done
differently due to internal pressure inside the project I work on. It
is my intent to resume work on it as soon as possible, but life is
such at the moment that I have to dedicate my time to other things.

Best regards,
Liviu

>=20
> Thanks.
>=20
> --=20
> Catalin

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
