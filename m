From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v4 1/3] lib: add bitrev8x4()
Date: Fri, 2 Dec 2016 08:51:57 +0100
Message-ID: <20161202085157.1a6ec811@crub>
References: <cover.1480551148.git.stillcompiling@gmail.com>
        <bc92eb1507448731163ae67fc888668d327f9168.1480551148.git.stillcompiling@gmail.com>
        <20161201234523.3bed63dc@crub>
        <8fb2f1c2-c39c-b74f-d5c8-d6731cbd67c8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8fb2f1c2-c39c-b74f-d5c8-d6731cbd67c8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Joshua,

On Thu, 1 Dec 2016 16:04:09 -0800
Joshua Clayton stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
...
>>> +static __always_inline __attribute_const__ u32 __arch_bitrev8x4(u32 x)
>>> +{
>>> +	__asm__ ("rbit %0, %1; rev %0, %0" : "=r" (x) : "r" (x));  
>> 	return x;  
>Oops thats a little embarrassing;
>I'll add a return.
>>> +}  
>> otherwise you get
>>
>> In function '__arch_bitrev8x4':
>> warning: no return statement in function returning non-void [-Wreturn-type]
>>
>
>I wonder why I do not see this warning when compiling. The inlining, maybe?

do you have CONFIG_HAVE_ARCH_BITREVERSE=y in your .config?
Probably not optimized code is used, otherwise you will send wrong
data to FPGA (due to wrong return values from __arch_bitrev8x4).

Anatolij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
