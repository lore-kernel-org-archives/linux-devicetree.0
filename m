From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: Add bindings for TI ADS8344
 A/DC chips
Date: Fri, 22 Mar 2019 10:41:42 +0100
Message-ID: <87lg17p7op.fsf@FE-laptop>
References: <20190315151152.30467-1-gregory.clement@bootlin.com>
 <20190315151152.30467-2-gregory.clement@bootlin.com>
 <20190316170730.2ed341cc@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190316170730.2ed341cc@archlinux>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Hartmut Knaack <knaack.h@gmx.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jonathan,
 
 On sam., mars 16 2019, Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 15 Mar 2019 16:11:50 +0100
> Gregory CLEMENT <gregory.clement@bootlin.com> wrote:
>
>> This adds device tree bindings for the TI ADS8344 A/DC chips.
>> 
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> Looks good to me, though io-channel-cells only needs to be 1 if
> you have consumers...  Otherwise, it shouldn't be there at all..

OK I will remove it then.

Thanks,

Gregory

>
> Jonathan
>
>> ---
>>  .../bindings/iio/adc/ti-ads8344.txt           | 21 +++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-ads8344.txt
>> 
>> diff --git a/Documentation/devicetree/bindings/iio/adc/ti-ads8344.txt b/Documentation/devicetree/bindings/iio/adc/ti-ads8344.txt
>> new file mode 100644
>> index 000000000000..6576c4fed7b7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/ti-ads8344.txt
>> @@ -0,0 +1,21 @@
>> +* Texas Instruments ADS8344 A/DC chip
>> +
>> +Required properties:
>> + - compatible: Must be "ti,ads8344"
>> + - #io-channel-cells: Must be 1 as per ../iio-bindings.txt
>> + - reg: SPI chip select number for the device
>> + - vref-supply: phandle to a regulator node that supplies the
>> +   reference voltage
>> +
>> +Recommended properties:
>> + - spi-max-frequency: Definition as per
>> +		Documentation/devicetree/bindings/spi/spi-bus.txt
>> +
>> +Example:
>> +adc@0 {
>> +	compatible = "ti,ads8344";
>> +	reg = <0>;
>> +	#io-channel-cells = <1>;
>> +	vref-supply = <&refin_supply>;
>> +	spi-max-frequency = <10000000>;
>> +};
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
