From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
Date: Sat, 19 Aug 2017 10:14:25 -0700
Message-ID: <CA+55aFzr2HTZVOuzpHYDwmtRJLsVzE-yqg2DHpHi_9ePsYp5ug@mail.gmail.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com> <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Richard Purdie <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Markus Heiser <markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, SeongJae Park <sj38.park-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Yann E. MORIN" <yann.morin.1>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 19, 2017 at 10:03 AM, Linus Torvalds
<torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> wrote:
>
> So one of the advantages of the pre-shipped files is that we can avoid
> that kind of crazy version issues with the tools.

Side note: the traditional way to handle this is autoconf etc. Since I
think autoconf is evil crap, I refuse to have anything what-so-ever to
do with it.

gperf is clearly written by clowns that don't understand about
compatibility issues - it would have been trivial for them to add some
kind of marker define so that you could test for this directly rather
than depend on some kind of autoconf "try to build and see if it
fails" crap.

So I think the best option would be to jhust get rid of gperf, and use
a normal hash function instead (even if it isn't "perfect" - it's not
like perfect hashes are so wonderful).

I wonder if those two ID lookups are even worth hashing at all - the
arrays aren't so big, and the uses aren't so timing-critical, so it's
entirely possible that we could just get rid of any hashing at all and
just use some stupid linear search thing.

I assume that flex/bison are stable enough that we don't have the same
kind of annoying stupid version issues with it.

Anybody want to look at just getting rid of the gperf use?

                  Linus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
