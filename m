From: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add dps650ab documentation
Date: Fri, 11 Jan 2019 08:25:23 +0000
Message-ID: <878e5a2d4495479688ff6df866b092e5@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
 <0527fcf7155ea12a2a1be680b3617691e6e26d72.1546918172.git.xiaoting.liu@hxt-semitech.com>
 <20190110184624.GC9010@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yang, Shunyong" <shunyong.yang@hxt-semitech.com>, "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
List-Id: devicetree@vger.kernel.org

On 2019/1/11 2:46, Guenter Roeck wrote:
> On Thu, Jan 10, 2019 at 10:24:33AM +0800, Xiaoting Liu wrote:
>> Bindings for Delta Electronics DPS-650-AB power supply.
>>
>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> Waiting for DT maintainer Ack to apply. Note that you did not copy
> linux-hwmon@vger.kernel.org. As a result, it _may_ get lost since
> https://patchwork.kernel.org/project/linux-hwmon/list/ is my primary
> means to track hwmon patches, and it isn't there.
> If I don't the patch after the Ack, please resend and remember
> to include the hwmon mailing list.
>
> Thanks,
> Guenter

Thanks for your kindly reminder! I will loop linux-hwmon@vger.kernel.org

when I resend the patch.

Xiaoting

>> ---
>> v3:
>>   Change patch commit message.
>>   Add vendor delta to the compatible property.
>> ---
>> v2:
>>   Change the patch subject.
>> ---
>>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>> new file mode 100644
>> index 000000000000..32d89e4f4956
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>> @@ -0,0 +1,11 @@
>> +Bindings for Delta Electronics DPS-650-AB power supply
>> +
>> +Required properties:
>> +- compatible : "delta,dps650ab"
>> +- reg        : I2C address, one of 0x58, 0x59.
>> +
>> +Example:
>> +	dps650ab@58 {
>> +		    compatible = "delta,dps650ab";
>> +		    reg = <0x58>;
>> +	};
>> -- 
>> 1.8.3.1
>>
