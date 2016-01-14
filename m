From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 5/6] rtc: max77xxx: add RTC driver for Maxim MAX77xxx
 series RTC IP
Date: Thu, 14 Jan 2016 14:20:48 +0000
Message-ID: <20160114142048.GS6588@sirena.org.uk>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com>
 <1452590273-16421-6-git-send-email-ldewangan@nvidia.com>
 <569594F0.4020007@samsung.com>
 <5695CD73.5010709@nvidia.com>
 <5695D268.3060705@samsung.com>
 <5695D1AF.9000806@nvidia.com>
 <5696665A.5030508@nvidia.com>
 <5696F0C4.1060904@samsung.com>
 <5696F7F8.108@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YMoJtYXQBeUqimUz"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5696F7F8.108@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com
List-Id: devicetree@vger.kernel.org


--YMoJtYXQBeUqimUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 14, 2016 at 10:20:56AM +0900, Krzysztof Kozlowski wrote:

> 2. It has different register address.
>    We need a register-layout/configuration structure. The logic is the
> same except few differences (e.g. presence of MAX77802_RTC_AE1).

Depending on what the differences are either just some variables in the
driver data that get set on probe with the different registers (if it's
just the register) or using regmap_field (if things get shifted as well,
or if it happens to make more sense) should work.

--YMoJtYXQBeUqimUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWl66/AAoJECTWi3JdVIfQBO0H/iC0x7+GT5E9EyPqSgBwa7kR
oUAtAzU6WRoFt52PRHM/4z6BpkuuFAN2hqVejV1nKem7drHLdkgUjXRHzaRG6AFk
YuZ8k0Ae/OZRaj4p07bVhRsQT896VNy+QaDR8FtcTorR6SJEubkBGamexLnPIp8D
CEY6KLBZMENu1bOlcnGUDOSWb1P/HdqipgFfhM5CnjBDah5iK/hqNkjA2mIy2XdY
/MIL/esgf41DyojVSYyEMZvWGZlKwRULKEzkNdATlscuFQ6wfvicOpRtAxh3wvr8
YOo+yWtxbFh86DQUmbfjHoJDFi1jV6JpQ44XslT7N+QmAKMRdAJ6LkozX2ZzxCs=
=adUQ
-----END PGP SIGNATURE-----

--YMoJtYXQBeUqimUz--
