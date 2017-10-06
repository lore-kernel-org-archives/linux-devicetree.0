From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: bcm283x: Fix console path on RPi3
Date: Fri, 06 Oct 2017 15:06:12 -0700
Message-ID: <87mv54dj8r.fsf@anholt.net>
References: <1507297972-10512-1-git-send-email-loic.poulain@gmail.com> <1740609206.57031.1507313620912@email.1und1.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1740609206.57031.1507313620912-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> Hi Loic,
>
>> Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> hat am 6. Oktober 2017 um 15:52 ge=
schrieben:
>>=20
>>=20
>> Contrary to other RPi devices, RPi3 uses uart0 to communicate with
>> the BCM43438 bluetooth controller. uart1 is then used for the console.
>> Today, the console configuration is inherited from the bcm283x dtsi
>> (bootargs) which is not the correct one for the RPi3. This leads to
>> routing issue and confuses the Bluetooth controller with unexpected
>> data.
>>=20
>> This patch introduces chosen/stdout path to configure console to uart0
>> on bcm283x family and overwrite it to uart1 in the RPi3 dts.
>>=20
>> Create serial0/1 aliases referring to uart0 and uart1 paths.
>> Remove unneeded earlyprintk.
>>=20
>> Fixes: 4188ea2aeb6d ("ARM: bcm283x: Define UART pinmuxing on board level=
")
>> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> after changing serial0 to serial1 in my cmdline.txt, i can see the boot m=
essages on my RPi Zero W.
>
> Tested-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>

I touched up whitespace/spelling and sent the PR.  Thanks for testing!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlnX/lQACgkQtdYpNtH8
nujt5A/9Ez4F9+/FR2wVxX8ITw3/9+TaWswtWxxHzOsFz5sVJuQgk3VGqIpEQ8Be
5Jytpx/2ztpyoLqIaOLAE5r6Xne5WmmNdUd9YzSk14dEYU7NzUkEMbhhtHXFr89D
+z0RaZnBQodvUeRWvj/U8gbrwFBOOCV046/ibwgoNcd66z8Qe5WXETgqaojsQLgu
YvcDZAOUTDEBN+WvqqbhOxhQD1GcB7PtiZ1efv8BScIQNVIvFk/I5EfHhQTz9Q3/
+lyCl4U/J5WS0/ny8yZJv+r/mHvk3cCoZnGC4bi0cghv/WvlXBOMF1UJQY/yUhcr
0YPXYWxt+TQytF+ET1ddNeqLsok/sBQ+ubYwbvtYkjJppHZKR8hfyOhWILI/zdKY
PfJKIAdB/aPI/4KAn6QxnD7D1oIXzc5F3IfvUbj55jit+s/1KfzRCD/aB+Ec0wAG
8hpEdo+tGkhngp1cRMCtitMZt2EmuZqWo6pL5Qd+7WZQJCMXwZHx9iAo//mLxygO
6Bg2MxgOnfvfJBLiySRrgowG/TYE+t5467sp8Imm1WJwUblL/ppqvS40eObO0y2K
it7BnrHTfeb02grXyxO127awyjVBZA1SlOD8ne9Ce5oCjEgfRQRqXmH1dcWsWSQ+
IDAmPzKvxeHtCKXi1Cju0ufrN1Gp4TXENJbVFCWv7Vpxpo694qs=
=ODbi
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
