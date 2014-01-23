From: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] Culling traffic volume on devicetree mailing list
Date: Thu, 23 Jan 2014 11:03:47 +0000
Message-ID: <1390475027.24595.47.camel@kazak.uk.xensource.com>
References: <CACxGe6vYMOnyeqdhaAggytxgiLH=ijNOrmuq2FyOUtZCGqfdgQ@mail.gmail.com>
	 <CAOesGMhYfWXCFOc6K67aAcNNRUppONY4WNXTvk2NEJH-rfMrGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMhYfWXCFOc6K67aAcNNRUppONY4WNXTvk2NEJH-rfMrGQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-01-22 at 10:35 -0800, Olof Johansson wrote:
> > devicetree-spec: For discussing 'core' device tree bindings. ie.
> > anything that would be a candidate for putting into an ePAPR type
> > spec. Individual device bindings would continue to be posted to
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, but anything affecting subsystems or
> > generic patterns should be posted to this new list.
> 
> I predict that it will be hard for someone posting a patch to tell if
> they should send it to this list or some other list. It might be
> convenient for you guys to ignore the high-volume list and just focus
> on this one, but for the people who post patches it just makes it more
> complicated. IMHO.

The issue with the current list is that it is too much of a firehose of
Linux patches for other non-Linux consumers of DTB e.g. BSD folks, me
with my Xen hat, see [0] for the intersection of those two which
prompted me to mention this on the call.

The firehose means that these people don't subscribe and therefore lack
visibility into what is going on with the core bindings (e.g. BSD seems
to have a different binding for gic interrupts, mentioned in the linked
thread).

I don't think the intention of the split was/should be that "core"
Linux/DTB people should only subscribe to -spec@, rather that it be a
more targeted list which non-Linux/DTB folks can be involved with to
discuss core binding issues and standardisation etc.

It seems like devicetree@ would be the right default destination for any
patch and so should be what is listed in MAINTAINERS etc.

Anyone who is doing actual core/spec work appropriate to -spec@ is
either going to be involved enough to know this themselves or can be
asked to CC the other list too as part of the first round of review. The
number of patches which would need to go to -spec should be a pretty
small fraction.

Ian.

[0] http://thread.gmane.org/gmane.os.freebsd.xen/1976

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
