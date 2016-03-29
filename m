From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 1/3] vfio, platform: add support for ACPI while detecting the reset driver
Date: Tue, 29 Mar 2016 14:44:20 +0200
Message-ID: <4981390.J9tsJr16lM@wuerfel>
References: <1459172124-6730-1-git-send-email-okaya@codeaurora.org> <147496989.L43SVC7xRY@wuerfel> <8f766d081b33d91f196e7bd5e13b6f33@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8f766d081b33d91f196e7bd5e13b6f33@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: okaya@codeaurora.org
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, eric.auger@linaro.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Baptiste Reynal <b.reynal@virtualopensystems.com>, vikrams@codeaurora.org, marc.zyngier@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, vinod.koul@intel.com, Alex Williamson <alex.williamson@redhat.com>, agross@codeaurora.org, Dan Carpenter <dan.carpenter@oracle.com>, shankerd@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tuesday 29 March 2016 08:15:42 okaya@codeaurora.org wrote:
> >> >
> >> > * If there is indeed a requirement for ACPI to handle something =
like
> >> > this,
> >> >   it should be part of the ACPI spec, with a well-defined method=
 of
> >> > handling
> >> >   reset, rather than having to add a device specific hack for ea=
ch
> >> >   device separately.
> >> >
> >>=20
> >> I see. Normally, this is done by calling _rst method. AFAIK, Linux
> >> doesn=E2=80=99t support _rst. I can check its presence and call it=
 if it is
> >> there.
> >=20
> > Yes, that sounds reasonable: In patch 2 where you check for the
> > presence of the reset method, just keep the existing logic for
> > DT based systems, and use _rst on ACPI based systems instead,
> > then you can drop both patches 1 and 3.
> >=20
>=20
> I can certainly drop patch #3 and push the reset responsibility to ac=
pi.
>=20
> I never liked having a fragmented sw design across multiple drivers.
>=20
> I need something for patch #1. Compatible is a DT property not ACPI.b=
ut=20
> then, I won't have a reset driver anymore.
>=20
> If we think about how vfio pci works, we pass the pci vendor and devi=
ce=20
> id to new_id file to find out which pci device needs to be pass thru.
>=20
> I can go to a similar route. This time we pass the object id through=20
> new_id and I call reset method on this object.
>=20
> Let me know what you think?

It would certainly be nice to make it work more like PCI VFIO does
here, where you can assign any device as long as it has an IOMMU
(and a _rst method in this case).

	Arnd
