From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution,
	or is there something better?
Date: Mon, 21 Oct 2013 00:51:04 +0100
Message-ID: <20131020235104.GT25034@n2100.arm.linux.org.uk>
References: <52644A9E.3060007@wwwdotorg.org> <20131020231134.GR25034@n2100.arm.linux.org.uk> <52646AF9.3050309@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52646AF9.3050309-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 20, 2013 at 04:44:57PM -0700, Guenter Roeck wrote:
> On 10/20/2013 04:11 PM, Russell King - ARM Linux wrote:
>> On Sun, Oct 20, 2013 at 10:26:54PM +0100, Stephen Warren wrote:
>>> The only thing we've really moved out of the kernel is the exact IDs of
>>> which GPIOS, interrupts, I2C/SPI ports the devices are connected to; the
>>> simple stuff not the hard stuff. The code hasn't really been simplified
>>> by DT - if anything, it's more complicated since we now have to parse
>>> those values from DT rather than putting them into simple data-structures.
>>
>> Here's my random thoughts this evening on DT, orientated mostly on a
>> problem area I've been paying attention to recently.
>>
>> In some ways, DT has made things much harder.  I don't know whether
>
> On the other side, DT has made some things much simpler.

Yes, it's made simple things easier, but note the problem I also
pointed out towards the end of the email (I assume you stopped reading
it towards the end?)

DT also makes it much easier to make mistakes which take hours to find.

DT has also made hard things much harder to solve - and because they're
hard to solve people are hacking around the problem creating their own
custom solutions, thereby making the problem much worse to solve in the
future.  That's a disease - "we must have DT and sod everything else"
is a very bad thing to do.  The bad news is, it *is* happening.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
