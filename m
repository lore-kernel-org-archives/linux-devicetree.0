From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: dt: Add Raspberry Pi Zero
Date: Wed, 20 Jul 2016 14:30:34 -0700
Message-ID: <87a8hct2th.fsf@eliezer.anholt.net>
References: <1454571546-25481-1-git-send-email-lkundrak@v3.sk> <27632472.326220.2e5ba31c-16b8-46a6-a38b-8aa5236ec996.open-xchange@email.1und1.de> <878tww6r0v.fsf@eliezer.anholt.net> <182687649.301236.37df541a-c292-4f81-b3d7-fcea47416b49.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <182687649.301236.37df541a-c292-4f81-b3d7-fcea47416b49.open-xchange-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> Hi Eric,
>
>> Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> hat am 20. Juli 2016 um 21:36 geschrieben:
>>=20
>>=20
>> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
>>=20
>> > Hi Lubomir,
>> >
>> >> Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> hat am 4. Februar 2016 um 08:39
>> >> geschrieben:
>> >>=20
>> >>=20
>> >> Notable difference from the other Raspberry Pi boards is the lack of =
PWR
>> >> LED.
>> >>=20
>> >> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>> >
>> > do you have any plans to submit a V2 of this patch or should i take ov=
er?
>>=20
>> It's been a while, so I'd love if you picked it up and resubmitted with
>> the LED changes.
>
> i also want to take care of those dwc2 warnings, which might need some
> additional DT settings:
>
> dwc2 20980000.usb: 256 invalid for host_nperio_tx_fifo_size. Check HW
> configuration.
> dwc2 20980000.usb: 512 invalid for host_perio_tx_fifo_size. Check HW
> configuration.
> dwc2 20980000.usb: Specified GNPTXFDEP=3D1024 > 32
>
> What LED change do you expect?

Sorry, misremembering the thread. I think it was just the bindings
documentation change that was needed.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXj+16AAoJELXWKTbR/J7oEDwP/3bXTrhs/fMRv7SJSBacbR2v
InW8isIKCzGiqYtdTXYG0+x4QyiluBALOKLumWIy+6pvJ2Wp8GO+qBFI/CiGoyNm
vVFa1SoKlFj0yxDHYLChnszXQKf3mQFxR3yquydsg7Pp7PmSDvQF8JVBX/YIpeCV
1J1IKsemPGsQFBaEMWzW8bKN4zDoWDWG60XM+66px4et7+N6Bf0u/g/hX9CkQtN7
wXq20z7jxaohdlX5HlSc3CfQJKv0G11X02F6iEtJLY54otNvxQT9nJdSTh8iWigD
DpIj8OaJYY3nGp5N/U1QnNqqegZw4g5pPwZRr3Alc2XMMcxpzILyk6BUnsfzGbu9
7EEQ/1RtCmfRgq9Zpc9LTA//ULqRprFh1mHznA+D4zMoCEkl0buCfUwclmqCT/2W
TEcMjqaajVyNScP5Xju41j5GsUHG1VA6OZ/eRTWe5Mg1t8OFwNlzP6K9p/o+Z58M
ODuKcw219SqvX7UAP2yXMYtPm86l2QRBsYsKmtb99dmMzKdKQ2s/tHgJMEU1rIZp
yGqN/hiOYr9dMwbdpZPi89PtMW5XHAuj9oyngxmXiPuWipaubyiwB7Olb33vs3Eu
HsgCwle1W6laM29UpJZdNaa1VpX8jpAX2qfJoreY0xjETRBLRePXJcFkjdvvAp0j
2qWbRvU98RsPLuB/Pkpq
=Qe+g
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
