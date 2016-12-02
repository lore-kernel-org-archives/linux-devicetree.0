From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/3] lib: add bitrev8x4()
Date: Thu, 1 Dec 2016 16:04:09 -0800
Message-ID: <8fb2f1c2-c39c-b74f-d5c8-d6731cbd67c8@gmail.com>
References: <cover.1480551148.git.stillcompiling@gmail.com>
 <bc92eb1507448731163ae67fc888668d327f9168.1480551148.git.stillcompiling@gmail.com>
 <20161201234523.3bed63dc@crub>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161201234523.3bed63dc@crub>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Anatolij,

Thanks for the review.

On 12/01/2016 02:45 PM, Anatolij Gustschin wrote:
> On Thu,  1 Dec 2016 09:04:50 -0800
> Joshua Clayton stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> ...
>> diff --git a/arch/arm/include/asm/bitrev.h b/arch/arm/include/asm/bitrev.h
>> index ec291c3..6d2e9ca 100644
>> --- a/arch/arm/include/asm/bitrev.h
>> +++ b/arch/arm/include/asm/bitrev.h
>> @@ -17,4 +17,9 @@ static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
>> 	return __arch_bitrev32((u32)x) >> 24;
>> }
>>
>> +static __always_inline __attribute_const__ u32 __arch_bitrev8x4(u32 x)
>> +{
>> +	__asm__ ("rbit %0, %1; rev %0, %0" : "=r" (x) : "r" (x));
> 	return x;
Oops thats a little embarrassing;
I'll add a return.
>> +}
> otherwise you get
>
> In function '__arch_bitrev8x4':
> warning: no return statement in function returning non-void [-Wreturn-type]
>
> --
> Anatolij

I wonder why I do not see this warning when compiling. The inlining, maybe?


Joshua
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
