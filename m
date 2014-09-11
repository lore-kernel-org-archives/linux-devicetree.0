From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/8] rtc: at91sam9: add DT support
Date: Thu, 11 Sep 2014 13:52:51 +0200
Message-ID: <54118D13.3010608@atmel.com>
References: <1410425767-17874-1-git-send-email-boris.brezillon@free-electrons.com>	<20140911093942.GA12295@localhost> <20140911120659.14daa624@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140911120659.14daa624@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Gilbert <dgilbert-qazKcTl6WRFWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/09/2014 12:06, Boris BREZILLON :
> On Thu, 11 Sep 2014 11:39:42 +0200
> Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> 
>> On Thu, Sep 11, 2014 at 10:55:59AM +0200, Boris BREZILLON wrote:
>>
>>> Johan, let me know if this version addresses part of your concerns.
>>
>> Looks good to me. I just have a few minor comments on two of the patches.
>>
>>> I'm open to any suggestion/rework to address other previously discussed
>>> issues, as long as it does not end up in a dead-end (like the discussion
>>> you had last year):
>>>  - the fact that the RTT block could be used for something that is not
>>>    an RTC
>>>  - the fact that referencing the GPBR node and defining a GPBR register
>>>    number to store RTC time info could be considered as an HW config and
>>>    not an HW description and thus should not be described in the DT
>>
>> No doubt.
> 
> Okay then. Any suggestion to do otherwise ?
> Alexandre suggested to pass the GPBR register number through a module
> parameter, and retrieve the GPBR syscon by searching for a gpbr node
> (or atmel,at91sam9260-gpbr compatible node) in the device tree.
> 
> I'm not a big fan of this solution, as it implies passing driver
> specific config to the global cmdline (and we'll have to handle the
> 9263 case where 2 RTT blocks are availables).

Nope, I don't like messing with the cmdline for something like that.

atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
is perfectly fine for me.

Bye,
-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
