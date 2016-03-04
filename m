From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: bcm2835: Add devicetree for the Raspberry Pi 3.
Date: Fri, 04 Mar 2016 10:55:03 -0800
Message-ID: <874mcm3wfs.fsf@eliezer.anholt.net>
References: <1457116769-8567-1-git-send-email-eric@anholt.net> <1457116769-8567-2-git-send-email-eric@anholt.net> <20160304184136.GB5033@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160304184136.GB5033@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:

> On Fri, Mar 04, 2016 at 10:39:29AM -0800, Eric Anholt wrote:
>> For now this doesn't support the new hardware present on the Pi 3 (BT,
>> wifi, GPIO expander).  Since the GPIO expander isn't supported, we
>> also don't have the LEDs like the other board files do.
>>=20
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/Makefile            |  3 +-
>>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 22 ++++++++++++
>>  arch/arm/boot/dts/bcm2837.dtsi        | 68 ++++++++++++++++++++++++++++=
+++++++
>>  3 files changed, 92 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>>  create mode 100644 arch/arm/boot/dts/bcm2837.dtsi
>
>> +	timer {
>> +		compatible =3D "arm,armv7-timer";
>> +		interrupt-parent =3D <&local_intc>;
>> +		interrupts =3D <0>, // PHYS_SECURE_PPI
>> +			     <1>, // PHYS_NONSECURE_PPI
>> +			     <3>, // VIRT_PPI
>> +			     <2>; // HYP_PPI
>> +		always-on;
>> +	};
>
> Are the CPUs in an always-on power domain? Or is it jsut that the kernel
> doesn't perform power management of CPUs?
>
> The always-on proeprty is only intended for the former.

The kernel doesn't get to do power management of CPUs.  We only have
control of power domains through the firmware, and the firmware's
keeping the CPU domain on.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW2doHAAoJELXWKTbR/J7oePsP/0/2O7qonmHyKSejusdkjhFN
KumkvvgEh31LRtPAO035ntXd76EEcC7wl3lKX/5cKTJEx1KxlPP0L4oFQRvKiq1l
FV4B/cMG3QbQAqbWpXKwV3qkAjFjNi2T2mKhRauL99ZndNaauZGIiZd0sfeS9uAR
tl6Kr7IlW3AKxKXkRlx5h7NJ2uaP7YeTC6qp2VJdwS9xgd1DWkolhbHXrxxKkyL7
lcEG5nvv6zt0pNI7cz5mK5+4c+KvxJK5CoRZf290qpsZ0nOp4ntNTcG85gNMuWre
ESIeOu+/eB12IZbd08hX6TU+vz65cY7HeBXn1nUUsLCD3yUsAl0OkOm3Agtyo+yc
PSOuk8vqPDArPcIiRJII3tKi6/iRI92wJLhYH4dR1fB1DeiJ1fvYFb/WNK8jznmJ
p8BaSFA3AXD53DpNNDvVX72Ye9Vf+SVHpmGQuJL9fWfdn0UQHtLCYM3HTtChd11i
jpGXHLyeeNUJoAqwAiTz3lEZ/DeNC+TcT12ztOYG6q8Sb0Zthw0KFLWsZZC0NaQh
6oiZg7BRmUa9hbBfB2klXwZ4mupc9+XokouMMQr92e4Myc7t+g9VQRwR6ZIzSPZb
D+4RO2CIPicNk14TkAqN7C5goR5Z7uXo8e2QUs92mI1KbmuqKbc80kiZXQ47UE8x
hnsYcHop/QZHNJER+Xc5
=JxV6
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
