From: Tom Rini <trini-l0cyMroinI0@public.gmane.org>
Subject: Re: gpio-generic DT bindings?
Date: Wed, 20 Nov 2013 13:03:06 -0500
Message-ID: <528CF95A.2040805@ti.com>
References: <CAMuHMdU9F_EjA+ZF0mn4PW3HDJ9rkM_84SHiDKkWwWr7MLJKJA@mail.gmail.com> <528BDF57.8080400@wwwdotorg.org> <CAMuHMdVuC5nJizr9Q2JXQCC=FtJkEvLa5iftBoa6Zd7B3XVojA@mail.gmail.com> <528BE85C.60101@wwwdotorg.org> <20131120154409.GM420@bill-the-cat> <528CE010.3090301@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <528CE010.3090301-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/20/2013 11:15 AM, Stephen Warren wrote:
> On 11/20/2013 08:44 AM, Tom Rini wrote:
>> On Tue, Nov 19, 2013 at 03:38:20PM -0700, Stephen Warren wrote:
>>> On 11/19/2013 03:17 PM, Geert Uytterhoeven wrote:
>>>> On Tue, Nov 19, 2013 at 10:59 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>>>> On 11/19/2013 02:45 PM, Geert Uytterhoeven wrote:
>>>>>> This topic seems to come up from time to time.
>>>>>> Unfortunately the last time it coincided with the move of the mailing list
>>>>>> from ozlabs to vger, causing the mailing list archives not to have captured
>>>>>> the full discussion.
>>>>>>
>>>>>> Is there anything definitive/usable out there?
>>>>>
>>>>> What do you mean by "gpio-generic DT bindings"? A generic binding for a
>>>>> controller, or something else? I think it's best to have a specific
>>>>> binding for each individual controller, so it's always possible to know
>>>>> exactly which controller is present. Now, all the binding definitions
>>>>> should all look the same or as similar as possible for consistency...
>>>>
>>>> I mean DT bindings and DT support for drivers/gpio/gpio-generic.c.
>>>
>>> We should have DT bindings for particular HW, not for a driver. After
>>> all, DT describes HW, not a particular OS's driver.
>>>
>>> The path to adding DT support to gpio-generic.c is to define a binding
>>> for the particular HW you're interested in (which would quite likely
>>> only contain compatible, reg, and perhaps some other standard properties
>>> like interrupts, clocks, power domains, etc.). There would be one
>>> binding and compatible value for each different HW block you want to
>>> support, although they could all share the same schema and definition.
>>> Then update gpio-generic.c to bind to that (those) compatible value(s),
>>> and have some kind of table that maps from compatible value to whatever
>>> configuration structure gpio-generic.c uses internally.
>>
>> This I think is the rub that Geert is getting at.  The driver is
>> generic.
> 
> That's an OS-specific implementation detail that doesn't affect DT.

I got an off-list poke that this is being worked on, so I don't want to
inflame things.  But it's not really.  The hardware is presenting a
generic bit of functionality.  The only thing missing here is a
standards body declaring this a Whatever 1.0 compliant Doodad(tm).

>> You feed it a little info and it Just Works.
> 
> But, this information historically is a platform data structure in a
> board file, right? That means that historically for every new board
> using the driver, you needed to edit kernel code (the board file) to
> provide that platform data. If with DT you still need to edit kernel
> code (the driver) to add support for the HW. So, the situation with DT
> is no worse that the situation with board files.
> 
>> Having to patch
>> the generic driver N times for vendor,foo-gpio would be a step
>> backwards.
> 
> In fact, with DT you now edit the driver once per SoC/chip that embeds a
> particular GPIO controller IP block, rather than once per board that
> uses the IP block. That's likely a lower number of code edits, so you
> have gained something already.
> 
>> How do we have a binding here that lets us be as flexible as
>> we are today?
> 
> I think we already have that - something better in fact.

Putting on my old arch/ppc guy hat, "look we moved the editing/conflict
mess to another place, and it's a less messy now" never bought me much
with Paul/Ben other than "but it shows we can do better, everything is
so close".

So, I hope there's some way we can get to the high level point where
there's some way to say "I have a simple $foo as described &here" and
all of the various blocks that every vendor does themselves, but doesn't
require a per vendor driver Just Work without editing files.

-- 
Tom
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
