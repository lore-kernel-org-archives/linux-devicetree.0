From: Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx5: Add dts files for USB armory.
Date: Mon, 27 Apr 2015 13:48:26 -0700
Message-ID: <87y4ldnvqd.fsf@aikidev.net>
References: <87h9t6i40r.fsf@aikidev.net> <20150427081428.GC9231@dragon>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150427081428.GC9231@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrej Rosano <andrej-6l9oX9VzF44FueaiHvvTSg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 2015-04-27, Shawn Guo wrote:
> On Fri, Mar 27, 2015 at 01:23:00PM -0700, Vagrant Cascadian wrote:
>> Add support for the USB armory board by Inverse Path. This board
>> features a Freescale iMX53 SoC, 512MB RAM, and USB OTG operating in
>> either peripheral or host mode, and 5 GPIO pins.
>>=20
>> One .dtb is generated for operating in peripheral mode, and one is
>> generated for operating in host mode.
>
> Is it possible to ask bootloader to patch the dtb instead of maintaining
> a new one for just changing one USB property?

It does appear to be possible with u-boot:

  load mmc 0:1 $fdt_addr_r $fdtfile
  fdt addr $fdt_addr_r
  fdt set /soc/aips@50000000/usb@53f80000 dr_mode host

Since the user would have to manually select the appropriate .dtb
anyways, it may be reasonable to drop the host_mode.dtb and rely on the
u-boot to tweak the fdt on boot to switch between usb modes.

It is considerably more complicated than setting the fdtfile variable to
the desired .dtb, as various out-of-the box boot scripts will load the
.dtb file defined in the fdtfile variable, overwriting any changes made
with "fdt set".

Given the additional complication in boot scripts, my preference would
be to ship both .dtb files...


Thanks for the time and consideration!


live well,
  vagrant

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVPqCaAAoJELeLgtSBS5G2byUP/jcSrQ8h6FWyzLkD5OqShu0p
zRA4+X/jkTCO66bI6LcHIX1a3UokOdCTf3HjepGYqUp0QfDBpSjjIm4xTYu6UGpR
i6EXgven/Wa3P/Sde9hBey+dQAIBIwiHeXQc2O2YsdrZZkaiZNAtZ/wYmqGm7vat
xG1fIZzImk4EGFPaEc9GNC7TR3TJpv/rFAgUIXf3bQIllHOOp7glXh+ZE/fDV9uw
84f55iVh8RbEbiesK7uAEmNlyXI1zvTFpDoidM5iH0RifOspINMwKsSG7E+494Lr
H2vvv1asD2VEtqYOwQKcuRrGXcDBKd3KTWj1/VknsAKXy1mcCnFL6oDwVhuvcllK
P36vCAay5MLLjuZu0ZSQ4J3Bh05/3c5mYUx/gpLfMdx3qK7vUL4FbITPd7ujLa7i
4gkhpnj6SKiKIquIXYb9JDg5AMBy7+4EgZXiIdKobQiV0ObGteciXZ9R7tlV7fMW
R8SJdtVXDNGlaJXd7RcHBU36UWasDuoslqpLXYKY5GOyk06rQbRDYKQ4B7YcsXbf
/VYjtv1Z9YuBll1qv3JuajdQcxBo8g/dFX5r7lVHZXAcWBe0DsZ7jmhGx/6Gp6i4
QIbeewm/hJAoavTyaoMRXDWV27RscqP3GJf74ddW6IFVrjE6uq9VO1zddb0/CExk
2fH9RnSTbleBneiYNu2b
=UVWf
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
