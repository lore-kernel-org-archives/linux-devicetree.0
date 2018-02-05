From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 24/41] ARM: dm644x: add new clock init using common
 clock framework
Date: Mon, 5 Feb 2018 11:31:22 +0530
Message-ID: <bc304a78-662a-d57a-cda4-fe7507e7a6cf@ti.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-25-git-send-email-david@lechnology.com>
 <28508a72-2fc7-1dc2-8a2c-997139d70831@ti.com>
 <d8325090-e369-5a1a-b34a-8174123b01ff@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d8325090-e369-5a1a-b34a-8174123b01ff-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 02 February 2018 11:36 PM, David Lechner wrote:
> On 02/02/2018 08:39 AM, Sekhar Nori wrote:
>> On Saturday 20 January 2018 10:44 PM, David Lechner wrote:
>>> This adds the new board-specific clock init in mach-davinci/dm644x.c
>>> using the new common clock framework drivers.
>>>
>>> The #ifdefs are needed to prevent compile errors until the entire
>>> ARCH_DAVINCI is converted.
>>>
>>> Also clean up the #includes since we are adding some here.
>>>
>>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>>
>> I did not notice this before, but the subject line for this and other
>> patches needs to be "ARM: davinci: "
> 
> so "davinci" == "dm644x" and not any other SoC?

No, I meant "ARM: davinci: dm644x: " instead of just "ARM: dm644x".

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
