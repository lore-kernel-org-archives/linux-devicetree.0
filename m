Return-Path: <SRS0=BPCO=WJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:58730 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726457AbfHMUhb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 13 Aug 2019 16:37:31 -0400
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
Date: Tue, 13 Aug 2019 23:37:18 +0300
MIME-Version: 1.0
In-Reply-To: <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pxTZfILcL1OqbLiypwg5rh1boQLSlBMfp"
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pxTZfILcL1OqbLiypwg5rh1boQLSlBMfp
Content-Type: multipart/mixed; boundary="MO1kBPu8JOD6InQBs0iyLQdEjvw5gWmio";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
In-Reply-To: <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>

--MO1kBPu8JOD6InQBs0iyLQdEjvw5gWmio
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Hello Jacek,

Thank you for your useful review,

13.08.19 23:28, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
> Hi Oleh,
>=20
> Thank you for the patch set.
>=20
> On 8/8/19 10:32 PM, Oleh Kravchenko wrote:
>> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
>> @@ -0,0 +1,22 @@
>> +What:		/sys/class/leds/<led>/hw_pattern
>> +Date:		August 2019
>> +KernelVersion:	5.3
>> +Description:
>> +		Specify a hardware pattern for the EL15203000 LED.
>> +		The LEDs board supports only predefined patterns by firmware
>> +		for specific LEDs.
>> +
>> +		Breathing mode for Screen frame light tube:
>> +		"0 4000 1 4000"
>> +
>> +		Cascade mode for Pipe LED:
>> +		"1 800 2 800 4 800 8 800 16 800 1 800 2 800 4 800 8 800 16 800"
>=20
> Why the sequence "1 800 2 800 4 800 8 800 16 800" is duplicated here?
> It seems redundant. But aside of that - aren't the timings modifiable?
> In other words - are these all patterns somehow configurable or they ar=
e
> pre-programmed?
>=20

All pattern is predefined, you can't change them at all.
I just tried to describe real things what happened in LED board.
It's ticks every 800 milliseconds for Pipe LEDs.

>> +
>> +		Inverted cascade mode for Pipe LED:
>> +		"30 800 29 800 27 800 23 800 15 800 30 800 29 800 27 800 23 800 15 =
800"
>=20
> Similar duplication here.
>=20
>> +
>> +		Bounce mode for Pipe LED:
>> +		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
>=20
> Instead of two repeating "16 800" you could provide "16 1600".
> But here again is the question whether these values are configurable.
> From what I can see in your driver implementation you're expecting
> exactly the values provided in these examples to enable given hardware
> pattern (led_pattern_cmp()).
>=20
>> +
>> +		Inverted bounce mode for Pipe LED:
>> +		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 =
800"
>=20

Should I cut this patterns to smaller? Or let keep it?

--=20
Best regards,
Oleh Kravchenko


--MO1kBPu8JOD6InQBs0iyLQdEjvw5gWmio--

--pxTZfILcL1OqbLiypwg5rh1boQLSlBMfp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAl1TH4EACgkQ0xNJm20p
l4xK6w//eUtTVjVdlD3HV1/IUN82psdKUdqKz1ioqQ3BXZhJn20hffZhHNWetNE1
rMQtdQ19OXTs+6njvFTtJFFgealCo8y9aTu5sLwM/OQWC//fY3KTD/QayiXOJbPB
ConNMOz+fklZoiZYgNLjFFzQXrWHE86Nbhwz4xH3bhfBpUc5Sq4G0YG6TofwiACp
4257b7cxpYt/bCnRnQpsIZK21xWC/8m1jRaP8uPFO4ul35R9RaSv/bIXipiuTPcz
etCxZ3SnV7132eIj/g53woChEXhKIBt+D6PtOD++rXGutKdA3tVAr4ORAItD6pCR
d2hVA/3Pn1Iui2Cz1AwXh+9VtRu3GxOmpGZoNa78k9KgD4rcZ/opFPLCXMJbJHL1
OFWlI2RwDkIaCzlQ5YdfUF/dg004qR7evPzTTW+1WHjJ/X8R0ZtRC/JUGcuTevCc
Mls0nUi788OUeztfBstTNvzjrYX0gNxAr8sqNZVILBDmf5ZupcRGlWThBL7SRYoW
5S4tH1ryBwIgQDnsJJUT2suibNda7hxYJKh8fX0VyH5IjAmTw54z3aCabMTsX2mm
jmCHL52/H0Q1qBb6GxRw2cry7jfTgf2iruXPaZH2nVf1PeGteo5X7Huvc2V8CgEk
RStGGhizmqL7ej87zV51vHS+/uzv4dK8OisZg8vdTWxBmrw7w34=
=xIoc
-----END PGP SIGNATURE-----

--pxTZfILcL1OqbLiypwg5rh1boQLSlBMfp--
