From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: Document the Raspberry Pi Touchscreen nodes.
Date: Mon, 15 May 2017 17:03:29 -0700
Message-ID: <87shk53bxq.fsf@eliezer.anholt.net>
References: <20170511235625.22427-1-eric@anholt.net> <20170511235625.22427-3-eric@anholt.net> <1579603.xgvSgGFBs8@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1579603.xgvSgGFBs8@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> writes:

> Hi Eric,
>
> Thank you for the patch.
>
> On Thursday 11 May 2017 16:56:23 Eric Anholt wrote:
>> The Raspberry Pi 7" Touchscreen is a DPI touchscreen panel with
>> DSI->DPI bridge and touchscreen controller integrated, that connects
>> to the Raspberry Pi through its 15-pin "DSI" connector (some lines are
>> DSI, some lines are I2C).
>>=20
>> This device is represented in the DT as three nodes (DSI device, I2C
>> device, panel).  Input will be left to a separate binding later, as it
>> will be a basic I2C client device.
>>=20
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> ---
>>  .../raspberrypi,7inch-touchscreen-bridge.txt       | 68 +++++++++++++++=
++++
>>  .../panel/raspberrypi,7inch-touchscreen-panel.txt  |  7 +++
>>  2 files changed, 75 insertions(+)
>>  create mode 100644
>> Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touch=
scr
>> een-bridge.txt create mode 100644
>> Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchs=
cre
>> en-panel.txt
>>=20
>> diff --git
>> a/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-tou=
chs
>> creen-bridge.txt
>> b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-tou=
chs
>> creen-bridge.txt new file mode 100644
>> index 000000000000..a5669beaf68f
>> --- /dev/null
>> +++
>> b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-tou=
chs
>> creen-bridge.txt @@ -0,0 +1,68 @@
>> +Official 7" (800x480) Raspberry Pi touchscreen panel's bridge.
>> +
>> +This DSI panel contains:
>> +
>> +- TC358762 DSI->DPI bridge
>> +- Atmel microcontroller on I2C for power sequencing the DSI bridge and
>> +  controlling backlight
>> +- Touchscreen controller on I2C for touch input
>> +
>> +and this covers the TC358762 bridge and Atmel microcontroller, while
>> +../panel/raspberrypi,7inch-touchscreen-panel.txt covers the panel.
>
> The TC358762 is a standalone bridge that doesn't depend on the ATTiny=20
> microcontroller used by the RPI. As it's usable standalone, I believe thi=
s=20
> binding should be split in two.

Do you have a plan for how I would implement a driver on top of that
binding change, though?  Note that we don't program the Toshiba
directly, we only send commands to the Atmel.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkaQdEACgkQtdYpNtH8
nuim9Q//VfKLHqKR7iiOs8nHXgwe2IGXEy6IHlOXNQp9nxrMLiSlPJbJtTAGsgyX
VEip5dpNy/scmfGMGS2r+BceDYDqnEfRmq9HuO33vfQBDBipV2ll85Ro1xmr8dv5
vOAwIOgmsiGiEtuWbLGjdVUazIb70W3VqwsasNUTaG0r+H6dPGhtXA1DaM0+qKVX
AiOrUZP1RHmX/vDUluLEL0PUcrKwBsOExmaB9y88kzqX8E+OgeYpywZsgRJvcOSu
Z9/anUY1Dj8sh8Sj3ewgTla9U5cooFnnJA2kX8pAM0YF3FmHqXN2sZir6WtwHaJ4
t98MwzR19dxoRvN1/WP9SOxMFvHpXh9TbTzt2o8FSUoqwvdp/8dyI6x3mwn7Aafn
inKesc7PhmVuKJT2gmCSGN339mN71znOJYM1G28OgV0RxwoyHOZGlCDrAJQkkr0a
ycwh3lRg11k3wZNI92wLVd2M8WNUGbbEcx5rfqkHwqJZis4EPUQ6dSqj2tdc7igL
W/zH6wCC36nkQnVdqToG4ci0hpPZyPjktiNndVlZLAAoIuyDXNcGnsDoKKTBn/bg
3r8aH+/3oiGaQuKv6lcnNQePyTyM89UkfD+hb1nTuASWANRlCgXpI+ZyMvuVWPT5
XhRxs6shdQja4pfd+hleAgfR0/BmXuk5diR4WH7IxE66H66s3nk=
=6YVT
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
