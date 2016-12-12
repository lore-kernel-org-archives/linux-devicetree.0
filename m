From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/5] mtd: aspeed: used a label property
Date: Mon, 12 Dec 2016 03:27:00 +0100
Message-ID: <d8a6f699-3ee2-07b1-f0f5-478b0d8dd259@gmail.com>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-4-git-send-email-clg@kaod.org>
 <CACPK8Xcj4P34-4krGbnimVG89wMcHoRX4XJ66-_7KtAt6-vTkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8Xcj4P34-4krGbnimVG89wMcHoRX4XJ66-_7KtAt6-vTkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/12/2016 12:46 AM, Joel Stanley wrote:
> On Sat, Dec 10, 2016 at 3:49 AM, Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:
>> This can be used to easily identify a chip on a system with multiple
>> chips.
>>
>> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
> 
> Our userspace benefits from having this.
> 
> Acked-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

Shouldn't such thing be part of core code then ?

>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 99302b0d7786..9119c0ca86b6 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -676,6 +676,8 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>                 nor->prepare = aspeed_smc_prep;
>>                 nor->unprepare = aspeed_smc_unprep;
>>
>> +               mtd->name = of_get_property(child, "label", NULL);
>> +
>>                 ret = aspeed_smc_chip_setup_init(chip, r);
>>                 if (ret)
>>                         break;
>> --
>> 2.7.4
>>


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
