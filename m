From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Subject: Re: [RFC PATCH] ARM: dts: Add support for Turris Omnia
Date: Thu, 24 Nov 2016 09:37:10 +0100
Message-ID: <4e3f9628-dbf8-27c1-abea-d0ef58a67e51@kleine-koenig.org>
References: <1479851991.26813.2@smtp.gmail.com>
 <1479859770-9375-1-git-send-email-tmshlvck@gmail.com>
 <20161123003505.GL2691@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Cea7dcGcnLamBd1PwHblQEnDcWoNEHhWv"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161123003505.GL2691@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Tomas Hlavacek <tmshlvck@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Cea7dcGcnLamBd1PwHblQEnDcWoNEHhWv
Content-Type: multipart/mixed; boundary="SFDuOflkinvnrFA2hqEdGQKde29gdtkGO";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Andrew Lunn <andrew@lunn.ch>, Tomas Hlavacek <tmshlvck@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>, Jason Cooper <jason@lakedaemon.net>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-ID: <4e3f9628-dbf8-27c1-abea-d0ef58a67e51@kleine-koenig.org>
Subject: Re: [RFC PATCH] ARM: dts: Add support for Turris Omnia
References: <1479851991.26813.2@smtp.gmail.com>
 <1479859770-9375-1-git-send-email-tmshlvck@gmail.com>
 <20161123003505.GL2691@lunn.ch>
In-Reply-To: <20161123003505.GL2691@lunn.ch>

--SFDuOflkinvnrFA2hqEdGQKde29gdtkGO
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 11/23/2016 01:35 AM, Andrew Lunn wrote:
>> +++ b/arch/arm/boot/dts/armada-385-turris-omnia.dts
>> @@ -0,0 +1,279 @@
>> +/*
>> + * Device Tree file for the Turris Omnia
>> + * Schematic available at https://www.turris.cz/doc/_media/rtrom01-sc=
hema.pdf
>
> Cool that there is a link to the schematics. But please could you put
> it lower down. It is more likely to be seen if it comes after the
> copyright and license section.

I added to the top because that's where I would look. But checking other
dts files it seems indeed to be more common after the copyright stuff.
I'd suggest to even start a new comment (i.e.

	 * last blabla of copyright
	 */

	/*
	 * Schematic available at ...

) to be more "loud".

@Tomas: I think it doesn't make sense when we alternate sending patches
without prior arrangement. Do you already work on a v5? If not I can do
that to fix the last few comments. Not sure when a submission is too
late to enter v4.10, but I think the window isn't that big any more.

> No leds? No buttons via gpio-keys?

The leds are controlled by a Cortex-M0 and without intervention blink
according to a hardware function (network, power, pci). IMHO that's ok
for an initial setup.

And there are no buttons that are routed to the Armada CPU. Just a reset
button (well, ok, this one is routed to the Armada CPU, but you cannot
make this a gpio-key :-) and the other button is used to control the
brightness of the LEDs and is only routed to the M0.

Best regards
Uwe


--SFDuOflkinvnrFA2hqEdGQKde29gdtkGO--

--Cea7dcGcnLamBd1PwHblQEnDcWoNEHhWv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAlg2prwACgkQwfwUeK3K
7AlTqAgAmAVBCvE7VCQMJE1NqhXNhBs/lxwArY2aHJ1nO7wSnu0hWsXpHbGI7kkh
mU3zncJZHQD/YnyHFfUr8HIz2LAUraM2Lg6JxTuGHqA+4o2Xet/cXq9OeVh7fxwq
ttJcp1JdxV6UTZ2G53bSI6RrIIUYhn3YyDQwaPsOqTTrVXQc3bxycRuaixsxvdSb
vjiiIBZp9SKr05SCHH7w21aq49t716H1DbLZcWcv2bTrNi42N0vuKz53qMk+FS4X
scIZ5uGA0eV5W5hs1cCNn7fvW8EOWqDL+sIGSZH/JCgu3rZ7XDlHrIyJZwtk72Ab
O5LBSJdYcAXENM52dzRsH4lfyHqO5A==
=F0k/
-----END PGP SIGNATURE-----

--Cea7dcGcnLamBd1PwHblQEnDcWoNEHhWv--
