Return-Path: <fixed-term.Oleksij.Rempel@de.bosch.com>
Subject: Re: [PATCH 4/6] spi: davinci: set new SPI_FC_* flags
References: <56D448E1.6090006@de.bosch.com>
 <1456843400-20696-1-git-send-email-linux@rempel-privat.de>
 <1456843400-20696-4-git-send-email-linux@rempel-privat.de>
 <20160302021616.GP18327@sirena.org.uk>
From: fixed-term.Oleksij.Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>
Message-ID: <56D68754.3090405@de.bosch.com>
Date: Wed, 2 Mar 2016 07:25:24 +0100
MIME-Version: 1.0
In-Reply-To: <20160302021616.GP18327@sirena.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>
Cc: geert@linux-m68k.org, dirk.behme@de.bosch.com, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256



On 02.03.2016 03:16, Mark Brown wrote:
> On Tue, Mar 01, 2016 at 03:43:18PM +0100, Oleksij Rempel wrote:
> 
>> -		if (spi->mode & SPI_READY) { +		if (spi->mode & SPI_FC_READY)
>> {
> 
> This isn't setting new flags, this is replacing old flags with new
> ones which suggests that the patch renaming the flag needs to
> rename the flag in all the drivers...
> 

Only this driver was using this flag SPI_READY. So i assume, i will
need only to reword patch comment. Right?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlbWh1QACgkQHwImuRkmbWkcDQEAiRMfYYl+PtT4TLSiilvlcD36
B4j8s+YFxKRHpX8BzgwA/2UXedfndYz2pPeZM+F0pwgNhXiFYKZkzjVfso86SQl6
=2QpT
-----END PGP SIGNATURE-----
