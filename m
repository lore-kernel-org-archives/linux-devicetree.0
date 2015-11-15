From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/2] iio: ti-ads8688: Add DT binding documentation
Date: Sun, 15 Nov 2015 10:57:04 +0000
Message-ID: <56486500.6040707@kernel.org>
References: <1447073580-17889-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1447073580-17889-2-git-send-email-sean.nyekjaer@prevas.dk>
 <20151109155759.GA23092@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151109155759.GA23092@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/11/15 15:57, Rob Herring wrote:
> On Mon, Nov 09, 2015 at 01:53:00PM +0100, Sean Nyekjaer wrote:
>> Adding binding documentation for Texas Instruments ADS8688 ADC.
>>
>> Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
>> Reviewed-by: Martin Hundeb=F8ll <martin.hundeboll-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Applied to the togreg branch of iio.git - initially pushed out
as testing to let the autobuilders work their magic.

Thanks and thanks Rob for reviewing these bindings!

Jonathan
>=20
>> ---
>> Changes since v2:
>> - Moved vref-supply to Optional properties
>>
>>  .../devicetree/bindings/iio/adc/ti-ads8688.txt       | 20 +++++++++=
+++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-ads=
8688.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/ti-ads8688.tx=
t b/Documentation/devicetree/bindings/iio/adc/ti-ads8688.txt
>> new file mode 100644
>> index 0000000..a02337d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/ti-ads8688.txt
>> @@ -0,0 +1,20 @@
>> +* Texas Instruments' ADS8684 and ADS8688 ADC chip
>> +
>> +Required properties:
>> + - compatible: Should be "ti,ads8684" or "ti,ads8688"
>> + - reg: spi chip select number for the device
>> +
>> +Recommended properties:
>> + - spi-max-frequency: Definition as per
>> +		Documentation/devicetree/bindings/spi/spi-bus.txt
>> +
>> +Optional properties:
>> + - vref-supply: The regulator supply for ADC reference voltage
>> +
>> +Example:
>> +adc@0 {
>> +	compatible =3D "ti,ads8688";
>> +	reg =3D <0>;
>> +	vref-supply =3D <&vdd_supply>;
>> +	spi-max-frequency =3D <1000000>;
>> +};
>> --=20
>> 2.6.2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree=
" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
