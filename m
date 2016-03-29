From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 1/3] vfio, platform: add support for ACPI while detecting the reset driver
Date: Tue, 29 Mar 2016 13:25:42 +0200
Message-ID: <147496989.L43SVC7xRY@wuerfel>
References: <1459172124-6730-1-git-send-email-okaya@codeaurora.org> <98854818.NJS35fvhsb@wuerfel> <e736f6bc775cdca8a4bb0dab20654823@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <e736f6bc775cdca8a4bb0dab20654823@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: okaya@codeaurora.org
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, eric.auger@linaro.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Baptiste Reynal <b.reynal@virtualopensystems.com>, vikrams@codeaurora.org, marc.zyngier@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, vinod.koul@intel.com, Alex Williamson <alex.williamson@redhat.com>, agross@codeaurora.org, Dan Carpenter <dan.carpenter@oracle.com>, shankerd@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tuesday 29 March 2016 06:59:15 okaya@codeaurora.org wrote:
> On 2016-03-29 05:25, Arnd Bergmann wrote:
> > On Monday 28 March 2016 09:35:22 Sinan Kaya wrote:
> >> The code is using the compatible DT string to associate a reset dr=
iver=20
> >> with
> >> the actual device itself. The compatible string does not exist on =
ACPI
> >> based systems. HID is the unique identifier for a device driver=20
> >> instead.
> >> The change allows a driver to register with DT compatible string o=
r=20
> >> ACPI
> >> HID and then match the object with one of these conditions.
> >>=20
> >> Rules for loading the reset driver are as follow:
> >> - ACPI HID needs match for ACPI systems
> >> - DT compat needs to match for OF systems
> >>=20
> >> Tested-by: Eric Auger <eric.auger@linaro.org> (device tree only)
> >> Tested-by: Shanker Donthineni <shankerd@codeaurora.org> (ACPI only=
)
> >> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> >>=20
> >=20
> >=20
> > This really feels wrong for two reasons:
> >=20
> > * device assignment of non-PCI devices is really special and doesn'=
t
> >   seem to make sense on general purpose servers that would be the=20
> > target
> >   for ACPI normally
>=20
>=20
> Why is it special? Acpi is not equal to pci. Platform devices are fir=
st=20
> class devices too. Especially, _cls was introduced for this reason.

It still feels like a hack. The normal design for a server is to have
all internal devices show up on the PCI host bridge, next to the PCIe
ports, to have a simple way to manage any device, both internal and
off-chip. Putting a device on random MMIO registers outside of the
discoverable buses and have the firmware work around the lack of
discoverability will always be inferior.

> >=20
> > * If there is indeed a requirement for ACPI to handle something lik=
e=20
> > this,
> >   it should be part of the ACPI spec, with a well-defined method of=
=20
> > handling
> >   reset, rather than having to add a device specific hack for each
> >   device separately.
> >=20
>=20
> I see. Normally, this is done by calling _rst method. AFAIK, Linux=20
> doesn=E2=80=99t support _rst. I can check its presence and call it if=
 it is=20
> there.

Yes, that sounds reasonable: In patch 2 where you check for the
presence of the reset method, just keep the existing logic for
DT based systems, and use _rst on ACPI based systems instead,
then you can drop both patches 1 and 3.

	Arnd
