From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 0/5] mfd: tps65912: Driver rewrite with DT support
Date: Thu, 14 Jan 2016 09:54:30 +0100
Message-ID: <CACRpkdZHnDCg1N3Fe1brqwiCKRBT1BKKa9OfSzGT-2WPXyRp_A@mail.gmail.com>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
	<20151124162624.GI807@x1>
	<20151204120240.GW26072@sirena.org.uk>
	<5665E4F7.1070707@ti.com>
	<20151208191657.GA5727@sirena.org.uk>
	<CACRpkdZU3RrXmPr1fDzCMumhQ8nWEf126iC1rDu=xiLFj7DU+A@mail.gmail.com>
	<56703CCC.5060608@ti.com>
	<CACRpkdYxBkuRcE6_VvChO=kKHTd0TS1kKAutL=8hFA4-15h3nA@mail.gmail.com>
	<20160111073811.GA3331@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160111073811.GA3331@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 11, 2016 at 8:38 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, 22 Dec 2015, Linus Walleij wrote:
>
>> On Tue, Dec 15, 2015 at 5:16 PM, Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org> wrote:
>>
>> > Is there anything I can do to help this along? This series
>> > and the tps65086 series have been blocked for months on
>> > trivial issues. (Not sure why the tps65086 hasn't been taken,
>> > it doesn't have this problem, I'd be OK with this getting
>> > stalled for a bit longer if someone could look at the other
>> > one)
>>
>> Lee can you merge the core driver if it's OK? Then we have
>> includes etc in place to merge subdrivers for the next merge
>> window.
>
> It's made more complex than that, due to patch 2 removing code from
> all subsystems.  We probably need to take this in in its entirety, no?

You know way better than me :) go ahead with the best solution
from the MFD point of view I'd say.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
