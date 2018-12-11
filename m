From: Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Tue, 11 Dec 2018 14:15:39 +0200
Message-ID: <87d0q8mf84.fsf@linux.intel.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com> <1544445555-17325-3-git-send-email-pawell@cadence.com> <5C0F85E4.10609@ti.com> <BYAPR07MB47095A5EEBC106EE7CD0E078DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB47095A5EEBC106EE7CD0E078DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Pawel Laszczak <pawell@cadence.com> writes:
>>I think what Felipe meant was to only combine the gadget driver code into=
 one patch.
>>
>>The series could be split into 6 patches like so.
>>-dt binding
>>-pci glue
>>-core driver
>>-host driver
>>-gadget driver
>>-drd driver
>
> Felipe wrote:
> "=20
> Frankly, I don't understand why this is a series. It's a single driver
> and splitting it into a series just makes it more difficult to review,
> actually.
>
> Sure, a single patch will be large, but there's no way to have a
> functional driver until all patches are applied, anyway.
> "
>
> Felipe should I split this driver as suggested by Roger ?.=20
> Now it's very big patch but it's still a single driver.

don't bother. It's far easier to review as it is.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlwPqmsACgkQzL64meEa
mQZPmQ//esDJQg93nkGwEMz/n7dBD/KM+sQAtvq4SeIeOwgcS0YyLYWFtu+lHxMJ
S3+6BIkWVQksJ/38yscj6pohIjNLENdHDYKgqQDWf5bPJdLKXim4BJQ66I5b36VW
C8RdDf55uzOgNVs4+3cwpVUoUTXRwmAdl/Hl3lj2VEYDnyYEl+r8LwHRue0D9JeK
CrIlseRcHISvFEMjAN/0llqCBzDc4gvWU2nu+xiSfe2quPDzOP4ew0mdNr3diAo/
QvkIAIDsCumQ7QumURLHhgPq4+BG5wdnYXGDlHyMx5UiiQgRXWjyZoc9ifJqA2mJ
dgn+w7ZRNru1T108kC24zCIuoEvMb7pO9rEK2BclhGBMDreleEdOVnfFNoSno/Av
5ehkQJpeSlGMguskkZ2jFZMCRL9Io813yqq/rV872xoyHVqSIIRWCJCAVa010oRm
o52j+V5ezs9DyKnHMJJFVAHRF6BbWP7LQEgMVP24q0CQ+4+KySpAMtD0/iruSOCO
W5GS6fwrRyfXIi9ex4AQS7Eb5bJs1GMVSiGkMP+8xTJnzWW+rcj03xmU8y8kHbGq
lLxeR+3982xdCibam/7OVQEU6OFybxGByQzhsYSjgSZwo2BUD9P03zJcDkcF1bc4
e9uCfDmZqHS17h2yPuFMOEM8WaQLE5ueSY16PwDzUfB5WjJg8B8=
=HuLJ
-----END PGP SIGNATURE-----
--=-=-=--
