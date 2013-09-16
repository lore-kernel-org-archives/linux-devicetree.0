From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v7 3/4] drivers: of: add initialization code for dma
 reserved memory
Date: Mon, 16 Sep 2013 06:43:08 -0700
Message-ID: <CACxGe6s_JY7GpjXN7gwADV0oE+BnQfJX4AaXTZURumfepa3NiA@mail.gmail.com>
References: <1377527959-5080-1-git-send-email-m.szyprowski@samsung.com>
 <1377527959-5080-4-git-send-email-m.szyprowski@samsung.com>
 <20130829224637.D09183E1222@localhost> <52209278.8040106@samsung.com>
 <DAF223EB-C84C-4E82-A24A-ACD0A3A0559F@codeaurora.org> <20130909160154.8D7183E0F23@localhost>
 <5236AF64.80607@samsung.com> <1379316344.3721.6.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379316344.3721.6.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2013 at 12:25 AM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Mon, 2013-09-16 at 09:12 +0200, Marek Szyprowski wrote:
>>
>> Fixing those issues requires further discussion. Frankly, right now I
>> really have no idea which way should I go. The /reserved-ranges node seems
>> to be easy to match particular reserved memory region with a given device.
>> I'm also not really convinced if it makes sense to add a code for finding
>> and matching a reserved memory region to every device driver, which might
>> need it. I would really like to get some more feedback on the Ben's
>> comment.
>>
>> In any case, the code will also change significantly, so I assume that the
>> best, what can be done now is to revert the current version and start from
>> the scratch with a new, complete proposal.
>
> Yes, let's do that. I will try to help. It shouldn't be that a big deal.

I think we can get the concerns sorted quickly. I'm at meetings all
day today in SJC, but I'll take a look at it this evening. I'll be in
Edinburgh. We're holding an ARM summit at the same time so a bunch of
affected ARM folks will be there.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
