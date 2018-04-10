From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 5/5] DTS: Bindings: pca953x: add example how to use interrupt-controller and gpio-controller
Date: Tue, 10 Apr 2018 16:10:23 +0200
Message-ID: <52F2CECC-242A-4633-A4BE-D064E53549FD@goldelico.com>
References: <cover.1522868422.git.hns@goldelico.com> <4d00318d00bf0c946ee9b83e30e38d3b7a636183.1522868423.git.hns@goldelico.com> <20180410135749.dq3ub3kcb72e3hlr@rob-hp-laptop>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180410135749.dq3ub3kcb72e3hlr@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: galak@codeaurora.org, andy.shevchenko@gmail.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org


> Am 10.04.2018 um 15:57 schrieb Rob Herring <robh@kernel.org>:
>=20
> On Wed, Apr 04, 2018 at 09:00:24PM +0200, H. Nikolaus Schaller wrote:
>> It is not completely obvious that these are required as
>> some .dts files don't specify them.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> .../devicetree/bindings/gpio/gpio-pca953x.txt      | 33 =
++++++++++++++++++++++
>> 1 file changed, 33 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt =
b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> index 6a7cddb187c1..7f3b50a6d681 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> @@ -36,6 +36,10 @@ Optional properties:
>>  - reset-gpios: GPIO specification for the RESET input. This is an
>> 		active low signal to the PCA953x.
>>  - vcc-supply:	power supply regulator.
>> + - gpio-controller: if used as gpio expander.
>> + - #gpio-cells: if used as gpio expander.
>> + - interrupt-controller: if to be used as interrupt expander.
>> + - #interrupt-cells: if to be used as interrupt expander.
>=20
> These should be required. It's a mistake if dts files don't have them.

Well, it seems to be a config option if the chip handles interrupts
at all, but I also tend to say they are required.

>=20
>>=20
>> Example:
>>=20
>> @@ -48,3 +52,32 @@ Example:
>> 		interrupt-parent =3D <&gpio3>;
>> 		interrupts =3D <23 IRQ_TYPE_LEVEL_LOW>;
>> 	};
>> +
>> +
>> +Example with Interrupts:
>> +
>> +
>> +	gpio99: tca6424@22 {
>=20
> gpio@22

Ok!

>=20
>> +		compatible =3D "nxp,pcal6524";
>> +		reg =3D <0x22>;
>> +		interrupt-parent =3D <&gpio6>;
>> +		interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;	/* =
gpio6_161 */
>> +		interrupt-controller;
>> +		#interrupt-cells =3D <2>;
>> +		vcc-supply =3D <&vdds_1v8_main>;
>> +		gpio-controller;
>> +		#gpio-cells =3D <2>;
>> +		gpio-line-names =3D
>> +			"hdmi-ct-hpd", "hdmi.ls-oe", "p02", "p03", =
"vibra", "fault2", "p06", "p07",
>> +			"en-usb", "en-host1", "en-host2", "chg-int", =
"p14", "p15", "mic-int", "en-modem",
>> +			"shdn-hs-amp", "chg-status+red", "green", =
"blue", "en-esata", "fault1", "p26", "p27";
>> +	};
>> +
>> +	ts3a227@3b {
>> +		compatible =3D "ti,ts3a227e";
>> +		reg =3D <0x3b>;
>> +		interrupt-parent =3D <&gpio99>;
>> +		interrupts =3D <14 IRQ_TYPE_EDGE_RISING>;
>> +		ti,micbias =3D <0>;	/* 2.1V */
>> +	};
>> +
>> --=20
>> 2.12.2
>>=20

BR and thanks,
Nikolaus
