From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/3] irqchip: bcm2836: Move SMP startup code to arch/arm
Date: Mon, 07 Aug 2017 10:08:41 -0700
Message-ID: <87valzb90m.fsf@eliezer.anholt.net>
References: <1502058731-12462-1-git-send-email-stefan.wahren@i2se.com> <1502058731-12462-4-git-send-email-stefan.wahren@i2se.com> <0f587b52-d9db-3bbe-968d-66b40fba508c@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0f587b52-d9db-3bbe-968d-66b40fba508c-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> writes:

> On 06/08/17 23:32, Stefan Wahren wrote:
>> In order to easily provide SMP for BCM2837 on 32-bit and 64-bit
>> the SMP startup code was placed in irq-bcm2836. That's not the
>> right approach. So move this code where it belongs.
>>=20
>> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
>> Fixes: 41f4988cc287 ("irqchip/bcm2836: Add SMP support for the 2836")
>
> Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
>
> How do you want to get this merged? I can either take it via the irqchip
> tree, or you take it via arm-soc. Just let me know.

The series is:

Tested-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

We'll need to get the DT binding ack, then I'm fine with it going
through arm-soc.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlmInpkACgkQtdYpNtH8
nuh+9A/+J8hsPYWEIccd+fYKmE2bq1K7FMfWPApu+GvU1jMzLB6fP3Gd0a3b6zbQ
vMTfAFryFnosZH6J0IayWwYKCLx9xLlTXp3wHsYylsObQZn/6vxxcYuk59viThQN
SgGns0gX3EXwRHXGPQKcP5PU6IaQYLSnXwVr+2ajg5/i13rtP4kQvE4Se7jm1A7J
SHe/lujODu+5y4RUPsGyWZFpsRUW/QjLHj2jAGKMVC9A/cMJDI9hy2mDZDcowjW0
CseqgyIKlGo5VThinQgvUj1o5NR04eQdlaRbV5L62Z+yvtqTU3wUOvQiDuuXEI2q
CI6m33YmQmO6AyHVo7D4HxgHBasuFpg5FJaxk+adM1KkgV/vmuQh+ky/COl7/hUh
xyfJVKiFJZokGTZcSdCFZxde/Ij2d8tQ8r2vSWJrw5a4cS6opT6s2KfuuLmF+SbS
9Lri+/mSwoxPokCmg/QvJw+A0s1hm4ePGY5+rpcWVWVHcmnocVCWjBLZLe6oJd0E
at2wF0Cm8HI/vgmi+VTbc1dCeSKv1tOziZ1HrV5BCHrs6KaOb4c9q/0LO+BvFIEo
LanhVZWHCQGJKD+ph/EySH5mYZmxPJd3wAZBwwJjoA+TMNVXfSSmN9Xvo8ZD9U4E
H0VuoqKN85eDRem6IxHs5RHKrLEScksJf26vb8AcQOm/vjtnF/s=
=QR+p
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
