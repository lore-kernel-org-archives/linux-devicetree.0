Return-Path: <fixed-term.Oleksij.Rempel@de.bosch.com>
Subject: Re: [PATCH 3/6] DT: add documentation for spi-fc-test driver
References: <56D448E1.6090006@de.bosch.com>
 <1456843400-20696-1-git-send-email-linux@rempel-privat.de>
 <1456843400-20696-3-git-send-email-linux@rempel-privat.de>
 <20160302021755.GQ18327@sirena.org.uk>
From: fixed-term.Oleksij.Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>
Message-ID: <56D68700.1020302@de.bosch.com>
Date: Wed, 2 Mar 2016 07:24:00 +0100
MIME-Version: 1.0
In-Reply-To: <20160302021755.GQ18327@sirena.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>
Cc: geert@linux-m68k.org, dirk.behme@de.bosch.com, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256



On 02.03.2016 03:17, Mark Brown wrote:
> On Tue, Mar 01, 2016 at 03:43:17PM +0100, Oleksij Rempel wrote:
> 
>> .../devicetree/bindings/spi/spi-fc-test.txt        | 30
>> ++++++++++++++++++++++
> 
> We should not be supporting DT bindings for a test device that
> doesn't represent physical hardware, this is an invitation to abuse
> by people writing bad DT bindings for actual hardware.
> 

Ok, i'll try to reimplement it with module parameters.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlbWhwAACgkQHwImuRkmbWlOOwEAgarzmDA119XNTrZOKDB4OtJW
J8j0WM80sbRwK9DvNQkA/2lYbFeQgS2hhcirvxB6vMr6/5C77sm0evfv/UAZrDqA
=d2kY
-----END PGP SIGNATURE-----
