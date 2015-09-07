From: vikas <vikas.manocha-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
Date: Mon, 7 Sep 2015 13:27:11 -0700
Message-ID: <55EDF31F.6010607@st.com>
References: <1440148851-14621-1-git-send-email-marex@denx.de> <1440148851-14621-2-git-send-email-marex@denx.de> <55EA2CFD.6060300@st.com> <201509061716.27521.marex@denx.de> <55EDDDCC.7060006@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55EDDDCC.7060006-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 09/07/2015 11:56 AM, vikas wrote:
> Hi,
> 
> On 09/06/2015 08:16 AM, Marek Vasut wrote:
>> On Saturday, September 05, 2015 at 01:45:01 AM, vikas wrote:
>>> Hi,
>>>
>>> On 08/21/2015 02:20 AM, Marek Vasut wrote:
>>>> From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>>>
>>>> Add support for the Cadence QSPI controller. This controller is
>>>> present in the Altera SoCFPGA SoCs and this driver has been tested
>>>> on the Cyclone V SoC.
>>>
>>> can we add info about the modes supported/not supported like direct mode,
>>> indirect etc.
>>
>> It's already part of the documentation.
> 
> To be clear, add info for modes supported in the driver. e.g. Direct mode is not supported in the driver.
> Lets add this info to help users.
> 
>>
>>>> Signed-off-by: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>>> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
>>>> Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>>> Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
>>>> Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>>> Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>>> Cc: Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>
>>>> Cc: Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> ---
>>
>> [...]
>>
>>>> +#define CQSPI_REG_CMDADDRESS                   0x94
>>>> +#define CQSPI_REG_CMDREADDATALOWER             0xA0
>>>> +#define CQSPI_REG_CMDREADDATAUPPER             0xA4
>>>> +#define CQSPI_REG_CMDWRITEDATALOWER            0xA8
>>>> +#define CQSPI_REG_CMDWRITEDATAUPPER            0xAC
>>>> +


[...]

>>>> +
>>>> +       /* Clear all interrupts. */
>>>> +       writel(CQSPI_IRQ_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
>>>> +
>>>> +       writel(CQSPI_IRQ_MASK_RD, reg_base + CQSPI_REG_IRQMASK);
>>>
>>> I think there is no need for separate masks for read & write. Use one mask
>>> & configure it once in the init rather than configuring each time for
>>> every read/write. Then in the ISR, take action as per the interrupt
>>> source: read/write/error condition etc.
>>
>> Setting up the specific IRQ mask prevents spurious interrupts during the
>> particular IO operation, so this solution looks more precise to me.
> 
> spurious interrupt ? like ?
> 
> Configuring interrupt at one time for read/write (preferably in init) is better software design
> then breaking it in for every read/write.

just to clarify "preferably in init" not always but yes in this case.

Cheers,
Vikas

> 
>>
>>>> +
>>>> +       reinit_completion(&cqspi->transfer_complete);
>>>> +       writel(CQSPI_REG_INDIRECTRD_START_MASK,
>>>> +              reg_base + CQSPI_REG_INDIRECTRD);
>>>> +
>>>> +       while (remaining > 0) {
>>>> +               ret =

[...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
