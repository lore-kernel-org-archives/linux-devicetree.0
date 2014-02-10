From: Josh Cartwright <joshc@codeaurora.org>
Subject: Re: [RFC 1/6] mailbox: add core framework
Date: Mon, 10 Feb 2014 13:09:34 -0600
Message-ID: <20140210190934.GA841@joshc.qualcomm.com>
References: <1391820619-25487-1-git-send-email-courtney.cavin@sonymobile.com>
 <1391820619-25487-2-git-send-email-courtney.cavin@sonymobile.com>
 <4706525.lB7VmvWQMJ@wuerfel>
 <CAL_JsqKa6nyPOa0M67svUR20Y3JNZcFhsTZE=ooV-eg6_ZBaMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKa6nyPOa0M67svUR20Y3JNZcFhsTZE=ooV-eg6_ZBaMw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Courtney Cavin <courtney.cavin@sonymobile.com>, s-anna@ti.com, Rob Herring <rob.herring@calxeda.com>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, Mark Langsdorf <mark.langsdorf@calxeda.com>, Tony Lindgren <tony@atomide.com>, omar.ramirez@copitl.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 10, 2014 at 11:52:05AM -0600, Rob Herring wrote:
> On Mon, Feb 10, 2014 at 8:11 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Friday 07 February 2014 16:50:14 Courtney Cavin wrote:
[..]
> >> +int mbox_channel_notify(struct mbox_channel *chan,
> >> +             const void *data, unsigned int len)
> >> +{
> >> +     return atomic_notifier_call_chain(&chan->notifier, len, (void *)data);
> >> +}
> >> +EXPORT_SYMBOL(mbox_channel_notify);
> >
> > What is the reason to use a notifier chain here? Isn't a simple
> > callback function pointer enough? I would expect that each mailbox
> > can have exactly one consumer, not multiple ones.
> 
> It probably can be a callback, but there can be multiple consumers. It
> was only a notifier on the pl320 as there was no framework at the time
> and to avoid creating custom interfaces between drivers. On highbank
> for example, we can asynchronously receive the events for temperature
> change, power off, and reset. So either there needs to be an event
> demux somewhere or callbacks have to return whether they handled an
> event or not.

I'm not familiar with highbank IPC, but with these requirements should
the mailbox core even bother with asynchronous notifier chain?  It
sounds like a better fit might be for the mailbox core to implement a
proper adapter-specific irqdomain and used a chained irq handler to
demux (or have consumers request with IRQF_SHARED in the shared case).

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
