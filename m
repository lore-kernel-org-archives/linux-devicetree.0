From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] rtc: ds1374: Add trickle charger device tree binding
Date: Sat, 22 Apr 2017 10:54:23 -0700
Message-ID: <CAAtXAHfNuRXninLWySAOdtV99ih4PBt=JPszn3UkNa08OvXLFQ@mail.gmail.com>
References: <1492468810-17224-1-git-send-email-mdf@kernel.org>
 <20170420155634.gs7qkufw7j4mfqpx@rob-hp-laptop> <20170420172538.GA13892@tyrael.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170420172538.GA13892-R0KNJUYl863z/wjs7L+eiWPmTBeX6bocVpNB7YpNyf8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, rtc-linux <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 20, 2017 at 10:25 AM, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Apr 20, 2017 at 10:56:34AM -0500, Rob Herring wrote:
>> On Mon, Apr 17, 2017 at 03:40:10PM -0700, Moritz Fischer wrote:
>> > Introduce a device tree binding for specifying the trickle charger
>> > configuration for ds1374. This is based on the code for ds13390.
>> >
>> > Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/rtc/dallas,ds1374.txt      | 18 ++++++++
>> >  drivers/rtc/rtc-ds1374.c                           | 54 ++++++++++++++++++++++
>> >  2 files changed, 72 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/rtc/dallas,ds1374.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt b/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt
>> > new file mode 100644
>> > index 0000000..4cf5bd7
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/rtc/dallas,ds1374.txt
>> > @@ -0,0 +1,18 @@
>> > +* Dallas DS1374            I2C Real-Time Clock / WDT
>>
>> Please remove from trivial-devices.txt, too. (which is moving in 4.12
>> BTW)
>
> Ok, I'll redo this on top of b7e252fcddfa573bb1ee275b53bba6cef85671d4
> (Documentation: devicetree: move trivial-devices out of I2C realm) then.

Follow up question, right now one selects between WDT and ALARM mode with
a CONFIG_RTC_DRV_DS1374_WDT=y statically at compile time.

I'd like to add a 'dallas,mode = <DS1374_WDT>;' or
dallas,enable-watchdog property
to the binding, same goes for the ability to remap the WDT reset output to the
interrupt pin (which is currently not supported, but my hardware needs this).

Would be the right way to add the remapping something like
'dallas,remap-reset-to-int' ?

Ideas? This change would obviously break people's setups where they
select one or
the other behavior via the build time option. Is that acceptable seen
that relying on
build time CONFIG_FOO seems like a bad assumption to begin with?

A bit of background: I currently started cleaning up a bunch of issues
in this driver,
like refactoring it to use the watchdog framework instead of open
coding everything,
make setting the timeout actually work (right now it the timeout to
tick conversion is
hosed).

Thanks,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
