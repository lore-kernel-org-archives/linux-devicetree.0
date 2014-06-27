From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 1/6] pci: Introduce pci_register_io_range() helper
 function.
Date: Fri, 27 Jun 2014 16:18:11 +0100
Message-ID: <20140627151811.GA12812@e106497-lin.cambridge.arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <20140405001953.GE15806@google.com>
 <20140407083120.GE17163@e106497-lin.cambridge.arm.com>
 <5183143.FxBNM0xTAV@wuerfel>
 <CAErSpo4iEV6khP63ZTF+YUTKi9WLFXzMv13nxw15y3qDg15Ztg@mail.gmail.com>
 <20140626085926.GB11244@arm.com>
 <CAL_JsqKCHf6VXR3FFcBSu1xuhP54dYsAJCZwT-X9p5iTZAOJfQ@mail.gmail.com>
 <20140627141451.GJ15296@arm.com>
 <CAErSpo7nhqJGXcnY4FO=6CZtYdSY0qNUyRSP3nnxAUO5L6c+jA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAErSpo7nhqJGXcnY4FO=6CZtYdSY0qNUyRSP3nnxAUO5L6c+jA@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>, Rob Herring <robherring2@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Tanmay Inamdar <tinamdar@apm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jon Masters <jonathan@jonmasters.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Michal Simek <monstr@monstr.eu>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 27, 2014 at 03:55:04PM +0100, Bjorn Helgaas wrote:
> On Fri, Jun 27, 2014 at 8:14 AM, Catalin Marinas
> <catalin.marinas@arm.com> wrote:
> > ...
> > With Liviu's latest version (not posted) and with
> > of_create_pci_host_bridge() function moved to of_pci.c, I don't thi=
nk
> > there is much new functionality added to drivers/pci/. What I think=
 we
> > need is clarifying the domain_nr patch (and API change) and more us=
ers
> > of the new generic code. As you said, it doesn't need to be a separ=
ate
> > architecture but rather existing pci host drivers under drivers/pci=
=2E Of
> > course, other arch conversion should follow shortly as well but eve=
n
> > without an immediate conversion, I don't see too much additional
> > maintenance burden for the core PCIe code (and code sharing between=
 new
> > PCIe host drivers is even more beneficial).
>=20
> Sorry, I haven't had time to follow this.  It sounds like there are
> several pieces we could get out of the way easily.  How about posting
> the actual patches again?  Maybe re-order them so the easy pieces are
> first so they can get applied even if there are issues with later
> ones?

OK, I will post a new series on Monday.

Thanks,
Liviu

>=20
> Bjorn
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
