From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Tue, 11 Dec 2018 13:46:51 +0200
Message-ID: <87k1kgmgk4.fsf@linux.intel.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com> <1544445555-17325-3-git-send-email-pawell@cadence.com> <5C0F85E4.10609@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5C0F85E4.10609@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, Pawel Laszczak <pawell@cadence.com>, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Roger Quadros <rogerq@ti.com> writes:
>> This patch introduce new Cadence USBSS DRD driver
>> to linux kernel.
>>=20
>> The Cadence USBSS DRD Driver is a highly
>> configurable IP Core which can be
>> instantiated as Dual-Role Device (DRD),
>> Peripheral Only and Host Only (XHCI)
>> configurations.
>>=20
>> The current driver has been validated with
>> FPGA burned. We have support for PCIe
>> bus, which is used on FPGA prototyping.
>>=20
>> The host side of USBSS-DRD controller is compliance
>> with XHCI specification, so it works with
>> standard XHCI linux driver.
>>=20
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>>  drivers/usb/Kconfig                |    2 +
>>  drivers/usb/Makefile               |    2 +
>>  drivers/usb/cdns3/Kconfig          |   44 +
>>  drivers/usb/cdns3/Makefile         |   16 +
>>  drivers/usb/cdns3/cdns3-pci-wrap.c |  157 +++
>>  drivers/usb/cdns3/core.c           |  451 +++++++
>>  drivers/usb/cdns3/core.h           |  108 ++
>>  drivers/usb/cdns3/debug.h          |  346 ++++++
>>  drivers/usb/cdns3/debugfs.c        |  168 +++
>>  drivers/usb/cdns3/drd.c            |  315 +++++
>>  drivers/usb/cdns3/drd.h            |  129 ++
>>  drivers/usb/cdns3/ep0.c            |  864 +++++++++++++
>>  drivers/usb/cdns3/gadget-export.h  |   28 +
>>  drivers/usb/cdns3/gadget.c         | 1802 ++++++++++++++++++++++++++++
>>  drivers/usb/cdns3/gadget.h         | 1177 ++++++++++++++++++
>>  drivers/usb/cdns3/host-export.h    |   28 +
>>  drivers/usb/cdns3/host.c           |   74 ++
>>  drivers/usb/cdns3/trace.c          |   11 +
>>  drivers/usb/cdns3/trace.h          |  343 ++++++
>
> You went to the other extreme of combining everything (host/gadget/drd) t=
ogether
> which again makes this very hard to review.
>
> I think what Felipe meant was to only combine the gadget driver code
> into one patch.
>
> The series could be split into 6 patches like so.
> -dt binding
> -pci glue
> -core driver
> -host driver
> -gadget driver
> -drd driver

no, no. This is fine. We _could_ split out PCI glue to its own patch,
but it's rather pointless seing as it's so small.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlwPo60ACgkQzL64meEa
mQYVaQ//SWD7ik1bFKOvm13A8mLphPuwef4FHi75UJ26VKbdTqfoUwMyYzxH1Qn/
nIePbHRunPNhonrNGpzKM0t6qfd5h9DYhGp2t6Vp0rQxacHHhFPG5GXlYTXbbeqW
y7A2A+PMmDhfmgU1+4ywVUC3dyFTGVeETu9WDa+oemw5LMlMDSgr/5518lzE9zqW
oxqRqNe1ucXwGoYLN5MjCsco+ojL3Km/FWBsrbXQfg1DSNLXXLW6FJu+8uMsunMC
EvCTKk9VxUtgtrQoIbkTo1+DBfK26tfvKN2v01Yi8xrxMrvMc8JHtYBpis4O+jcw
By8flXBvvI3tYJ/fFgqJlkRFdmu8UXyyi59oEyEj7QEklBwVg3ePtsDkJwBNWhS4
cAyySDe2MZB922fP3lA2s0AQxq5Sgc9DvA0zskqax1eqHC2AJpjvhxvbf8utnl+Q
LZdXBjNaJ7uQEtQEd8e4R8cZSeQmmKDOuy3+4e6ZV4jbR95Xz1CGEJaK+2bvRj/x
odAULfkl93p+oGjwYAEEOCptkaCH6aMv9bUt7eaX9hMMgkY3Mg46KIjmg4WoPtq3
DqTgr3ajXzUyL5OxsowBqzc5s7dZoi60PJcSoeeU7NUFqkqyEH7w89iiMbxuDdtv
z3bB+r5rWd8I9Vq7vyLibnBioa/7rq6KE+VKiKfZQnRmf9RRhwc=
=qvrM
-----END PGP SIGNATURE-----
--=-=-=--
