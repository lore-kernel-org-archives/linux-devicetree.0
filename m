From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv7 2/5] mailbox: Introduce framework for mailbox
Date: Wed, 18 Jun 2014 10:03:25 -0700
Message-ID: <7hzjha5ew2.fsf@paris.lan>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
	<1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org>
	<7hionz9i5e.fsf@paris.lan>
	<CAJe_ZhcuOa39Db_tE4JupY74aze02=v1FWzduFD0sO15nMrKvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJe_ZhcuOa39Db_tE4JupY74aze02=v1FWzduFD0sO15nMrKvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Jassi Brar's message of "Wed, 18 Jun 2014 14:03:08 +0530")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "ks.giri@samsung.com" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> On 18 June 2014 05:57, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:
>>
>>> Introduce common framework for client/protocol drivers and
>>> controller drivers of Inter-Processor-Communication (IPC).
>>>
>>> Client driver developers should have a look at
>>>  include/linux/mailbox_client.h to understand the part of
>>> the API exposed to client drivers.
>>> Similarly controller driver developers should have a look
>>> at include/linux/mailbox_controller.h
>>>
>>> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> This series is shaping up nicely.  The one thing I think it would
>> benefit from, being a new common framework is something under
>> Documentation giving a brief overview, but more importantly some
>> example code snippets of a mailbox client using the API, and maybe an
>> example usage of the controller API as well.
>>
>> Not only will that guide developers who want to use/implement this API
>> on their platforms, it will also aid reviewers.
>>
> I have been trying to get it upstream for quite some time now because
> my platform depends upon it. I am planning to submit my platform
> support which should have a client and controller side of the mailbox
> API. 

Having a reference implementation is great, but I don't think that
removes the need for a bit of Documentation when introducing a new
framework.  

It's pretty common to see new IPC mechanisms posted and being able to
point somone to this framework and something under Documentation/* would
be a great help in getting more users of the framework.

> Though I am told the API (until v4 at least) supported usecases for 5
> different platforms.

That's great.

I sure would like to see some more Reviewed-by tags from those folks to
confirm that those starting to use it think it's on the right track.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
