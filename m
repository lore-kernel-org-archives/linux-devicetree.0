From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/2] USB OTG PHY driver for NXP LPC18xx family
Date: Thu, 11 Jun 2015 11:08:43 +0530
Message-ID: <55791EE3.4040001@ti.com>
References: <1432922617-11512-1-git-send-email-manabian@gmail.com> <CAGhQ9VzoZN0wow6csD7Mq58CFk31DGup676NoO=hyqnuAwNQwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGhQ9VzoZN0wow6csD7Mq58CFk31DGup676NoO=hyqnuAwNQwA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joachim,

On Thursday 11 June 2015 12:39 AM, Joachim Eastwood wrote:
> Hi Kishon,
>
> On 29 May 2015 at 20:03, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> This patch set adds support for the internal USB OTG PHY found
>> on NXP LPC18xx and LPC43xx devices. Driver takes care of
>> enabling the PHY and setting the clock rate which is need for
>> USB0 support on this platform.
>>
>> This version address the comments from Kishon Vijay Abraham I.
>>
>> Changes in v3:
>>   - depend on MFD_SYSCON
>>
>> Changes in v2:
>>   - use PTR_ERR_OR_ZERO in phy driver
>>   - rename binding doc
>>   - update doc commit message
>>
>> Base support for this platform can now be found in arm-soc next.
>>
>> Joachim Eastwood (2):
>>    phy: add lpc18xx usb otg phy driver
>>    phy: dt bindings: add XP LPC18xx/43xx USB OTG PHY bindings
>
> Do you have any more comments on the patches or are they okey now?

The patches look fine. But it can go only in 4.3.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
