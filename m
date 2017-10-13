From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: Altera ASMI Parallel II IP Core
Date: Fri, 13 Oct 2017 22:34:27 +0200
Message-ID: <089bb472-f824-26d7-0d72-66e64c2f24c4@gmail.com>
References: <1505932139-2905-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1505932139-2905-3-git-send-email-matthew.gerlach@linux.intel.com>
 <deae5a9f-4301-c7de-b265-b09292f8da15@gmail.com>
 <alpine.DEB.2.20.1710110956260.2194@mgerlach-VirtualBox>
 <ca36c177-0e7c-647d-f821-ab4bb7d85b10@gmail.com>
 <alpine.DEB.2.20.1710131215370.1541@mgerlach-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1710131215370.1541@mgerlach-VirtualBox>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/13/2017 09:24 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:

[ culling the ridiculous cc list ]

> On Wed, 11 Oct 2017, Marek Vasut wrote:
> 
>> On 10/11/2017 07:00 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
>>>
>>>
>>> On Tue, 10 Oct 2017, Marek Vasut wrote:
>>>
>>>> On 09/20/2017 08:28 PM, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
>>>>> From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>>>>
>>>>> This patch adds support for a spi-nor, platform driver for the
>>>>> Altera ASMI Parallel II IP Core.  The intended use case is to be able
>>>>> to update the flash used to load a FPGA at power up with mtd-utils.
>>>>>
>>>>> Signed-off-by: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>>>> ---
>>>>> v2:
>>>>>     minor checkpatch fixing by Wu Hao <hao.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>>>>>     Use read_dummy value as suggested by Cyrille Pitchen.
>>>>>     Don't assume 4 byte addressing (Cryille Pichecn and Marek Vasut).
>>>>>     Fixed #define indenting as suggested by Marek Vasut.
>>>>>     Added units to timer values as suggested by Marek Vasut.
>>>>>     Use io(read|write)8_rep() as suggested by Marek Vasut.
>>>>>     Renamed function prefixed with __ as suggested by Marek Vasut.
>>>>
>>>> [...]
>>>>
>>>>> +#define QSPI_ACTION_REG            0
>>>>> +#define QSPI_ACTION_RST            BIT(0)
>>>>> +#define QSPI_ACTION_EN            BIT(1)
>>>>> +#define QSPI_ACTION_SC            BIT(2)
>>>>> +#define QSPI_ACTION_CHIP_SEL_SFT    4
>>>>> +#define QSPI_ACTION_DUMMY_SFT        8
>>>>> +#define QSPI_ACTION_READ_BACK_SFT    16
>>>>> +
>>>>> +#define QSPI_FIFO_CNT_REG        4
>>>>> +#define QSPI_FIFO_DEPTH            0x200
>>>>> +#define QSPI_FIFO_CNT_MSK        0x3ff
>>>>> +#define QSPI_FIFO_CNT_RX_SFT        0
>>>>> +#define QSPI_FIFO_CNT_TX_SFT        12
>>>>> +
>>>>> +#define QSPI_DATA_REG            0x8
>>>>> +
>>>>> +#define QSPI_POLL_TIMEOUT_US        10000000
>>>>
>>>> 10 s poll timeout ? :)
>>>
>>> Hi Marek,
>>>
>>> The 10s timeout is fairly arbitrary.  In other words, I pulled it out of
>>> thin air.  Can you suggest a better timeout?  From a practical
>>> standpoint 10s seemed to be much better than no timeout when I was
>>> debugging bad FPGA images.  Without a timeout I was hanging the system
>>> when the FPGA image failed.  With this timeout, we get a nice message
>>> and Linux keeps running happily.
>> AFAIK the SPI subsystem has a timeout which is adaptive to the bus
>> clock, maybe that's what you want to use here ?
> 
> Hi Marek,
> 
> I looked in spi-nor.c, and I see the following two macros:
> #define DEFAULT_READY_WAIT_JIFFIES        (40UL * HZ)
> #define CHIP_ERASE_2MB_READY_WAIT_JIFFIES    (40UL * HZ)
> 
> These timers values are used at the spi-nor layer for waiting for an
> operation to complete.  It is the time spent waiting for Work In Progress
> to clear.
> 
> The timer value I'm using, QSPI_POLL_TIMEOUT_US, is used at a lower layer.
> This timer value is used for the time it takes to send the opcode and tx
> data and receive any bytes from the flash.  While 10 seconds may seem
> long, I am just trying to avoid a system hang when there is a catastrophic
> failure with the flash controller in the FPGA or the flash part itself.

It takes 10s to detect catastrophic failure ? I'd expect you can scale
that timeout value by the bus clock speed.

We have ie. this in drivers/spi/spi.c:

9                                 ret = 0;
1040                                 ms = 8LL * 1000LL * xfer->len;
1041                                 do_div(ms, xfer->speed_hz);
1042                                 ms += ms + 200; /* some tolerance */
1043
1044                                 if (ms > UINT_MAX)
1045                                         ms = UINT_MAX;
1046
1047                                 ms =
wait_for_completion_timeout(&master->xfer_completion,
1048
msecs_to_jiffies(ms));

> I certainly could be missing something with regards to the timeouts, but
> I think 10s for QSPI_POLL_TIMEOUT_US doesn't hurt, and it definately
> helps when something goes wrong.
> 
> Thanks for the feedback,
> Matthew Gerlach
> 
>>
>> -- 
>> Best regards,
>> Marek Vasut
>>


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
