From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: Document the Raspberry Pi Touchscreen nodes.
Date: Mon, 22 May 2017 13:51:37 -0700
Message-ID: <87pof0y5ra.fsf@eliezer.anholt.net>
References: <20170511235625.22427-1-eric@anholt.net> <3771766.1sVmoPRjsn@avalon> <c01609b7-d2d6-8ed1-5f51-4b910ba8bef0@codeaurora.org> <21080088.MT6ayIGAs6@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <21080088.MT6ayIGAs6@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> writes:

> Hi Archit,
>
> On Friday 19 May 2017 14:24:36 Archit Taneja wrote:
>> On 05/18/2017 08:25 PM, Laurent Pinchart wrote:
>> > On Thursday 18 May 2017 13:56:19 Archit Taneja wrote:
>> >> On 05/17/2017 12:16 AM, Eric Anholt wrote:
>> >
>> > [snip]
>> >=20
>> >>> In terms of physical connections:
>> >>>    [15-pin "DSI" connector on 2835]
>> >>>     | I2C               | DSI
>> >>>    / \        SPI       |
>> >>> [TS]  [Atmel]------[TC358762]
>> >>>        \                |
>> >>>         \PWM            |
>> >>>          \              | DPI
>> >>>=20
>> >>> [some backlight]------[some unknown panel]
>> >>>=20
>> >>> The binding I'm trying to create is to expose what's necessary for a
>> >>> driver that talks I2C to the Atmel, which then controls the PWM and =
does
>> >>> the command sequence over SPI to the Toshiba that sets up its end of=
 the
>> >>> DSI link.
>> >>=20
>> >> The bridge (Atmel + TC358762 combination) here looks like it's primar=
ily
>> >> an i2c device (i.e, the control bus is i2c). Therefore, the drm-bridge
>> >> driver here should be an i2c driver instead of a mipi_dsi_driver.
>> >=20
>> > Glad to see we agree, that's what I've proposed in a separate answer :=
-)
>> > I'd go one step further though, there should be no DRM bridge, just a =
DRM
>> > panel.
>>
>> If the PCB containing the controller chips and the panel are part of a
>> single casing, and the set up won't work with another panel, then yeah, I
>> agree. If the bridge chips are on a separate adapter board, and there is=
 a
>> possibility to connect other panels, then maybe a separate DRM bridge an=
d a
>> DRM panel might be a safer bet.
>
> I thought it was a single black box, but upon closer inspection there's a=
=20
> separate PCB with the Microcontroller and TC358762.
>
> Eric, do you know if it's possible to exchange the panel for another one =
(and=20
> not just an model with identical features from another vendor, but anothe=
r=20
> panel with a different mode for instance) without reprogramming the=20
> microcontroller, or is the bridge board tied to the panel model ?

Not without finding some other panel with equivalent non-standard
connectors / doing your own soldering, at a minimum.  And we don't know
what kind of programming the microcontroller does, since it's a black
box.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkjT1oACgkQtdYpNtH8
nuj1Fg/8DNvblFL7gb9e/J+VffO5gjaW00p6sZsaJMCP1ur7irHwUKV3xDY8qWN4
yWwTtuAlQrP4BQG1iUoG5elP6SG0r/YM6jFvAjpWQ3WXGbs8q3IkcNgByI+Z+Osx
at41zheN7eiQ4kDrYUnNOk/p1F8oEz8JQzrzi8JKkbHcip3OQmZcrsgVEITICLQ5
wo8kxGRIyaPUXU4MYqa0vGxMHEtE+d4l54dxVNdUBRMGckjg1Ad3t3fr79TY7slC
xQKig08FMgnEfzGTpRIMOo4Gtx2RX1HcY8ud3mvZvEQXomvcLppCoUQW6l5OZkfB
c2cdikxQQ2hGtfTNsNHn5Jz8F6N8IHEg24UGI94fsKf/+Gg79i8ULpXdKMxIv8SW
c8fRWi9mWDCmdJXY6ZAg+m0raKm6T9FvZpYLfxdMQP8KwSgrToe6lXODpe3lOKXx
PAKwlZ/sX2NiI4xB0sAnxQoiWiAJ06s9bUs8RnsxwwdYAKQXZ+20tO3bpW+Mu4zi
lgk5znBrVI0CmKGMrVhN2m87214RTH9jRAxTdviN/XJdVIk+Zmi7Hs5Ae8j3begY
Scsb1fyZeY0OQtSWesfjsP8bs65MDFfe3goVa8vK3VQ/zfIkwiioOyYT+VxWxvYH
RPcEM0CmQ2pvabvu/U/AjxVNWwqimgLdzMX0N04Y5LK8uijrVns=
=g+Mt
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
