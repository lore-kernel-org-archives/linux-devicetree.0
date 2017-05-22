From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: Document the Raspberry Pi Touchscreen nodes.
Date: Mon, 22 May 2017 13:50:14 -0700
Message-ID: <87shjwy5tl.fsf@eliezer.anholt.net>
References: <20170511235625.22427-1-eric@anholt.net> <3768334.nZM7df9y4L@avalon> <87shk4iqr7.fsf@eliezer.anholt.net> <5108517.4KFRtigegR@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5108517.4KFRtigegR@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> writes:

> Hi Eric,
>
> On Tuesday 16 May 2017 11:46:36 Eric Anholt wrote:
>
> [snip]
>
>> In terms of physical connections:
>>=20
>>    [15-pin "DSI" connector on 2835]
>>=20
>>     | I2C               | DSI
>>    / \        SPI       |
>> [TS]  [Atmel]------[TC358762]
>>        \                |
>>         \PWM            |
>>          \              | DPI
>> [some backlight]------[some unknown panel]
>>=20
>> The binding I'm trying to create is to expose what's necessary for a
>> driver that talks I2C to the Atmel, which then controls the PWM and does
>> the command sequence over SPI to the Toshiba that sets up its end of the
>> DSI link.
>
> According to the documentation I've been able to find, the TC358762 has a=
n SPI=20
> master port through which it can output the commands DCS received from th=
e DSI=20
> port, and an I2C slave port through which it can be configured by an exte=
rnal=20
> device. If the connection between the microcontroller and the TC358762 is=
=20
> indeed SPI and not I2C, I assume it's used by the microcontroller to rece=
ive=20
> the DCS commands and perform control of the backlight (and possibly other=
=20
> components) accordingly. By the way, is there any place where I can find =
a=20
> leaked version of the non-public panel schematics ? ;-)

Not that I know of.

I don't know that you can control the backlight over DCS, given that I
have no docs.  We only send commands from Atmel to TC, not the other way
around.

> As far as I can tell from your patch series, you don't need to send any=20
> command to the TC358762 over DSI. In that case I would model the panel in=
 DT=20
> as an I2C device, as all control goes through the I2C bus. The DSI video =
data=20
> connection should then be modelled using the OF graph DT bindings. The re=
sult=20
> will be a black box panel with a custom black box panel driver, using a s=
ingle=20
> DT node. There's no need for a separate bridge instance. That's the clean=
est=20
> option I can come up with so far, and I agree that splitting TC358762 sup=
port=20
> into a standalone bridge driver makes no sense in this case.

I agree, it's just that when I submitted to drm-panel I was told that it
didn't make sense as a single driver, so I went to all of this work
instead.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkjTwYACgkQtdYpNtH8
nuiJEw//fSQr6B46ATrYPPQNK3IzeujgQUlosBpmxPEt90wHoB9VTgXqh5EuOr2A
X0koMfUHCRUEvkIT7BWlZVxlN5XXOXnZtn784Qz/qP9cdNyEcjYZG+D5DDLEYeQV
jaqzEuIPxx83vNqt2HVz11KZQKe0hy4NLTycvHGa78mLk+jLFipkJZhGgXNYO8D/
MSj7GGAP0l6zctO5UMOqRic9r2xhTAcCLpjnpV8CcGUEHx2fJYN9oaKjxTPn8lPF
9T/Iuc8MLf8CS/UinUZumD91J0sxgPsG/zzaRsbNQ9gm3m0/c7beeB2AH342RtHq
rmwNaDVx9QNzKdOWlVYddCr7M9k3z4O1j+1c61xXvHGebWpJ++KKuwpp9hvd9DdH
S8PKK92RpV4SO7ki8ocYJwYBx6OjoysN5i8E/1zlxkvuAi78Pvin1xEvWSs/xKjP
fXTSAXxaDkLjSQfWoS/D1harFCPKrUhigDsU6d/XlIh019cPAGyHULQK3jCeK6ZQ
ztJ5Ud0gCQTnNfenph+ZzQxVD4kG2Rw5PSu8JeWpeNCb/EnNFD/cWFQFV/DSWX0f
gT47xDLnjrNCAfFgflDcahIRKBoFvruTg4OG8hapNHq0xX+zT0Ksh0W8YbxFMSao
E4PIjaj5tCxQqitWF31nHahxsjTx+sEjcBLPi9iVenQnYhSJlTg=
=MDFp
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
