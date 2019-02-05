From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: RE: [PATCH v3 2/6] usb:common Separated decoding functions from dwc3 driver.
Date: Tue, 05 Feb 2019 10:25:07 +0200
Message-ID: <87tvhimyl8.fsf@linux.intel.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com> <1548935553-452-3-git-send-email-pawell@cadence.com> <20190204114502.GA28608@kroah.com> <BYAPR07MB4709F763E5F1823520FB2AF1DD6E0@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709F763E5F1823520FB2AF1DD6E0@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Pawel Laszczak <pawell@cadence.com> writes:
>>On Thu, Jan 31, 2019 at 11:52:29AM +0000, Pawel Laszczak wrote:
>>> Patch moves some decoding functions from driver/usb/dwc3/debug.h driver
>>> to driver/usb/common/debug.c file. These moved functions include:
>>>     dwc3_decode_get_status
>>>     dwc3_decode_set_clear_feature
>>>     dwc3_decode_set_address
>>>     dwc3_decode_get_set_descriptor
>>>     dwc3_decode_get_configuration
>>>     dwc3_decode_set_configuration
>>>     dwc3_decode_get_intf
>>>     dwc3_decode_set_intf
>>>     dwc3_decode_synch_frame
>>>     dwc3_decode_set_sel
>>>     dwc3_decode_set_isoch_delay
>>>     dwc3_decode_ctrl
>>>
>>> These functions are used also in inroduced cdns3 driver.
>>>
>>> All functions prefixes were changed from dwc3 to usb.
>>
>>Ick, why?
>
> Because CDNS3 driver in one of the previous version had implemented very =
similar function as dwc3 and Felipe suggested that we should=20
> make common file with these functions. He also suggested that this functi=
on also could be used on host side.=20

right, host controllers can make use of Control transfer decoding.a

>>> Also, function's parameters has been extended according to the name
>>> of fields in standard SETUP packet.
>>> Additionally, patch adds usb_decode_ctrl function to
>>> include/linux/usb/ch9.h file.
>>
>>Why ch9.h?  It's not something that is specified in the spec, it's a
>>usb-specific thing :)
> Why not ?
>
> Similar as usb_state_string function from include/linux/usb/ch9.h which=20
> " Returns human readable name for the state", the usb_decode_ctrl functio=
n=20
> make the same but for standard USB request.=20

right, I would say usb_state_string() should be moved elsewhere. ch9.h
is, really, just what's described in chapter 9 of the usb specification.

>>Also, the api for that function is not ok.  If you are going to make
>>this something that the whole kernel can call, you have to fix it up:
>>
>>> +/**
>>> + * usb_decode_ctrl - Returns human readable representation of control =
request.
>>> + * @str: buffer to return a human-readable representation of control r=
equest.
>>> + *       This buffer should have about 200 bytes.
>>
>>"about 200 bytes" is not very specific.
>>
>>Pass in the length so we know we don't overflow it.
>
> I didn't want to change to much this code, because it's not my code.=20
> I'm not sure if I should ?

I have a patch for that, then you can start on top of it. I'll send it
soon after testing.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlxZSGMACgkQzL64meEa
mQbMGg//VXLDsETbEraPdlFH6KERmPC/PHNq6LpXI9OUu4q5DGk/vfHEuKb64Sr5
crkH64hxvxCswj3qCIlV4wr9iikEeijvV9bCwl4jVv1wqyaVZB7kXu501jUBHe8y
XM0S9SI6jXdbByG0z4pLXe075IXQamzbGPtwUxOPiAkBeHXlc0wljzJFf1SNCbl0
7W2JHpWlzkwEFyQ8cl/rl+P7tM3T1oBufijqTLTdUlqXrYB12yJxnIIvWMIRXQnn
uzGWIhPQql2sbefretjJWeArTA6yE7yNXh8fscmWvXoL1FudSRsKwjg2C2kySfhH
Cq1PozYk+JEbIK1ZDuFqAoVd3ikro7D2MMwOrLCH/bRIi/jLvtHFBOor9fdHPaGq
wZJYUX1uHje3HxoDB2RC2zn8CbIZrauGygL7nxp6keVbCZ+8u6FZbo25hgyP4Sxi
7XKHdBXJt7xV3l5L1O0lx/ispMLeAGRLpndRfoq8jVM+mFfPUigwlkjFw/qxhmcM
zj1uKmCqLgE+TssyMIrDyIyFFHHmm822+rzkDtkEmoSlLa4Qb9f/+u2SOYLDSzDn
QqsATtd7hE+7868iu9jLY2y8tWU0FqUTsRZfj8hE/a89y708F5ZR6HEgddW7SKOC
QGyg8Xlqt+qlWoZC1wcUkw0e+xm1kWFrRvNYb3LA3grdeRlaS44=
=iEDt
-----END PGP SIGNATURE-----
--=-=-=--
