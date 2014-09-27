From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 1/2] regulator: st-pwm: get voltage and duty table
 from dts
Date: Sat, 27 Sep 2014 12:18:36 +0100
Message-ID: <20140927111836.GI27755@sirena.org.uk>
References: <1411479779-10229-1-git-send-email-zyw@rock-chips.com>
 <1411479779-10229-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gX7DG0PufVj3JKBt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1411479779-10229-2-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: dianders@chromium.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, lee.jones@linaro.org, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--gX7DG0PufVj3JKBt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 23, 2014 at 09:42:58PM +0800, Chris Zhong wrote:

> Get voltage & duty table from device tree might be better, other platforms can also use this
> driver without any modify.

Please wrap your changelogs to less than 80 characters.

> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
> new file mode 100644
> index 0000000..d3f55ea
> --- /dev/null
> +++ b/drivers/regulator/pwm-regulator.c
> @@ -0,0 +1,197 @@
> +/*
> + * Regulator driver for PWM Regulators
> + *
> + * Copyright (C) 2014 - STMicroelectronics Inc.
> + *
> + * Author: Lee Jones <lee.jones@linaro.org>
> + *

Generate patches renaming files with git format-patch -M - as things
stand since this deletes and re-adds the code it's very difficult to
review, it's equivalent to just re-reviewing the driver from scratch.

--gX7DG0PufVj3JKBt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUJp0MAAoJECTWi3JdVIfQXaMIAIP5gTvdncj6nr2T14mA4UWx
3LMI3wvynXbWxE0Cdp0zhsT5yt7G0KmZZAHqRQ5ji0ZP2CMMYbs7aKYxLURkIcSv
fDGRz2IvRcNcThtdPXbLJSJOYDHAM6I/wxii/Lqhtv5Q6w/9PHXUQS/DV94wWCDV
/WmETqj2B8Jgb+tdOAtSlhEQ2rQCTu7O8H0r4PsxR9ULLW3n3PH3yF0dQLS6SiJG
zeVlrFTrff1PzqyXhJIqFA8jEXJ7XO6weOoxZw2zp4O7AxUBMnTMCVGPG4WeSyXU
4YEwGlAjiXIwv0Mm2coUjIyh5MZUhHkeMixZTtSko/SqiT/WU1xaHKaBF1k7W9A=
=s2Dq
-----END PGP SIGNATURE-----

--gX7DG0PufVj3JKBt--
