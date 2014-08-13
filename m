From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 03/11] ARM: brcmstb: add debug UART for earlyprintk support
Date: Wed, 13 Aug 2014 15:11:50 -0700
Message-ID: <CAN8TOE8w5bUT5byHiJrYr8AzaZ+EADzE+aoH6f2x2tFc1+1eQw@mail.gmail.com>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com>
	<1405976886-27807-4-git-send-email-computersforpeace@gmail.com>
	<20140802083040.GY30282@n2100.arm.linux.org.uk>
	<20140804165627.GT3711@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140804165627.GT3711@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ping (Olof or Matt?)

On Mon, Aug 4, 2014 at 9:56 AM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sat, Aug 02, 2014 at 09:30:40AM +0100, Russell King wrote:
>> On Mon, Jul 21, 2014 at 02:07:58PM -0700, Brian Norris wrote:
>> > From: Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >
>> > Add the UART definitions needed to support earlyprintk on brcmstb machines.
>> >
>> > Signed-off-by: Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> I noticed that you sent this to the patch system.  I asked Olof last
>> night whether he had anything in arm-soc touching Kconfig.debug, and
>> he does (a number of other platforms have updated it.)  This means
>> that if I apply it to my tree, it may conflict, so I'm reluctant to
>> take it.
>
> OK... Matt told me that such patches go through you. So which is it?
> Should all Kconfig.debug patches go through the arm-soc route?

How should this get in? Should I rebase/resend through Matt and
arm-soc? Or can you pick this up as-is?

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
