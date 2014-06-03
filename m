From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 1/2] pci: Add IORESOURCE_BIT entry for PCIe ECAM
 resources.
Date: Tue, 03 Jun 2014 09:44:59 +0100
Message-ID: <20140603084459.EC01BC4096E@trevor.secretlab.ca>
References: <20140530233034.GH1677@bart.dudau.co.uk>
	<1401496601-31983-1-git-send-email-Liviu.Dudau@arm.com>
	<1401496601-31983-2-git-send-email-Liviu.Dudau@arm.com>
	<4756033.LkcFQN0chs@wuerfel>
	<20140602150945.964D4C40381@trevor.secretlab.ca>
	<390B3F94-C058-47D6-82CE-0393E60014FF@codeaurora.org>
	<20140602162306.4AB0FC40476@trevor.secretlab.ca>
	<2F6515B1-48FE-4ED6-908E-CC1CAD7AF403@codeaurora.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <2F6515B1-48FE-4ED6-908E-CC1CAD7AF403@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robherring2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2 Jun 2014 13:09:08 -0500, Kumar Gala <galak@codeaurora.org> wr=
ote:
>=20
> On Jun 2, 2014, at 11:23 AM, Grant Likely <grant.likely@linaro.org> w=
rote:
>=20
> > On Mon, 2 Jun 2014 10:40:30 -0500, Kumar Gala <galak@codeaurora.org=
> wrote:
> >>=20
> >> On Jun 2, 2014, at 10:09 AM, Grant Likely <grant.likely@linaro.org=
> wrote:
> >>=20
> >>> On Sat, 31 May 2014 20:41:04 +0200, Arnd Bergmann <arnd@arndb.de>=
 wrote:
> >>>> On Saturday 31 May 2014 01:36:40 Liviu Dudau wrote:
> >>>>> We would like to be able to describe PCIe ECAM resources as
> >>>>> IORESOURCE_MEM blocks while distinguish them from standard
> >>>>> memory resources. Add an IORESOURCE_BIT entry for this case.
> >>>>>=20
> >>>>> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> >>>>=20
> >>>> I still don't see any value in this at all. What is the advantag=
e
> >>>> of doing this opposed to just having a standardized 'reg' proper=
ty
> >>>> for a particular compatible string?
> >>>=20
> >>> I'm inclined to agree. It doesn't seem appropriate to put config =
space
> >>> in ranges, and the host controller binding is responsible for
> >>> identifying how config space is memory mapped.
> >>>=20
> >>> g.
> >>=20
> >> I don=E2=80=99t agree when it comes to ECAM, but we can drop this =
for now
> >> until someone really does that.
> >=20
> > Okay, humor me then. What would a ranges property look like for ECA=
M? Do
> > you have an example? I believe there would need to be a separate en=
try
> > for each and every PCI device on the bus to get the config spaces t=
o be
> > contiguous.
>=20
> The definition of ECAM is a 256M linear region with each 4k being a d=
ifferent bus/dev/func.
>=20
> So the ranges would look something like:
>=20
>    ranges =3D <0x00000000 0 0x00000000 0x0ff00000 0 0x10000000>   /* =
configuration space */
>=20
> The reason I think allow an ECAM makes sense in ranges is because it =
allows for a direct IO read/write to CFG space (w/o any mapping) simila=
r to what one would do for MEM space or IO.

I don't think that's right. PCI addresses are defined as follows:
phys.hi cell: npt000ss bbbbbbbb dddddfff rrrrrrrr
phys.mid cell: hhhhhhhh hhhhhhhh hhhhhhhh hhhhhhhh
phys.low cell: llllllll llllllll llllllll llllllll

where 'ddddd' is the device number (0-31) and 'fff' is the function num=
ber (0-7)

Going up by one device number or even function number does not result i=
n
contiguious address values:

device 0: 0x00000000 00000000 00000000
device 1: 0x00000800 00000000 00000000
device 2: 0x00001000 00000000 00000000
device 3: 0x00001800 00000000 00000000
=2E..
device 30:0x0000f000 00000000 00000000
device 31:0x0000f800 00000000 00000000

a simple ranges doesn't work transparently because each of those config
ranges needs to be mapped to a 4k block. I think ranges would need to
look like this:

ranges =3D <0x00000000 0 0  0x0ff00000  0x1000>,
         <0x00000800 0 0  0x0ff01000  0x1000>,
	 <0x00001800 0 0  0x0ff02000  0x1000>,
	 ...
	 <0x0000f000 0 0  0x0ff1e000  0x1000>,
	 <0x0000f800 0 0  0x0ff1f000  0x1000>;

(I just hacked the above up; I make no claims to it's accuracy for
actual address values)

But I don't even thing the semantics work there because the address is
encoded in the phys.hi cell, not the phys.low cell. Incrementing by one
does not behaves as most bus addresses work. To actually work properly
we would have needed a way to define a stride of 64bits when
incrementing config space addresses in a ranges mapping.

> > However, what do we do with the 2 cases that exist in upstream that
> >> are using ranges for cfg space?
> >=20
> > Ignore them in the core code? Make the specific host controller han=
dle
> > them I would think.
>=20
> I just meant, should we =E2=80=98break=E2=80=99 their DTs and move th=
em from using ranges to reg?

If ranges is the only place to get the config space address for those
platforms, and if the support is in mainline, then we can't break it.
=46ix the in-tree dts files, but leave backwards compatible code in the
host controller driver (perhaps with a warning sent to the kernel log).
The best we can do is discourage new boards from using the broken
pattern.

If it /won't/ affect deployed systems then it is okay to remove the
broken behaviour.

g.
