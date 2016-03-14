From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Mon, 14 Mar 2016 23:47:23 +0100
Message-ID: <56E73F7B.2010408@denx.de>
References: <1452486886-8049-1-git-send-email-marex@denx.de> <201602060842.38290.marex@denx.de> <56B879BD.2070608@ti.com> <201602081627.57666.marex@denx.de> <56BB60F1.9070306@opensource.altera.com> <56BB629D.2040209@denx.de> <56E1DF45.901@opensource.altera.com> <56E1E2C8.8030405@denx.de> <56E70024.3080205@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E70024.3080205-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/14/2016 07:17 PM, Graham Moore wrote:
> On 03/10/2016 03:10 PM, Marek Vasut wrote:
>> On 03/10/2016 09:55 PM, Graham Moore wrote:
>>> On 02/10/2016 10:17 AM, Marek Vasut wrote:
>>>
>>> [...]
>>>
>>>> All right, so we will just add a special property or compat string for
>>>> the TI SoC. But we need to get this driver mainlined first :)
>>>>
>>>
>>> Hi Marek,
>>
>> Hi Graham,
>>
>>> How's that mainlining going?  You probably noticed this patch needed
>>> some refactoring for 4.4.  In the course of testing, we realized this
>>> driver needs to enable its clock.
>>>
>>> Do you have a 4.4 or later version in your tree?  I'd like to add the
>>> clock enabling.
>>
>> Still waiting for the patches from Cyrille to go in, so this patch is
>> stuck. I just checked next and some of them made it, but there are more
>> which didn't. I have a V10 of this patch , it is in the ML already [1],
>> so try playing around with that.
>>
>> I have linux 4.4 branch with all the necessary patches backported and/or
>> applied if you'd be interested in that, but I do my development on
>> linux-next .
>>
>> What sort of clock patch are you missing ?
>>
> 
> The clock needs to be enabled, after the devm_clk_get().  I've added a
> clk_prepare_enable() there, and also clk_disable_unprepare() in the
> remove function.

Yeah, please send me a patch and I will add it into the driver, add your
SoB line and repost.

> That ML patch won't apply to any tree I have, 4.4, 4.5, linux-next, etc.
>  Maybe I'll just wait until it's in linux-next.

I'll send you the backport to 4.4 off-list, so I don't bother people here.

> -Graham
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
