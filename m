From: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: hwmon: add dps650ab documentation
Date: Tue, 8 Jan 2019 08:57:19 +0000
Message-ID: <6d28f64bd2f441d09819d66b55537e0b@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
 <0087d2d9c7cd7f38761f76c80d1c37cb2cea6ef2.1546851856.git.xiaoting.liu@hxt-semitech.com>
 <568735a3-1de2-3880-5fe1-7be38a55f33f@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com" <jdelvare@suse.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Yang, Shunyong" <shunyong.yang@hxt-semitech.com>, "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
List-Id: devicetree@vger.kernel.org

On 2019/1/7 21:58, Guenter Roeck wrote:
> On 1/7/19 3:00 AM, Xiaoting Liu wrote:
>> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
>>
>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
>> ---
>> v2:
>>    Change the patch subject.
>> ---
>>   Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>> new file mode 100644
>> index 000000000000..6bbbff89f6d5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>> @@ -0,0 +1,11 @@
>> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
>> +
> Assuming this is the Delta Electronics DPS-650-AB power supply, I think
> you should mention that here.
I will update commit message as mentioned.
>
>> +Required properties:
>> +- compatible : "dps650ab"
> Again, assuming this is the Delta Electronics power supply, this should
> probably be something like "delta,dps650ab".

OK, I will add delta to compatible property.

Thanks,

Xiaoting

>
> Thanks,
> Guenter
>
>> +- reg       : I2C address, one of 0x58, 0x59.
>> +
>> +Example:
>> +       dps650ab@58 {
>> +                   compatible = "dps650ab";
>> +                   reg = <0x58>;
>> +       };
>> --
>> 1.8.3.1
>>
>>
>>
>>
