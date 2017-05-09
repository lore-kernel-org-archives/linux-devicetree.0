From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dts: bcm283x: Reserve first page for firmware
Date: Tue, 09 May 2017 11:10:57 -0700
Message-ID: <87lgq5c34e.fsf@eliezer.anholt.net>
References: <b6aef857-1454-7931-2c60-6d7b55b7a0a8@raspberrypi.org> <8737cenfhc.fsf@eliezer.anholt.net> <bdc05058-f65b-da08-0cf5-51aa1f97852e@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bdc05058-f65b-da08-0cf5-51aa1f97852e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On 05/09/2017 09:48 AM, Eric Anholt wrote:
>> Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> writes:
>>=20
>>> The Raspberry Pi startup stub files for multi-core BCM27XX processors
>>> make the secondary CPUs spin until the corresponding mailbox is
>>> written. These stubs are loaded at physical address 0x00000xxx (as seen
>>> by the ARMs), but this page will be reused by the kernel unless it is
>>> explicitly reserved, causing the waiting cores to execute random code.
>>>
>>> Use the /memreserve/ Device Tree directive to mark the first page as
>>> off-limits to the kernel.
>>>
>>> See: https://github.com/raspberrypi/linux/issues/1989
>>>
>>> Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
>>=20
>> This looks great.  We're currently in the merge window, so I can't
>> generate a new bcm2835-dt-next yet, but I'll pick this patch up when I
>> do.
>>=20
>> Thanks for submitting upstream!
>
> Considering that this is a fix, we could actually squeeze it in the
> devicetree/fixes branch and we could submit those as soon as v4.12-rc1
> is tagged, your call.

While the issue is a bit obscure, I know I've hit it as well.  I agree
that it's a good stable candidate, so unless you'd like to pick it
yourself and cc stable, I'll just send you a PR doing so when rc1 rolls
around.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkSBjEACgkQtdYpNtH8
nuhKJg//RLbzQ9ytQOI4UZN45BQAn11Mhe3gysDRzf81tpR5LbGpyuwEeO6+/93l
dd7TmpqNdHBMd5l/BUVVkMTTR0ajn6u4MEFmZvpE4DsOBcW+hO6va3a4wIfM+LUP
xagKNU4xlbUg4k6C0ljur9chOcoeWBfBe+2VvF3Yf9102gNfF9YE43d3rPCnOdJo
yC8YAcMtXCa/BY5uo7g3RdGtbxFMpf+AatUn78PqT3KQTO4Tr+EJi4JyWGIZacj7
bedbWcvN64RS9nxO0/3UOjcZFfDBXia+P6sDZJFyX6NW1/LkjsZVfZPs9eTlHLoZ
aTRFiuiOzoeUiNZ++t6E/r03pwk6mu7GffoofG/6sY6FVDgcwwHAHZvEBE8QhTLe
O9HNxIiOb1Qvx2tun76km82uu8GeRKhBiOfKOuDE+DYgBLM20OtaLD3kgV0429cg
zCkSppSJf3cZi0ZQZ7tVFbd9coUDYUM6h5p1VHTZfqqVJfRrbgqn0rTyYy1cHt9c
gtC4V0ex6Jg7OhqwYjrT4RdVTsqkKdzEJpT/4v93sX9EekzvZGF3oYO4mlSUOiAB
AHle6HA4pR61TStQa0E3zPCRSJeinwaWL425MYoCOmlEJqp76loiM3TRewjDA4ZL
mdPBoAIKhuHdszJ1PMg7ossV8fuguDR0XSuVRHuMluhovxgDmLE=
=+sc8
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
