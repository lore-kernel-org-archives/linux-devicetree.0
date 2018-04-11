Return-Path: <SRS0=ytM0=HA=jmondi.org=jacopo@kernel.org>
Date: Wed, 11 Apr 2018 10:12:58 +0200
From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH/RFT v3 0/3] thermal: add support for r8a77995
Message-ID: <20180411081258.GI6436@w540>
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X+nYw8KZ/oNxZ8JS"
Content-Disposition: inline
In-Reply-To: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--X+nYw8KZ/oNxZ8JS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Kaneko-san

On Tue, Apr 03, 2018 at 09:43:02PM +0900, Yoshihiro Kaneko wrote:
> This series adds thermal support for r8a77995.
> R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
> Therefore this series adds r8a77995 support to rcar_thermal driver not
> rcar_gen3_thermal driver.
>
> This series is based on the next branch of Zhang Rui's linux tree.

Seems like I cannot find Zhang's tree anywhere. My google-fu is surely
bad, but can you paste a link to the tree here below, please?

Thanks
   j

>
> v3 [Yoshihiro Kaneko]
> * As suggested by Geert Uytterhoeven
> rcar_thermal.c:
> - make use_of_thermal in structure rcar_thermal_chip a single bit
> - add feature bits to rcar_thermal_chip
> - add the number of interrupts to rcar_thermal_chip
> - remove rcar_thermal_type in rcar_thermal_cip
> - make variable chip in rcar_thermal_probe() a const
>
> rcar-thermal.txt:
> * No change
>
> r8a77995.dtsi:
> * No change
>
>
> v2 [Yoshihiro Kaneko]
> * As suggested by Geert Uytterhoeven
> rcar_thermal.c:
> - remove rcar_of_data macro
> - store a pointer to rcar_thermal_chip in rcar_thermal_priv
> - remove unnecessary cast in rcar_thermal_dt_ids
>
> rcar-thermal.txt:
> - drop the fallback for D3
> - update the paragraph about interrupts
>
> r8a77995.dtsi:
> - fix the base address and the register addresses
> - drop the fallback
>
> Yoshihiro Kaneko (3):
>   thermal: rcar_thermal: add r8a77995 support
>   dt-bindings: thermal: rcar-thermal: add R8A77995 support
>   arm64: dts: renesas: r8a77995: add thermal device support
>
>  .../devicetree/bindings/thermal/rcar-thermal.txt   |   7 +-
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  30 ++++
>  drivers/thermal/rcar_thermal.c                     | 154 ++++++++++++++++-----
>  3 files changed, 157 insertions(+), 34 deletions(-)
>
> --
> 1.9.1
>

--X+nYw8KZ/oNxZ8JS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJazcOKAAoJEHI0Bo8WoVY8ft0QAIj87n+fqSnIzPDQ+6QY2VTL
bOC/aZON1EsCTORHsBHMX1fVi040cbfmjrrAgDGtOQMb+AwITwbdYCTMCUOMdZJ2
rYPn5Hpd2mSl6mz453jMbgipLQtO+PP8GT4obxc9/WR4eyPyEb4dLLmfEC8PrP0d
xiC2A4NLvRebE/doxP5FBvDULFBqgZcac0idB1AsTzS/v2NT3BziQX7MdwU46AT1
5Tg51g+aOTnoKdyHo8ZIPwGkE7j9yI9azjg7k9j7Y1Kz6pCz8g4v3aK4/URWM8Yf
auVsoatDlAma3akfuwJuxMQUPcJ0ngT3umMe7aYyIHS1PHPT7dSCRwwixcjiBjzK
jlxAyaLH2lGhgfO6w2HGQ+PWiLQnlWGLqoV3mL3J3Y71nfukHwgY5SZXwvpAKHYG
pO72yKN2zGGVCteH90RpqLdGOxeNaCv1bqXXh3ddGLCfRDSTNlHHZ32a0OgqfiHq
FyeKYCYfWyNw1CHf7K+Q/y3B+31WiIb7kMhDrkfnUxXIOKr1Qlr11zIs3oHx3ULF
5WR8G3LujDGG2OKPXbpe6tO+GwumfuOTPaYAfViKZVww4DyxPjNaDIH1kOIkeFYB
N0sthbRjeX/X2OlajBMtKA9NwKeNwbEiiA9wqJtkRlOGh0Z7wvh0ooabi/4zfEft
ZntXaK+hfHip3acyoiDA
=ko/5
-----END PGP SIGNATURE-----

--X+nYw8KZ/oNxZ8JS--
