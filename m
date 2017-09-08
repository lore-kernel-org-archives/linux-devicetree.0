From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
Date: Fri, 8 Sep 2017 15:18:31 +0900
Message-ID: <CAK7LNATaisd3tPNbujTWLUq-2sMQ3pyTkPRSgjw00zUzv=GvSQ@mail.gmail.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg@mail.gmail.com> <CA+55aFzr2HTZVOuzpHYDwmtRJLsVzE-yqg2DHpHi_9ePsYp5ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+55aFzr2HTZVOuzpHYDwmtRJLsVzE-yqg2DHpHi_9ePsYp5ug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Richard Purdie <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Markus Heiser <markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, SeongJae Park <sj38.park-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Yann E. MORIN" <yann.morin.1>
List-Id: devicetree@vger.kernel.org

Hi Linus,


Very sorry that I had not responded quickly.

When I was digging into tool version dependency,
as you pointed out, gperf is a problem (but seemed one time breakage
for gperf 3.1)
flex seemed very stable for a long time.
bison seemed a bit problem if old version is used.


But, I did not have enough time to take a closer look.
I thought I should respond after I tested more, but I has been pressed
by my daily tasks, then time passed...
Very sorry.



Today, I just noticed gperf usage got dropped from the kernel.

If CONFIG_MODVERSIONS is enabled,
I notice lots of error messages.
WARNING: EXPORT symbol "finish_open" [vmlinux] version generation
failed, symbol will not be


So, I think something was broken in scripts/genksyms/.

Of course, it was a trivial conversion, so it should not be hard to fix...



> gperf is clearly written by clowns that don't understand about
> compatibility issues - it would have been trivial for them to add some
> kind of marker define so that you could test for this directly rather
> than depend on some kind of autoconf "try to build and see if it
> fails" crap.


One idea may be to process the output of "gperf -v"
and embed GPERF_VERSION into the output .c files.

But, if you are unhappy with gperf breakage this time,
we can live without gperf.




> It's likely not even any slower, but who the hell knows.. Do we even
> care? It's almost certainly faster if you compare to generating that
> gperf code.
>

For scripts/kconfig/, I think we do not care at all
because we usually invoke it just once when we configure the build setting.


If we enable CONFIG_MODVERSIONS, scripts/genksyms/ is invoked
over and over again.

Sorry, I have not evaluated if
the perfect hash gives us noticeable advantage or not..



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
