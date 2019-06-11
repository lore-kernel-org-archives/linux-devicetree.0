From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] Documentation: dt-bindings: add the Amlogic Meson
 Temperature Sensor
Date: Tue, 11 Jun 2019 13:01:35 +0200
Message-ID: <d68aae23-f877-1f65-94a4-79e909ae111a@baylibre.com>
References: <20190604144714.2009-1-glaroque@baylibre.com>
 <20190604144714.2009-2-glaroque@baylibre.com>
 <CAFBinCBN4QC2tPDEQmTW_c+PP5yu2qoK5M1eSye=SmvpieKWQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCBN4QC2tPDEQmTW_c+PP5yu2qoK5M1eSye=SmvpieKWQg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Guillaume La Roque <glaroque@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, khilman@baylibre.com, linux-kernel@vger.kernel.org, jic23@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06/06/2019 21:16, Martin Blumenstingl wrote:
> Hi Guillaume,
> 
> thank you for working on this!
> 
> On Tue, Jun 4, 2019 at 4:47 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>>
>> This adds the devicetree binding documentation for the Temperature
>> Sensor found in the Amlogic Meson G12 SoCs.
>> Currently only the G12A SoCs are supported.
> so G12B is not supported (yet)?

G12B is 95% similar as G12A, it will certainly use slighly different values.

> 
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  .../iio/temperature/amlogic,meson-tsensor.txt | 31 +++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
>> new file mode 100644
>> index 000000000000..d064db0e9cac
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
>> @@ -0,0 +1,31 @@
>> +* Amlogic Meson Temperature Sensor
>> +
>> +Required properties:
>> +- compatible:  depending on the SoC and the position of the sensor,
>> +               this should be one of:
>> +               - "amlogic,meson-g12a-cpu-tsensor" for the CPU G12A SoC sensor
>> +               - "amlogic,meson-g12a-ddr-tsensor" for the DDR G12A SoC sensor
>> +               followed by the common :
>> +               - "amlogic,meson-g12a-tsensor" for G12A SoC family
>> +- reg:         the physical base address and length of the registers
>> +- interrupts:  the interrupt indicating end of sampling
>> +- clocks:      phandle identifier for the reference clock of temperature sensor
>> +- #io-channel-cells: must be 1, see ../iio-bindings.txt
> have you considered using the thermal framework [0] instead of the iio
> framework (see below)?

Question: why thermal, and not hwmon ? what's the main difference ?

> 
>> +- amlogic,ao-secure: phandle to the ao-secure syscon
> the driver has some "u_efuse_off" access. do we need to get some
> calibration values from the AO syscon or can we also fetch it from the
> eFuse? you can look at arch/arm/boot/dts/meson8.dtsi where I'm passing
> the temperature sensor calibration data to the SAR ADC (there's no
> dedicated temperature sensor IP block prior to G12A) while reading the
> data from the eFuse
> 
>> +Optional properties:
>> +- amlogic,critical-temperature: temperature value in milli degrees Celsius
>> +       to set automatic reboot on too high temperature
> as far as I can tell the thermal framework supports multiple trip
> points. I'm seeing this as a benefit because the hardware can raise
> interrupts at four different temperatures (defined by the driver)

Theoretically, but the implementation code differs a lot from the datasheet.

> 
>> +Example:
>> +       cpu_temp: temperature-sensor@ff634800 {
>> +               compatible = "amlogic,meson-g12a-cpu-tsensor",
>> +                            "amlogic,meson-g12a-tsensor";
>> +               reg = <0x0 0xff634800 0x0 0x50>;
>> +               interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
>> +               clocks = <&clkc CLKID_TS>;
>> +               status = "okay";
> as far as I know the dt-bindings should not have a status property in
> the examples
> 
> 
> Martin
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
