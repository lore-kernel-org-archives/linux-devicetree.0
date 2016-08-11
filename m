From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6q-evi: Use GPIO_6 for fec irq
Date: Thu, 11 Aug 2016 10:23:31 -0700
Message-ID: <57ACB493.4040809@gmail.com>
References: <1470934446-22536-1-git-send-email-stillcompiling@gmail.com>
 <745430359.250170.752d0f22-93a7-46e8-bb14-c884787aaea3.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <745430359.250170.752d0f22-93a7-46e8-bb14-c884787aaea3.open-xchange-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Stefan,

On 08/11/2016 10:09 AM, Stefan Wahren wrote:
> Hi Joshua,
>
>> Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> hat am 11. August 2016 um 18:54
>> geschrieben:
>>
>>
>> Apply hardware workaround for ethernet problem
>> See nxp erratum err006687
> do you know this commit?
>
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=a28eeb43ee57e0524c59e64760ed28088dd159cb
>
> Maybe you want to add this property, too.
I missed that this change requiring (more) explicit enablement was merge to linux-next.
I'll add that.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
