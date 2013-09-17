From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: "memory" binding issues
Date: Tue, 17 Sep 2013 16:25:08 -0700
Message-ID: <CAOesGMhzc=BCDBYcidKHhFbwuD1r4R2ePbdYRCTgX2USdXPnRQ@mail.gmail.com>
References: <1379300274.4098.77.camel@pasglop>
	<5238C4D1.6060500@gmail.com>
	<CAOesGMh0F09OAR4bepGSCE5Z5OZ56fBmDPBSfwZ+NB9RgcE0Vw@mail.gmail.com>
	<2179723.s3DLWi0P8b@flatron>
	<CAOesGMjt6RsvYRjXxpB=v-Ro6iyUN=YzkDd1mfHqCDJJDRJvLg@mail.gmail.com>
	<1379459060.6148.10.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379459060.6148.10.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2013 at 4:04 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Tue, 2013-09-17 at 14:33 -0700, Olof Johansson wrote:
>> > I don't think it's broken, why do you think so? It's at least
>> consistent.
>> > Probably not perfect and not complete, but IMHO a reasonable base
>> for
>> > further work. (Also at least something written down that people can
>> learn
>> > from and/or refer to.)
>>
>> So, I stand corrected. It seems that at least one legacy system I'm
>> looking at always specifies unit address as well. I don't like it but
>> I'll stop arguing.
>>
>> Ben: The interesting part is that it does _not_ specify it on /memory
>> though. Nor, of course, on /cpus or /openprom. So assuming /memory@0
>> exists will break even on some powerpc platforms.
>
> What system is that out of curiosity ? Also make sure it's not just
> Linux being an idiot and stripping the @0 in /proc/device-tree ...
>
> (I think some old versions of /proc code would strip it)
>
> Or is that some insanely broken OF like Apple old world or Pegasos ?
>
> If it's just embedded .dts files, yes, I fixed some, but we might still
> have some bad ones.

The only powerpc hardware I still have these days is PA Semi systems,
so it's from one of them, with current -next kernel. Booted with OF
client interface, no dts file that can be fixed.

> In any case, we all agree, the right thing to do first is to fix our
> path parser to cope either way.

Yep, I just wanted to alert you that there's powerpc systems out there
with just /memory as well.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
