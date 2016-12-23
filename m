From: Anurup M <anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: hisi: Add Hisilicon HiP05/06/07
 Djtag dts bindings
Date: Fri, 23 Dec 2016 15:47:55 +0530
Message-ID: <585CF9D3.2010002@gmail.com>
References: <1481129719-159487-1-git-send-email-anurup.m@huawei.com>
 <20161219163126.w6ibkd6ayvblkwqt@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161219163126.w6ibkd6ayvblkwqt@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, sanil.kumar-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shiju.jose-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shyju.pv-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Monday 19 December 2016 10:01 PM, Rob Herring wrote:
> On Wed, Dec 07, 2016 at 11:55:19AM -0500, Anurup M wrote:
>> From: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>
>> Add Hisilicon HiP05/06/07 Djtag dts bindings for CPU and IO Die
>>
>> Signed-off-by: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Anurup M <anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> ---
>>   .../devicetree/bindings/arm/hisilicon/djtag.txt    | 41 ++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/djtag.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/djtag.txt b/Documentation/devicetree/bindings/arm/hisilicon/djtag.txt
>> new file mode 100644
>> index 0000000..733498e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/hisilicon/djtag.txt
>> @@ -0,0 +1,41 @@
>> +The Hisilicon Djtag is an independent component which connects with some other
>> +components in the SoC by Debug Bus. The djtag is available in CPU and IO dies
>> +in the chip. The djtag controls access to connecting modules of CPU and IO
>> +dies.
>> +The various connecting components in CPU die (like L3 cache, L3 cache PMU etc.)
>> +are accessed by djtag during real time debugging. In IO die there are connecting
>> +components like RSA. These components appear as devices atatched to djtag bus.
>> +
>> +Hisilicon HiP05/06 djtag for CPU and HiP05 IO die
>> +Required properties:
>> +  - compatible : "hisilicon,hisi-djtag-v1"
> These need SoC specific compatible strings. They probably should
> also include cpu or io in the compatible string. I would expect there
> are things like events, triggers, or component connections for debug
> that are SoC specifc.

Ok. Shall include SoC prefix in compatible string. e.g. 
"hisilicon,hip06-djtag-v1".
As the djtag driver handling is same for CPU and IO, I think I don't 
need to include
them in the compatible string. Please share your comment.

Thanks,
Anurup

>> +  - reg : Register address and size
>> +  - scl-id : The Super Cluster ID for CPU or IO die
>> +
>> +Hisilicon HiP06 djtag for IO die and HiP07 djtag for CPU and IO die
>> +Required properties:
>> +  - compatible : "hisilicon,hisi-djtag-v2"
> Same here.
>
>> +  - reg : Register address and size
>> +  - scl-id : The Super Cluster ID for CPU or IO die
>> +
>> +Example 1: Djtag for CPU die
>> +
>> +	/* for Hisilicon HiP05 djtag for CPU Die */
>> +	djtag0: djtag@80010000 {
>> +		compatible = "hisilicon,hisi-djtag-v1";
>> +		reg = <0x0 0x80010000 0x0 0x10000>;
>> +		scl-id = <0x02>;
>> +
>> +		/* All connecting components will appear as child nodes */
>> +	};
>> +
>> +Example 2: Djtag for IO die
>> +
>> +	/* for Hisilicon HiP05 djtag for IO Die */
>> +	djtag1: djtag@d0000000 {
>> +		compatible = "hisilicon,hisi-djtag-v1";
>> +		reg = <0x0 0xd0000000 0x0 0x10000>;
>> +		scl-id = <0x01>;
>> +
>> +		/* All connecting components will appear as child nodes */
>> +	};
>> -- 
>> 2.1.4
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
