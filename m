From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv3 2/2] usb: dwc2: Add reset control to dwc2
Date: Thu, 14 Apr 2016 15:46:57 -0500
Message-ID: <571001C1.70308@opensource.altera.com>
References: <1460587442-21136-1-git-send-email-dinguyen@opensource.altera.com>
 <1460587442-21136-2-git-send-email-dinguyen@opensource.altera.com>
 <201604140404.32087.arnd@arndb.de> <570FE01C.3090109@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <570FE01C.3090109-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "stefan.wahren-eS4NqCHxEME@public.gmane.org" <stefan.wahren-eS4NqCHxEME@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/14/2016 01:23 PM, John Youn wrote:
> On 4/13/2016 7:04 PM, Arnd Bergmann wrote:
>> On Thursday 14 April 2016, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
>>> @@ -337,6 +338,17 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>>>  {
>>>         int i, ret;
>>>  
>>> +       hsotg->reset = devm_reset_control_get(hsotg->dev, "dwc2");
>>> +       if (IS_ERR(hsotg->reset)) {
>>> +               if (PTR_ERR(hsotg->reset) == -EPROBE_DEFER)
>>> +                       return -EPROBE_DEFER;
>>> +               dev_dbg(hsotg->dev, "Could not get reset control.\n");
>>> +               hsotg->reset = NULL;
>>> +       }
>>> +
>>> +       if(hsotg->reset)
>>> +               reset_control_deassert(hsotg->reset);
>>
>>
>> The error handling seems a bit odd here. If there is a failure to get the
>> reset control and it's actually needed, I would argue the init function should
>> not continue. Conversely, if there was no reset line specified in the
>> device, why even print a message about it?
> 
> Yes it's optional. I think this needs to be checked like the PHY's are
> checked in the same function. That is, by checking for specific error
> codes that indicate a reset control is not specified and continue only
> in that case. All other errors should be returned.
> 
> Dinh, care to make these changes?

Sure, I can make the change.

Dinh
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
