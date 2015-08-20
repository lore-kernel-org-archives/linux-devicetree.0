From: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Thu, 20 Aug 2015 15:37:33 +0800
Message-ID: <CAN1oZWx_wefKJhB2pVbhw_UUZNR8LfveS-FPBFtgndGg_nXoUw@mail.gmail.com>
References: <CAN1oZWyE9E2kRkGZPajpiNbpeKEjOhs9NDNDbUpmdw18WNYL2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN1oZWyE9E2kRkGZPajpiNbpeKEjOhs9NDNDbUpmdw18WNYL2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, marex-ynQEQJNshbs@public.gmane.org
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, nga_chi86 <ngachi86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
>> On Tuesday, August 18, 2015 at 03:24:44 AM, Brian Norris wrote:
>>> I'm not very helpful here, so hopefully Viet can be of more use:
>>
>> Yup :)
>>
>>> On Mon, Aug 17, 2015 at 07:53:23PM +0200, Marek Vasut wrote:
>>> > On Monday, August 17, 2015 at 06:03:38 PM, Brian Norris wrote:
>>> > Also, I cannot find any documentation for this IP block even if I
>>> > search through Quartus/QSys, is there any proper documentation
>>> > available anywhere?
>>>
>>> I never found proper documentation, but I didn't look too hard. I've
>>> mostly been going off of Viet's comments and code.
>>
>> Me neither, and I looked through the altera stuff in fact. I'm trying to learn whether this is just an Soft IP, in which case it certainly can be fixed ; or if there is actually some chip shipping with this crap synthesised into actual silicon.
>>
>>> But FWIW, I did find some relevant info for the peculiar Altera EPCQ
>>> flash here:
>>>
>>> https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/litera
>>> ture/
>>> hb/cfg/cfg_cf52012.pdf
>>
>> Altera EPCS/EPCQ flashes are just rebranded micron flashes, they just have different JEDEC >ID and are a bit more expensive.
>
> You can find the document at here
> (https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/ug/ug_embedded_ip.pdf)
>  Chapter 42.Page 407.
>
> For the soft IP issue, i've requested hardware engineer to come out
> the solution. So in the mean way, our driver will NOT support Micron
> flashes until hardware fix is completed.
>
> Hence, i just submitted version 5 for this driver with eliminating
> micron device support. Hope this version will get ACKed by you.
>
> Thanks,
> Viet Nga
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
