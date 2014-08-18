From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH][resend] mtd: atmel_nand: make PMECC lookup table and
 offset property optional
Date: Mon, 18 Aug 2014 15:09:58 +0800
Message-ID: <53F1A6C6.5010002@atmel.com>
References: <1407490110-16735-1-git-send-email-josh.wu@atmel.com> <20140814224625.GF18411@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140814224625.GF18411@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Brian

On 8/15/2014 6:46 AM, Brian Norris wrote:
> On Fri, Aug 08, 2014 at 05:28:30PM +0800, Josh Wu wrote:
>> If there is no PMECC lookup table stored in ROM, or lookup table offset is
>> not specified, PMECC driver should build it in DDR by itself.
>>
>> That make the PMECC driver work for some board which doesn't has PMECC
>> lookup table in ROM.
>>
>> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> drivers/mtd/nand/atmel_nand.c:1204:11: warning: no previous prototype for 'create_lookup_table' [-Wmissing-prototypes]
>
> You probably should make create_lookup_table() static.

Thank you to catch that.
I'll send a v2 version for make the function static.

>
> Brian
Best Regards,
Josh Wu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
