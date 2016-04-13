From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Wed, 13 Apr 2016 12:27:55 +0200
Message-ID: <570E1F2B.2080003@denx.de>
References: <1452486886-8049-1-git-send-email-marex@denx.de> <1452486886-8049-2-git-send-email-marex@denx.de> <57053F81.70204@ti.com> <570563D3.9080704@denx.de> <5705E858.3050700@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5705E858.3050700-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/07/2016 06:55 AM, Vignesh R wrote:
> 
> 
> On 04/07/2016 01:00 AM, Marek Vasut wrote:
>> On 04/06/2016 06:55 PM, R, Vignesh wrote:
>>> Hi Marek,
>>
>> Hi!
>>
>>> I encountered a issue with this driver while testing.
>>
>> Try with the attached patches, I am planning to use them for V11
>> submission. I think you're hitting the problem with missing buslock.
>>
> 
> Thanks for the patches.
> But I am pretty sure that's not the problem at my end, because I have
> only one flash device on QSPI bus.

OK, sorry for the delayed reply. I will go through the rest of the QSPI
mail later, probably this week.

> The problem is cqspi_switch_cs() is called only once ie when JEDEC ID is
> being read(during autodetect of chip), but at that instance,
> nor->page_size and nor->mtd.erasesize are not yet initialized (They are
> initialized only after JEDEC ID is looked up in the table and page_size
> and erasesize are known).
> Therefore if nor->page_size is printed during cqspi_switch_cs() then its
> zero. But nor->page_size reports 256 when printed in cqspi_flash_setup()
> after spi_nor_scan(). Therefore CQSPI_REG_SIZE register has to be
> configured only after spi_nor struct is fully populated (i.e after
> spi_nor_scan() has recognized the slave after JEDEC ID read).
> 
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
