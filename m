From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] To remove non-ascii characters in of_selftest.txt
Date: Mon, 06 Oct 2014 09:56:40 +0100
Message-ID: <20141006085640.83D8EC40A89@trevor.secretlab.ca>
References: <1411933087-4272-1-git-send-email-gaurav.minocha.os@gmail.com>
	<CAMuHMdUvr49-iWUwNDrC6iDkrY_rE2hpynzeFS47j1W-69OfNQ@mail.gmail.com>
	<CA+rpMb+UDSvn0jDZDoJzcQJjf56PpLMb-ta_9yvpohV26A-3Ow@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+rpMb+UDSvn0jDZDoJzcQJjf56PpLMb-ta_9yvpohV26A-3Ow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 29 Sep 2014 13:02:21 -0700
, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 wrote:
> On Mon, Sep 29, 2014 at 1:07 AM, Geert Uytterhoeven
> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> > Hi Gaurav, Grant,
> >
> > On Sun, Sep 28, 2014 at 9:38 PM, Gaurav Minocha
> > <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> This patch removes the non-ascii characters in
> >> Documentation/devicetree/of_selftest.txt
> >
> > I was wondering against which tree this was, as this file was not in my
> > local copy of linux-next (which was still at next-20140925).
> >
> > Perhaps the filename was wrong?
> >
> > So I grepped for "of_fdt_unflatten_device_tree", as this looked like a good
> > search pattern, cfr.
> >
> >>  Secondly, it calls of_fdt_unflatten_device_tree() to unflatten the flattened
> >
> > Surprise! No occurrences of  "of_fdt_unflatten_device_tree" found!
> >
> > [ more digging ]
> >
> > Ah, found it, it went almost straight into Linus' tree, and thus appeared in
> > next-20140926 after the fact.
> >
> > Still:
> >
> > $ git grep of_fdt_unflatten_device_tree | cat
> > Documentation/devicetree/of_selftest.txt:Secondly, it calls
> > of_fdt_unflatten_device_tree() to unflatten the flattened
> > $
> >
> > So this part of the documentation is not correct.
> 
> Yes, my bad. That is supposed to be of_fdt_unflatten_tree.
> 
> Will fix it. Thanks!

Applied and typo fixed up. Thanks!

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
