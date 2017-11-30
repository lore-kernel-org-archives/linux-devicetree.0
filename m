From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH 2/3] net: socionext: Add Synquacer NetSec driver
Date: Thu, 30 Nov 2017 13:14:48 -0500 (EST)
Message-ID: <20171130.131448.1297231150498183814.davem@davemloft.net>
References: <CAKv+Gu9sOzce_r3JKU8B4JDK2Gr5cB5NZdQxUMEmmy6SZ+sOFw@mail.gmail.com>
        <20171130.125813.1832145274236885737.davem@davemloft.net>
        <CAKv+Gu9qpLWTjjCZBvyn87HoNNY+U5++2UeHxF8jXYQPDd3U1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKv+Gu9qpLWTjjCZBvyn87HoNNY+U5++2UeHxF8jXYQPDd3U1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Thu, 30 Nov 2017 18:08:34 +0000

> But the whole point of memremap() is obtaining a virtual mapping
> that does not require accessors, but can be used like ordinary
> memory.

That's unfortunately not what it's doing.

It's relying on the fact that some architectures (I guess x86
and arm) do happen to give a virutal address from ioremap_wt()
even though it's return type is annotated __iomem.

Thanks in advance for changing your driver to use ioremap() and
accessors for now.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
