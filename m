From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: Re: [PATCH 5/10] watchdog: bcm63xx_wdt: Use WATCHDOG_CORE
Date: Wed, 25 Nov 2015 19:43:50 +0000
Message-ID: <56560F76.60000@simon.arlott.org.uk>
References: <5650BFD6.5030700@simon.arlott.org.uk>
 <5650C08C.6090300@simon.arlott.org.uk> <5650E2FA.6090408@roeck-us.net>
 <5650E5BB.6020404@simon.arlott.org.uk> <56512937.6030903@roeck-us.net>
 <5651CB13.4090704@simon.arlott.org.uk> <5651CBF0.30904@simon.arlott.org.uk>
 <56552099.7070709@roeck-us.net>
 <726719450643bb69683224d731b582b0df27fe1f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <5655C149.5010008@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5655C149.5010008-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 25/11/15 14:10, Guenter Roeck wrote:
> On 11/25/2015 05:02 AM, Simon Arlott wrote:
>> On Wed, November 25, 2015 02:44, Guenter Roeck wrote:
>>> The "running" flag should no longer be needed. watchdog_active()
>>> should provide that information.
>>
>> I'm going to need to keep that because I need to know if it's running
>> in the interrupt handler, and wdd->lock is a mutex.
>>
>>>> @@ -306,17 +202,18 @@ unregister_timer:
>>>>
>>>>    static int bcm63xx_wdt_remove(struct platform_device *pdev)
>>>>    {
>>>> -	if (!nowayout)
>>>> -		bcm63xx_wdt_hw_stop();
>>>> +	struct watchdog_device *wdd = platform_get_drvdata(pdev);
>>>>
>>>> -	misc_deregister(&bcm63xx_wdt_miscdev);
>>>>    	bcm63xx_timer_unregister(TIMER_WDT_ID);
>>>> +	watchdog_unregister_device(wdd);
>>>
>>> Shouldn't that come first, before unregistering the timer ?
>>
>> No, because wdd->dev is used in the interrupt handler. I will have to
>> move registration of the interrupt to after creating the watchdog
>> because it could currently be used before wdd->dev is set.
>>
> 
> Does unregistering the timer disable the interrupt ?

No, it sets the callback for that timer to NULL so that it won't be
called.

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
