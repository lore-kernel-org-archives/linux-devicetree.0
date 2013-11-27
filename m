From: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 9/9] of/irq: create interrupts-extended property
Date: Wed, 27 Nov 2013 19:06:35 +1000
Message-ID: <CAEgOgz4yhDzy_BFiotK5Qi48sczR3PL1oPjPhNYC9O94P6AnzQ@mail.gmail.com>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
	<CAEgOgz5BWzo-LGddjG6ZUtKt6GHxLmDUEndFOdVrn+1HTPvpGQ@mail.gmail.com>
	<20131124213212.226B8C402C3@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131124213212.226B8C402C3-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 25, 2013 at 7:32 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Sun, 24 Nov 2013 17:04:52 +1000, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> On Wed, Nov 13, 2013 at 4:14 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > On Wed, 13 Nov 2013 09:17:01 +1000, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> >> It's going to get a little verbose once you start making multiple
>> >> connections as you need one mux per wire. Perhaps it could be cleaned
>> >> up by making the foo_irq_mux node(s) a child of foo?
>> >
>> > It could, but then you need some way of attaching a driver to that node,
>> > and that would require building knowledge into the driver again.
>> >
>> > Can you boil it down to a couple of concrete examples? What is a
>> > specific example of how the platform should decide which interrupt line
>> > to use?
>> >
>>
>> So i've spent some time playing with this. I now have a booting kernel
>> with multiple root interrupt controllers and peripheral devices
>> multiply-connected to both root controllers. But only one on of the
>> controllers is used by Linux (as linux being able to use multiple
>> intcs is a non-trivial problem). So the scheme I am using is to have
>> one of these root intc's marked as disabled via
>
> Multiple intc's should be a solved problem. What issue are you seeing?
> Or is this a microblaze specific problem?
>

It's multiple root (i.e. have no explicit parent) interrupt
controllers. And linux
doesnt respect status = "disabled" for interrupt controllers at all it seems.

I'll send the patches tmrw.

Regards,
Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
