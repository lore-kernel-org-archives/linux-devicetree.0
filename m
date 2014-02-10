From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC 1/6] mailbox: add core framework
Date: Mon, 10 Feb 2014 14:45:07 -0600
Message-ID: <CAL_JsqK0YoVu0BfKSUfBQGoriCa4z-teXUQe6RPpjM2KKpeMAw@mail.gmail.com>
References: <1391820619-25487-1-git-send-email-courtney.cavin@sonymobile.com>
	<1391820619-25487-2-git-send-email-courtney.cavin@sonymobile.com>
	<4706525.lB7VmvWQMJ@wuerfel>
	<CAL_JsqKa6nyPOa0M67svUR20Y3JNZcFhsTZE=ooV-eg6_ZBaMw@mail.gmail.com>
	<20140210190934.GA841@joshc.qualcomm.com>
	<20140210195914.GU1706@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140210195914.GU1706@sonymobile.com>
Sender: linux-doc-owner@vger.kernel.org
To: Courtney Cavin <courtney.cavin@sonymobile.com>
Cc: Josh Cartwright <joshc@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, "s-anna@ti.com" <s-anna@ti.com>, Rob Herring <rob.herring@calxeda.com>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, Mark Langsdorf <mark.langsdorf@calxeda.com>, Tony Lindgren <tony@atomide.com>, "omar.ramirez@copitl.com" <omar.ramirez@copitl.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 10, 2014 at 1:59 PM, Courtney Cavin
<courtney.cavin@sonymobile.com> wrote:
> On Mon, Feb 10, 2014 at 08:09:34PM +0100, Josh Cartwright wrote:
>> On Mon, Feb 10, 2014 at 11:52:05AM -0600, Rob Herring wrote:
>> > On Mon, Feb 10, 2014 at 8:11 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> > > On Friday 07 February 2014 16:50:14 Courtney Cavin wrote:
>> [..]
>> > >> +int mbox_channel_notify(struct mbox_channel *chan,
>> > >> +             const void *data, unsigned int len)
>> > >> +{
>> > >> +     return atomic_notifier_call_chain(&chan->notifier, len, (void *)data);
>> > >> +}
>> > >> +EXPORT_SYMBOL(mbox_channel_notify);
>> > >
>> > > What is the reason to use a notifier chain here? Isn't a simple
>> > > callback function pointer enough? I would expect that each mailbox
>> > > can have exactly one consumer, not multiple ones.
>> >
>> > It probably can be a callback, but there can be multiple consumers. It
>> > was only a notifier on the pl320 as there was no framework at the time
>> > and to avoid creating custom interfaces between drivers. On highbank
>> > for example, we can asynchronously receive the events for temperature
>> > change, power off, and reset. So either there needs to be an event
>> > demux somewhere or callbacks have to return whether they handled an
>> > event or not.
>>
>> I'm not familiar with highbank IPC, but with these requirements should
>> the mailbox core even bother with asynchronous notifier chain?  It
>> sounds like a better fit might be for the mailbox core to implement a
>> proper adapter-specific irqdomain and used a chained irq handler to
>> demux (or have consumers request with IRQF_SHARED in the shared case).
>
> Although modeling this using irqdomains makes sense for the notification
> bit, and would probably suit most adapters, there's the issue of data
> being passed around which doesn't quite fit.  "Ok, I have mail... where
> is it?"  Did you have something in mind for that?
>
> Frankly, I don't see the notifier chain as being extraneous or
> over-complicated here core-wise or implementation-wise, and unless I
> understand Rob incorrectly, should suit the existing use-cases.  Am I
> missing something?

Well, I think notifiers are not liked very much. I don't know that irq
handlers would be the right answer either as these are not h/w events
really and we may not want handlers to run in irq context. I would say
a callback similar to how the dma engine framework works is the right
answer. On the send side, you may want to have completion callbacks as
well.

Rob
