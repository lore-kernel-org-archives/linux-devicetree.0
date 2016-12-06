From: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun8i: Specify memblock for Nano Pi M1
Date: Tue, 6 Dec 2016 16:23:57 +0900
Message-ID: <9607940c-1ca9-bb49-291e-ddc7e77546be@gmail.com>
References: <20161205020032.26586-1-woogyom.kim@gmail.com>
 <20161205080932.xaqyl2httgxgso67@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161205080932.xaqyl2httgxgso67@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/05/2016 05:09 PM, Maxime Ripard wrote:
> On Mon, Dec 05, 2016 at 11:00:31AM +0900, Milo Kim wrote:
>> The board has DDR3 512MB. This patch helps scanning the memory and
>> adding memblock through the DT.
>>
>> Signed-off-by: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
>> index ec63d10..be3668f 100644
>> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
>> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
>> @@ -45,6 +45,11 @@
>>  / {
>>  	model = "FriendlyArm NanoPi M1";
>>  	compatible = "friendlyarm,nanopi-m1", "allwinner,sun8i-h3";
>> +
>> +	memory@40000000 {
>> +		device_type = "memory";
>> +		reg = <0x40000000 0x20000000>;
>> +	};
>
> U-boot will fill that up, so there's no need to put it there.

Right, my intention was adding memblock through the DT whether the 
bootload does or not. However I'm not sure the situation (missing 
memblock in u-boot) could really happen.

Best regards,
Milo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
