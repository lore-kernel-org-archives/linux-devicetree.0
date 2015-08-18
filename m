From: vikas <vikas.manocha-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Tue, 18 Aug 2015 13:35:46 -0700
Message-ID: <55D39722.8030506@st.com>
References: <1439522892-7524-1-git-send-email-marex@denx.de> <1439522892-7524-2-git-send-email-marex@denx.de> <55D299CD.2070809@st.com> <55D384D6.9040303@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55D384D6.9040303-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,


On 08/18/2015 12:17 PM, Graham Moore wrote:
> Hi Vikas,
> 
> On 08/17/2015 09:34 PM, vikas wrote:
>  > Hi Marek,
>  >
> 
> [...]
> 
>  >> +
>>> +/* Operation timeout value */
>>> +#define CQSPI_TIMEOUT_MS                       500
>>> +#define CQSPI_READ_TIMEOUT_MS                  10
>>
>> please add some comment about the timeouts value selection.
>>
> 
> I wish I could comment, but I don't know the origin of these values. 
> The 500 ms value is probably just "a very long time".

In my opinion we should have some logical value based on some worst timing like read/write sector.
I let you decide on this point.

> 
> [...]
> 
>>> +
>>> +       cqspi->irq_mask = CQSPI_IRQ_MASK_RD;
>>> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
>>
>> here interrupt mask is being configured for every read, better would be to move it in init.
>>
> 
> [...]
> 
>>> +
>>> +       cqspi->irq_mask = CQSPI_IRQ_MASK_WR;
>>> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
>>
>> same like read, it should be moved to init.
>>
> 
> It uses different masks for read and write

Yeah i saw it but why not to OR these values & configure for once in init. 
After that in ISR, check for the interrupt source & take action accordingly. I think other drivers also use it this way.

Rgds,
Vikas

> 
> [...]
> 
> BR,
> Graham
> 
> .
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
