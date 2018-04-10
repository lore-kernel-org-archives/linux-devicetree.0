From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 4/5] DTS: Bindings: pca953x driver provides an optional vcc-supply property
Date: Tue, 10 Apr 2018 16:08:14 +0200
Message-ID: <A246E2A2-F360-4099-91E2-8A5A25656A36@goldelico.com>
References: <cover.1522868422.git.hns@goldelico.com> <e8e6fae4436e5390c7c4e831c9eb127d3f8cc65b.1522868423.git.hns@goldelico.com> <20180410135557.umt5sgxrx23dirpo@rob-hp-laptop>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180410135557.umt5sgxrx23dirpo@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: galak@codeaurora.org, andy.shevchenko@gmail.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org


> Am 10.04.2018 um 15:55 schrieb Rob Herring <robh@kernel.org>:
>=20
> On Wed, Apr 04, 2018 at 09:00:23PM +0200, H. Nikolaus Schaller wrote:
>> So let's describe this property in the bindings.
>=20
> It's not what the driver for some OS has. The h/w has a Vcc supply, so=20=

> let's add a property for it...

Ah, ok. It is a matter of speaker's standpoint :)

>=20
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>> 1 file changed, 1 insertion(+)
>=20
> Otherwise,
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks,
Nikolaus

>=20
>>=20
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt =
b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> index d2a937682836..6a7cddb187c1 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> @@ -35,6 +35,7 @@ Required properties:
>> Optional properties:
>>  - reset-gpios: GPIO specification for the RESET input. This is an
>> 		active low signal to the PCA953x.
>> + - vcc-supply:	power supply regulator.
>>=20
>> Example:
>>=20
>> --=20
>> 2.12.2
>>=20
