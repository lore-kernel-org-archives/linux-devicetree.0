From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: give priority to the compatible match in __of_match_node()
Date: Mon, 17 Feb 2014 18:06:49 +0000
Message-ID: <20140217180649.8F257C403C8@trevor.secretlab.ca>
References: <1392205084-2351-1-git-send-email-haokexin@gmail.com> < CAL_JsqKMi2H=vwoxrOt8QRA2xJeiLqBKKfLtt4QRCRoFk6JUHg@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKMi2H=vwoxrOt8QRA2xJeiLqBKKfLtt4QRCRoFk6JUHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 13 Feb 2014 13:01:42 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Feb 12, 2014 at 5:38 AM, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > When the device node do have a compatible property, we definitely
> > prefer the compatible match besides the type and name. Only if
> > there is no such a match, we then consider the candidate which
> > doesn't have compatible entry but do match the type or name with
> > the device node.
> >
> > This is based on a patch from Sebastian Hesselbarth.
> >   http://patchwork.ozlabs.org/patch/319434/
> >
> > I did some code refactoring and also fixed a bug in the original patch.
> 
> I'm inclined to just revert this once again and avoid possibly
> breaking yet another platform.
> 
> However, I think I would like to see this structured differently. We
> basically have 2 ways of matching: the existing pre-3.14 way and the
> desired match on best compatible only. All new bindings should match
> with the new way and the old way needs to be kept for compatibility.
> So lets structure the code that way. Search the match table first for
> best compatible with name and type NULL, then search the table the old
> way. I realize it appears you are doing this, but it is not clear this
> is the intent of the code. I would like to see this written as a patch
> with commit 105353145eafb3ea919 reverted first and you add a new match
> function to call first and then fallback to the existing function.

I disagree here, partially because it complicates the code and partially
because it leaves an incorrect corner case.  Compatible is always the
preferred matching, even on old drivers, but there are bindings that
take both compatible and type or name into account. Even those cases
should rank the compatible order.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
