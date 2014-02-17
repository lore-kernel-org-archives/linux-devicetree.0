From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] of: search the best compatible match first in __of_match_node()
Date: Mon, 17 Feb 2014 17:59:59 +0000
Message-ID: <20140217175959.178DAC403C8@trevor.secretlab.ca>
References: <1392355366-1445-1-git-send-email-haokexin@gmail.com> < 1392355366-1445-3-git-send-email-haokexin@gmail.com> < CAL_JsqKq4_1K8EF+PZoP=0=H6tiRxbgdzs9UHHVdbHS014n74Q@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKq4_1K8EF+PZoP=0=H6tiRxbgdzs9UHHVdbHS014n74Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 14 Feb 2014 09:53:40 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Feb 13, 2014 at 11:22 PM, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Currently, of_match_node compares each given match against all node's
> > compatible strings with of_device_is_compatible.
> >
> > To achieve multiple compatible strings per node with ordering from
> > specific to generic, this requires given matches to be ordered from
> > specific to generic. For most of the drivers this is not true and also
> > an alphabetical ordering is more sane there.
> >
> > Therefore, this patch introduces a function to match each of the node's
> > compatible strings against all given compatible matches without type and
> > name first, before checking the next compatible string. This implies
> > that node's compatibles are ordered from specific to generic while
> > given matches can be in any order. If we fail to find such a match
> > entry, then fall-back to the old method in order to keep compatibility.
> >
> > Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Looks good to me. I'll put this in next for a few days. I'd really
> like to see some acks and tested-by's before sending to Linus.

As I commented on the patch, I don't think the new solution is correct
either. I've made a suggestion on how to fix it, but in the mean time
the revert should be applied and sent to Linus.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
