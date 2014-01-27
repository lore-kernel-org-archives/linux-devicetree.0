From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 04/15] watchdog: orion: Handle IRQ
Date: Sun, 26 Jan 2014 22:42:19 -0800
Message-ID: <52E5FFCB.5000802@roeck-us.net>
References: <1390310774-20781-1-git-send-email-ezequiel.garcia@free-electrons.com> <1390310774-20781-5-git-send-email-ezequiel.garcia@free-electrons.com> <52DE84A6.6090909@roeck-us.net> <20140127063040.GA17506@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140127063040.GA17506@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/26/2014 10:30 PM, Ezequiel Garcia wrote:
> Hi Guenter,
>
> On Tue, Jan 21, 2014 at 06:31:02AM -0800, Guenter Roeck wrote:
> [..]
>>> @@ -131,6 +138,19 @@ static int orion_wdt_probe(struct platform_device *pdev)
>>>    	if (!wdt_reg)
>>>    		return -ENOMEM;
>>>
>>> +	irq = platform_get_irq(pdev, 0);
>>> +	if (irq > 0) {
>>
>> 0 is a valid interrupt number, and platform_get_irq returns an error code on errors.
>> Should be >= 0.
>>
>
> I'm revisiting this one. I believe this is not the hardware interrupt
> number, but the one mapped into virq space. So, 0 is not a valid
> interrupt number.
>
> Right?
>

Hi,

If so, the entire interrupt numbering scheme appears broken. Conceptually it should
not make a difference where the interrupt is coming from. If the virq system
returns 0 for invalid (non-configured) interrupts, and non-configured 'real'
interrupts are reported as -ENXIO, all bets are off. How would a driver know
what to expect ? And how would one be expected to review such non-deterministic
code ?

FWIW, platform_get_irq() does return -ENXIO for invalid interrupts. If there
is an independent notion of "0 is an invalid interrupt", it is well hidden.

Anyway, if you think the driver should treat 0 as invalid interrupt, go ahead.
Who am I to know. Just please don't use my Reviewed-by in this case.

Thanks,
Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
