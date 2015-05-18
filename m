From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/3 v2] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Mon, 18 May 2015 10:34:08 -0700
Message-ID: <87pp5xokmn.fsf@eliezer.anholt.net>
References: <1431543609-19646-1-git-send-email-eric@anholt.net> <1431543609-19646-3-git-send-email-eric@anholt.net> <5558DD40.4070701@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5558DD40.4070701@tronnes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Noralf Tr=C3=B8nnes <noralf@tronnes.org> writes:

> Den 13.05.2015 21:00, skrev Eric Anholt:
>> This gives us a function for making mailbox property channel requests
>> of the firmware, which is most notable in that it will let us get and
>> set clock rates.
>>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>
> [...]
>
>> +/*
>> + * Submits a single tag to the VPU firmware through the mailbox
>> + * property interface.
>> + *
>> + * This is a convenience wrapper around
>> + * rpi_firmware_property_list() to avoid some of the
>> + * boilerplate in property calls.
>> + */
>> +int rpi_firmware_property(struct device_node *of_node,
>> +			  u32 tag, void *tag_data, size_t buf_size)
>
> To use the firmware property functions, I need a DT node pointer.
> Since Device Tree is dynamic now, should I fetch the firmware node
> each time, or should I do that in probe and store the node pointer?
>
> Device Tree:
>          firmware: firmware {
>              compatible =3D "raspberrypi,firmware";
>          };
>
>          thermal {
>              compatible =3D "brcm,bcm2835-thermal";
>              firmware =3D <&firmware>;
>          };

I'm doing it in probe in my clients -- I don't see why the firmware
device's node would change.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVWiKRAAoJELXWKTbR/J7oiTcQALCV8iN/gkPn8kO98GS2tl7r
WzCJ20ojMc26f7OBkG4/A6gqbsYv2TKXgsjmwzdgiGENL2qoDu8I7kImoh7sTEjB
lsTt9X7upExdC2/uxfiHmlJ4dwYaneqs+jxFuuZpactH4wqorUtKLa7Es64IhGTI
0dB2S37dJXecMt7tRpplw64cJpPF5oUeh2O4j4oTlaXDrgQPIknuTbD/7pnj287P
6YNLq5eYiRPcv+ma8rNGtgfdkFWPqyPTHz08TG8afksB5amwzh0UOcgnmY7m71a9
6WyMFX3J9yX9/ixt9SHjjd9VvlRxiBafUSPr39tulCM7GyyPWtnDVUNOn/rfh0V0
um23/9/SxnW2oa2fpdLkaszj7fnY77ntevbR9N7L4+t7zSnaUrhehgiTxcvHUJsW
6hTng/vZAI/li6x5sMhXjPf+G4xkctGHH/K42zdr3C8crzFaCiuDMKFqXecd3M4g
/ITi4NA8jElJzsvvBehuLicXs2v8TohmldNRIRtTSmV9sPdyWVYsrSXJtgpOyfrE
3KR/q28yRzTNCGRVeuEN6f23KTm3X73QGfQLDQdufS+9FijVjw5Eg7zr23fFARMq
yiyQOddGoV1Wh54PbRNu3f5Yndlb6XSEoratzZtWJ1VR5sj0GR3tS7yOdeA/Pbom
yNe/DXAHv9vfEDk9wSfW
=7wgn
-----END PGP SIGNATURE-----
--=-=-=--
