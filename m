From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] r8a777[89] dtsi sorting
Date: Fri, 29 Aug 2014 22:03:27 +0200
Message-ID: <CAMuHMdXZ_drLTdm_912EOL+g+rYqwOmH361NzQgz9+ruDmUEnA@mail.gmail.com>
References: <1409336201-708-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1409336201-708-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-sh list <linux-sh@vger.kernel.org>, Simon Horman <horms@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Uli,

On Fri, Aug 29, 2014 at 8:16 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> These are the dtsi files for r8a7778 and r8a7779 sorted according to what I
> imagine to be accepted standards now: sort by address, "compatible" goes
> first, #include directives before anything else.  The sorting was done using
> a little script I wrote (https://github.com/uli/dtssort).

Nice! (but soon thereafter I got sidetracked by decomp ;-)

> I chose these two files because the required changes are relatively small.
> Doing this for r8a779x yields a gargantuan and entirely unreadable patch due
> to the random shifting about of large blocks of code.  If anybody knows a
> tool that makes such things somewhat manageable to review, please speak up.

You more or less gave a solution at the top of your email: split it in multiple
patches: one to sort the includes, one to sort the properties inside the nodes,
and one single patch for each node you move.
Yes, too many patches, but good for the patch statistics ;-)

Another approach could be to start considering SoCs as built from multiple
hardware blocks, not only at the hardware/software level, but also at the DTS
level. I.e. use macros to instantiate nodes. This makes it easier to avoid
stupid typos in e.g. the 5th i2c node. In addition, many SoCs are similar, and
only differ in a few nodes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
