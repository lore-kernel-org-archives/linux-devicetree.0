From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3] ARM: davinci: aemif: get rid of davinci-nand driver
 dependency on aemif
Date: Fri, 10 Jan 2014 09:49:57 +0530
Message-ID: <52CF74ED.2030503@ti.com>
References: <1386267092-18615-1-git-send-email-ivan.khoronzhuk@ti.com> <52B18C44.2000305@ti.com> <52B1915A.7060309@ti.com> <52BC1BB8.2070007@ti.com> <52CE7C44.1000803@ti.com> <20140109163305.GC28655@norris-Latitude-E6410>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140109163305.GC28655@norris-Latitude-E6410>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 09 January 2014 10:03 PM, Brian Norris wrote:
> On Thu, Jan 09, 2014 at 04:09:00PM +0530, Sekhar Nori wrote:
>> On Thursday 26 December 2013 05:36 PM, ivan.khoronzhuk wrote:
>>> On 12/18/2013 02:13 PM, Sekhar Nori wrote:
>>>> On Wednesday 18 December 2013 05:21 PM, ivan.khoronzhuk wrote:
>>>>> Hi, Sekhar
>>>>>
>>>>> This patch is based on "Reuse davinci-nand driver for Keystone arch"
>>>>> series.
>>>>> The series has passed review at https://lkml.org/lkml/2013/12/17/241
>>>>> and can be found at http://git.infradead.org/l2-mtd.git
>>>>>
>>>>> This patch can be still applied on top of the series without conflicts.
>>>>>
>>>>> Can you please pick up the $subject patch if you are OK with it?
>>>>
>>>> I have no problems with the patch and can pick it too, but need ack from
>>>> MTD maintainer (David) as it touches drivers/mtd/ too.
>>>>
>>>> David,
>>>>
>>>> If you do not have the patch, we can resend it.
>>>>
>>>> Thanks,
>>>> Sekhar
>>>>
>>>
>>> Hi Brian,
>>>
>>> Do you agree if this patch will go through Davinci tree?
>>>
>>> This is the last one we need to reuse Davinci Nand driver for Keystone.
>>
>> Since we never got an ack from MTD folks, I am going and go ahead and
>> try pushing this through ARM-SoC regardless. I will CC the MTD
>> maintainers on the pull request so any objections could even be posted
>> there.
> 
> Sorry, I've been a little busy / out for vacation. The MTD parts look OK
> to me. Feel free to take it in your tree.
> 
> Acked-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks Brian!

Regards,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
