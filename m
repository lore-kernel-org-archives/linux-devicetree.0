From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: RE: [PATCH v3 2/6] usb:common Separated decoding functions from dwc3 driver.
Date: Mon, 11 Feb 2019 15:20:04 +0200
Message-ID: <87sgwu5unv.fsf@linux.intel.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com> <1548935553-452-3-git-send-email-pawell@cadence.com> <20190204114502.GA28608@kroah.com> <87y36vmyeb.fsf@linux.intel.com> <BYAPR07MB4709A40204EF528F8A04E1EDDD640@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709A40204EF528F8A04E1EDDD640@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Pawel Laszczak <pawell@cadence.com> writes:
>>>> +/**
>>>> + * usb_decode_ctrl - Returns human readable representation of control=
 request.
>>>> + * @str: buffer to return a human-readable representation of control =
request.
>>>> + *       This buffer should have about 200 bytes.
>>>
>>> "about 200 bytes" is not very specific.
>>>
>>> Pass in the length so we know we don't overflow it.
>>
>>agree.
> I also agree and I will add such parameter.=20

https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/commit/?h=3Dn=
ext&id=3D7790b3556fccc555ae422f1576e97bf34c8ab8b6

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlxhdoQACgkQzL64meEa
mQb5xg/+L1jMjt8wc4bizrfHHLF4BcSWh3E63cm3aukB/l/O8A+eCOkarrfXNeG5
4fSJJmUo6HHFPbVqXUa5sQDY/8TOunHtrUIeJLAVBwXsYcJgld5ii6y/F8q3Ehdv
X+bw1bg3USH1nkfj/xIOAEbD0z5IyrHKr7HiJNF2wWC4TPwyUS/yinQIMUDiEg+k
Xj4x/fT3ddVqvWVysHd/QoEqWFk5K3Neltv6aPLG2aByh2MU7+TrRDv1mzcqlVpD
SZjxGSjF05mFhT8Hs3YZMH41CBBwzlta5foNIF0CYFDEjjbn369z4ihAN3UeK0Ae
Dmvh2UzDkZUPSAmp06zKRW1Hrm87pep9OsFBecr0I5HEVVlXxNSCCtiRTm72RCEz
pvxz0sMepbI03SSYbJ/jJQJeKuZ00FrgaAeW+X2PIz9TxtiW9vDRsPLLKvezBIes
1m/Zs7u2vaTsulSMQWnRsN7gFtDv7w2aEonOtarysTlNZy5ZQjCp0G8XwgnDPPkH
uRMmIn4JwsEPpsrocvrFTrCSHQy7c6WfnY7ExCAM3svGf90DjRZPzCLZCm30tQKB
27Qt6AU68Yl762ZoVpFI9LgN/QzYMN8T9/v9VFgDDzo4IUxoEEsHYvgfKvJz+2hq
jD2KcIGwRoD2gkCFe4b+lOWcSdj3fctFXk3yx5XQCFV0KU7dmIU=
=rSxT
-----END PGP SIGNATURE-----
--=-=-=--
