From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 07/20] Documentation: dt: iio: Add binding for LPS001WP
Date: Tue, 01 Oct 2013 22:13:02 +0100
Message-ID: <524B3ADE.9060602@kernel.org>
References: <1379347346-823-1-git-send-email-lee.jones@linaro.org> <1379347346-823-8-git-send-email-lee.jones@linaro.org> <524B3A19.9050509@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <524B3A19.9050509-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/01/13 22:09, Jonathan Cameron wrote:
> On 09/16/13 17:02, Lee Jones wrote:
>> LPS001WP is a Pressure and Temperature sensor.
>>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Hi Lee,
> 
> I'm planning to drop this set of bindings in favour of the unified ones
> proposed by Lukasz Czerwinski.
Sorry, I just realised this is unclear.  I'm proposing to drop the
documentation added in this patch in favour of the other version
in which a file per type of sensor is used rather than one per
individual sensor chip.
> 
> Could you take a look at those and perhaps propose the additional bits and pieces
> needed to ensure everything is covered by the resulting files?
> 
> Thanks,
> 
> Jonathan
>> ---
>>  .../devicetree/bindings/iio/pressure/lps001wp.txt   | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/pressure/lps001wp.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/pressure/lps001wp.txt b/Documentation/devicetree/bindings/iio/pressure/lps001wp.txt
>> new file mode 100644
>> index 0000000..45cb45c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/pressure/lps001wp.txt
>> @@ -0,0 +1,21 @@
>> +* STMicroelectronics Pressure Sensor
>> +
>> +Required properties:
>> +  - compatible: Should be "st,lps001wp"
>> +  - reg: The I2C address of the sensor
>> +
>> +Optional properties:
>> +  - vdd-supply: Phandle to the Vdd supply regulator
>> +  - vddio-supply: Phandle to the Vdd-IO supply regulator
>> +
>> +Example:
>> +
>> +i2c@80128000 {
>> +        lps001wp@5c {
>> +                compatible = "st,lps001wp";
>> +                reg = <0x5c>;
>> +
>> +                vdd-supply = <&ab8500_ldo_aux1_reg>;
>> +                vddio-supply = <&db8500_vsmps2_reg>;
>> +        };
>> +};
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
