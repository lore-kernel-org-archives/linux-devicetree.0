From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3 1/7] mfd: Add Device Tree bindings document for
 retu/tahvo ASIC chips
Date: Mon, 3 Apr 2017 11:40:23 -0400
Message-ID: <8e411455-3ed1-1de6-69f7-4854a1a823b0@osg.samsung.com>
References: <20170401071854.23198-1-javier@osg.samsung.com>
 <20170401071854.23198-2-javier@osg.samsung.com>
 <20170403111301.52hm4wsplimviqso@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170403111301.52hm4wsplimviqso@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hello Lee,

Thanks a lot for your feedback.

On 04/03/2017 07:13 AM, Lee Jones wrote:
> On Sat, 01 Apr 2017, Javier Martinez Canillas wrote:
> 
>> There are Device Tree source files defining a device node for the
>> retu/tahvo I2C chip, but there isn't a DT binding document for it.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>> Changes in v3: None
>> Changes in v2: None
>>
>>  Documentation/devicetree/bindings/mfd/retu.txt | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/retu.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/retu.txt b/Documentation/devicetree/bindings/mfd/retu.txt
>> new file mode 100644
>> index 000000000000..2309e599a731
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/retu.txt
>> @@ -0,0 +1,19 @@
>> +* Device tree bindings for Nokia Retu and Tahvo multi-function device
>> +
>> +Retu and Tahvo are a multi-function devices found on Nokia Internet
>> +Tablets (770, N800 and N810).
> 
> More information please.  What functions to they serve?
>

I'm not really familiar with these drivers, I'm just doing this as a part
of the bigger work to fix the I2C core to report a proper OF modaliases.

So I took the information I could find in the driver Kconfig and headers,
but I'll see if I can find more information in the driver or if there is
documentation about these online.
 
>> +Required properties:
>> +- compatible:		"nokia,retu-mfd" or "nokia,tahvo-mfd"
>> +- reg:			Specifies the I2C slave address of the ASIC chip
>> +
>> +Example:
>> +
>> +i2c0 {
>> +	retu_mfd: retu@1 {
> 
> Please avoid the term MFD at all times when using Device Tree.  DT is
> meant to be OS agnostic and MFD is a Linuxisum.
>

Yes, sorry. I just copied the DT snippet from a DTS that used this, I'll
remove it on the next version.

>> +		compatible = "nokia,retu-mfd";
>> +		interrupt-parent = <&gpio4>;
>> +		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
>> +		reg = <0x1>;
>> +	};
>> +};
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
