From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Disable SCPI DVFS
Date: Fri, 6 Jan 2017 09:04:17 +0100
Message-ID: <cd6bbd24-f014-7342-34e6-ead7eec429f4@baylibre.com>
References: <1483628549-29486-1-git-send-email-narmstrong@baylibre.com>
 <9f508097-f605-ebd8-20af-c3e798c6fdcc@poczta.onet.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="GmkxHMmbqVGV8bILqPhq3BXoJXvobHSAC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9f508097-f605-ebd8-20af-c3e798c6fdcc-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org>, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GmkxHMmbqVGV8bILqPhq3BXoJXvobHSAC
Content-Type: multipart/mixed; boundary="DMLGPPfTJcxRsBMCfIkd3ogD3sVUcpFT1";
 protected-headers="v1"
From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
To: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org>,
 khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Message-ID: <cd6bbd24-f014-7342-34e6-ead7eec429f4-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Disable SCPI DVFS
References: <1483628549-29486-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
 <9f508097-f605-ebd8-20af-c3e798c6fdcc-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org>
In-Reply-To: <9f508097-f605-ebd8-20af-c3e798c6fdcc-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org>

--DMLGPPfTJcxRsBMCfIkd3ogD3sVUcpFT1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/05/2017 08:04 PM, Micha=C5=82 Zegan wrote:
> Hello.
>=20
> The patch causes cpufreq module (scpi-cpufreq) not to detect cpufreq, s=
o
> it actually works, but...
> Loading the module causes few errors because of not found frequencies o=
r
> something, then it is all okay. However after loading scpi-cpufreq you
> cannot actually power the cpu off and on. You will power it off
> successfully, but when trying to power it on, the cpufreq driver will
> error out, and then after it happens, the cpu that was trying to go
> online will be offline again, and that is a little... unfortunate. The
> question is, and I cannot really test that: will the module actually
> autoload after this change?

Hi Michal,

You are right, it breaks cpufreq and the cpu hotplug feature, I will send=
 a v2 completely disabling cpufreq instead.

For the module autoloading, the arm_scpi.ko must be loaded before the oth=
er scpi modules.

Please ask Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> if module autoloading for =
scpi is meant to work.

Neil


>=20
> W dniu 05.01.2017 o 16:02, Neil Armstrong pisze:
>> The current hardware is not able to run with all cores enabled at a
>> cluster frequency superior at 1536MHz.
>> But the currently shipped u-boot for the platform still reports an OPP=

>> table with possible DVFS frequency up to 2GHz, and will not change sin=
ce
>> the off-tree linux tree supports limiting the OPPs with a kernel param=
eter.
>> A recent u-boot change reports the boot-time DVFS around 100MHz and
>> the default performance cpufreq governor sets the maximum frequency.
>> Previous version of u-boot reported to be already at the max OPP and
>> left the OPP as is.
>> Nevertheless, other governors like ondemand could setup the max freque=
ncy
>> and make the system crash.
>>
>> This patch disables the DVFS clock and disables cpufreq.
>>
>> Fixes: 70db166a2baa ("ARM64: dts: meson-gxbb: Add SCPI with cpufreq & =
sensors Nodes")
>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arc=
h/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
>> index 238fbea..5e63e3b 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
>> @@ -137,6 +137,10 @@
>>  	};
>>  };
>> =20
>> +&scpi_dvfs {
>> +	status =3D "disabled";
>> +};
>> +
>>  &uart_AO {
>>  	status =3D "okay";
>>  	pinctrl-0 =3D <&uart_ao_a_pins>;
>>
>=20



--DMLGPPfTJcxRsBMCfIkd3ogD3sVUcpFT1--

--GmkxHMmbqVGV8bILqPhq3BXoJXvobHSAC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJYb0+CAAoJEHfc29rIyEnRHP0QAMsWL4KefWjP52x6Nsn6lB9P
GmTSDy5iReWwr40c1G4ZqhGPS9OnC4fuIUJFNeK47C2X7dQe2FhEx7wbqRAcvTAP
eH94xriMA+8ZY2xkoew2VAKYGuoDawKYjZPGGTQJHwpobAySeoLaAWGeGwewW0+9
plBcuFKnPXWUKWf00QmjFOBLgwuGXRpeakfT4lcdNDrHnIjfa9M4SgBA/gtzJl+L
y/30G1eqVInpc+eNN6uwAj4OpCPXXJg3LDsdU4+xB4lGFUi6gqcAstyHnZIo/cKX
wfL5t/E1MO7McAbsLlquySLkF53I6o2hNm29phFk5YqA0UO2KDJw/J490ocpUx4l
I/rZMNAGh8hw0TnkvrJiepETovokeR41J8d4QcJTrnYOcKONVWHFK5sLaC44MqjW
cX2SCmukiYENSnxUv07kkRuX7nDRJSHxE6cw/vK3qtloJ39SZpZbY3Q2i0HIuvmB
1ibHDOx1JR61jPwS/uWuSL1l0EFA3hl+/O1z5J6/LJeqMbxCzI1v+nbnmFu80ib7
GVc/7g5x3QIUvVkFL72HDczbbfyLdTUmKGWtxYSNZ/pDmIQlz/CDr5fXfEFpPJzx
oHPbq4apA7qK7vBjkTy0IJxM8bWPs5HKT44C1W+QIQwlLuOs/EJDlH3ODqdCIfbi
twnEtr2huaksQmXv8tJg
=MA/2
-----END PGP SIGNATURE-----

--GmkxHMmbqVGV8bILqPhq3BXoJXvobHSAC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
