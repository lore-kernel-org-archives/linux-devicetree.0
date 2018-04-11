Return-Path: <SRS0=ytM0=HA=jmondi.org=jacopo@kernel.org>
Date: Wed, 11 Apr 2018 11:01:22 +0200
From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH/RFT v3 0/3] thermal: add support for r8a77995
Message-ID: <20180411090122.GK6436@w540>
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huBJOJF9BsF479P6"
Content-Disposition: inline
In-Reply-To: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--huBJOJF9BsF479P6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Kaneko-san,

On Tue, Apr 03, 2018 at 09:43:02PM +0900, Yoshihiro Kaneko wrote:
> This series adds thermal support for r8a77995.
> R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
> Therefore this series adds r8a77995 support to rcar_thermal driver not
> rcar_gen3_thermal driver.

I tested this on D3 Draak.

I generated load expecting the detected temperature to rise.

It took a while, and I only see a slight increase of the temperature
reported by the 'temp' attribute.

# cat /sys/class/thermal/thermal_zone0/temp
30000

# while :; do cat /dev/urandom > /dev/null; done
...(wait 2 minutes)

# cat /sys/class/thermal/thermal_zone0/temp
35000

(wait 30 seconds)

# cat /sys/class/thermal/thermal_zone0/temp
30000

Is this result ok for your testing?

Thanks
  j
>
> This series is based on the next branch of Zhang Rui's linux tree.
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

--huBJOJF9BsF479P6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJazc7iAAoJEHI0Bo8WoVY8xFgP/18iVa5k8Nvlat61+2mpMStN
9+734L2yKhBA4X/Hh7HpdcYhq9/cmKazVlCJNpTb6P0aSoFNcCz1nelHyZ2YeMCK
EyX0DE6upy446iRXZER7nbnXQ9ffYqGihCF8lPckdaXtCG38lqXYoHDjUYXcfnAu
JwJTpo43GMD7osQO2G6un4nzR5lhOcwZl7H9FWCgRpnm5+fhzTTVvc0onXxq7h4V
+NX0bo9Ae6U/L0aRWQKm00u4u4fwouYE6m0fiXlubYKI8BrlJqhIq1A0SE5cmifu
IhrsFv8NqJfEY2azr8pGD/1bhyFPPm6h5hMrb60AdeDmEeztCkr8Qb5gjrPHfLVF
uEHvCxNnyn2M9jpq0Ah+lGzs8/PNsdeGQCoR7CSuMT6jXWkb9aeEk+Cmok/RZ9XH
pOKnDqTBrIsnJTDD8MaElEY1hV/44LDAm8WUQQDmkSyBkw2Ok0Gagh8bqnyxUf6E
3DHTWIf2DxYdVP2Sa16stIHhyen8F4mkhtGfrQ/6/goHk/xOdToGgljq5vAv6kiW
LoBlc5dheIeO+qNWA6Jk7hK/nioG49gNNdSmF5J0UA4aYiJe6XZRQMivf4GJYTvF
PN+vnJ33Qi4WfQ3yX6EQZ9gdEE+THli2OopbT0ambGpyC24kWu/EAnrHkx4YvIqF
4P0RQrmgHSak/BGmFbsb
=KxRy
-----END PGP SIGNATURE-----

--huBJOJF9BsF479P6--
