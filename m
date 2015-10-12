From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 7/7] ARM: bcm2835: Add VC4 to the device tree.
Date: Mon, 12 Oct 2015 13:57:22 -0700
Message-ID: <87zizn4xfx.fsf@eliezer.anholt.net>
References: <1444426068-15817-1-git-send-email-eric@anholt.net>
 <1444426068-15817-8-git-send-email-eric@anholt.net>
 <561A70C6.4070602@lategoodbye.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1286082485=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <561A70C6.4070602@lategoodbye.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stefan Wahren <info@lategoodbye.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1286082485==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Stefan Wahren <info@lategoodbye.de> writes:

> Am 09.10.2015 um 23:27 schrieb Eric Anholt:
>> VC4 is the GPU (display and 3D) present on the 2835.
>>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>
>> v2: Sort by register address, mark HDMI as disabled by default in the
>>      SoC file and enable it from -rpi.
>>
>> v3: Add references to the pixel/HSM clocks for HDMI.  Rename
>>      compatibility strings and clean up node names.
>>
>>   arch/arm/boot/dts/bcm2835-rpi.dtsi |  4 ++++
>>   arch/arm/boot/dts/bcm2835.dtsi     | 42 ++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 46 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
>> index 3572f03..dcaaee2 100644
>> --- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
>> +++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
>> @@ -56,6 +56,10 @@
>>   	status = "okay";
>>   };
>>
>> +&hdmi {
>> +	status = "okay";
>> +};
>> +
>>   &sdhci {
>>   	status = "okay";
>>   	bus-width = <4>;
>> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
>> index 1e61eb7..21e354a9 100644
>> --- a/arch/arm/boot/dts/bcm2835.dtsi
>> +++ b/arch/arm/boot/dts/bcm2835.dtsi
>> @@ -1,4 +1,5 @@
>>   #include <dt-bindings/pinctrl/bcm2835.h>
>> +#include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/clock/bcm2835.h>
>>   #include "skeleton.dtsi"
>>
>> @@ -149,6 +150,18 @@
>>   			status = "disabled";
>>   		};
>>
>> +		pixelvalve@7e206000 {
>> +			compatible = "brcm,bcm2835-pixelvalve0";
>> +			reg = <0x7e206000 0x100>;
>> +			interrupts = <2 13>; /* pwa2 */
>
> According to BCM2835-ARM-Peripherals this should be pwa0.
>
> Is it just a typo?
> What does pwa mean?

Just a typo.  I don't know what pwa means, either, it's just a string so
you can search for it in the docs.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWHB6yAAoJELXWKTbR/J7o4+4P/0R/gZo5rn+F2uGd2NPu0H3T
eWKMSUvH2yEaMnLxWqCENSkXIwfhSuoKFf8gMOqTml85vtCq388lBLhvuoHpN+Zb
8rJRT4XTe+5sJBHuOER0cMmSji8D6s/hiIFz6g6y282sBtGQbpfjcuOgkHj8O8Ce
S2xHXp9BHvnsCm+VHMzDKR2/UYlZU4zRUBMCjinuNW1mUYhkNTmjMGQkjffBzB73
NWG7hQn3eMr9gD8fw6NJOPkD/Rm+KKHUCEA5KfqRbtU7kqNeTNHE5xpOnUZsrxtC
kIEUPsdkGn1Z5sLytvQ6BCKJQRc5Pb1tyYUlD1jkMZ8J8uK489C7bX3hL6/LkU9/
wpncwKX+S42Lkv6KrlEYm14Y742rUUCnqo7+fkElHC3CACNluKvpJa5gsi1l3SS/
QetLA9D6B5598BwZqc6SXhkkcYcqytga+piSSqz8AzlOoH/1ppNvRMz30mA4Xvz9
vFXhsNsyemPAs2Z6oFRQqGqipGmRiRTXGfIk39SBp2KJ0Bod/G+D6/Qw5fNK1Ha+
vQUfhNItqWL85m33kbk0UKAKn9K/GHA5uzbKxTnKiw1Bbxyvl34DA1dZoU0Et+Wz
MEHHLsuO5XKJNjFt5j+EMbw7wtK9+BhSC4DqHW3dTQ+7/hVRjFdvsp1d+y3hk/ZT
wNVXfJ8PEqn39p2gYmeA
=r/uz
-----END PGP SIGNATURE-----
--=-=-=--

--===============1286082485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1286082485==--
