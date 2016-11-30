From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
Date: Wed, 30 Nov 2016 08:57:03 +0800
Message-ID: <42f45944-8a63-fe59-8339-af72d004544e@rock-chips.com>
References: <1478855766-151673-1-git-send-email-shawn.lin@rock-chips.com>
 <1478855766-151673-3-git-send-email-shawn.lin@rock-chips.com>
 <b1420e9d-b6a1-7fe8-4381-e32e0bc7dd53@gmail.com>
 <775a8918-bc93-218a-808d-2a160137ad56@rock-chips.com>
 <8f8213a1-f694-8159-fdbd-5e607c8aaaa2@gmail.com>
 <76670120-dacd-ef0e-cf36-cbf549b19853@rock-chips.com>
 <b513a489-5913-ffe8-69f1-7201943a05a3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b513a489-5913-ffe8-69f1-7201943a05a3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2016/11/25 21:54, Marek Vasut 写道:
> On 11/21/2016 03:51 AM, Shawn Lin wrote:
>> Hi Marek,
>
> Hi!
>
> [...]
>
>>>> sfc->num_chip stands for how many flashes registered successfully.
>>>
>>> Does it work if you have a hole in there ? Like if you have a flash on
>>> chipselect 0 and chipselect 2 ?
>>
>> Yes it does, as it won't leave a room for chipselect 1 whose node isn't
>> present, which means there isn't a hole in there at all. :)
>
> Ah , because you are not indexing those NORs with their CS number , right ?

yes. :)

>
>


-- 
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
