From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] Culling traffic volume on devicetree mailing list
Date: Fri, 24 Jan 2014 11:11:35 +0000
Message-ID: <20140124111135.25994C4088D@trevor.secretlab.ca>
References: <CACxGe6vYMOnyeqdhaAggytxgiLH=ijNOrmuq2FyOUtZCGqfdgQ@mail.gmail. com> <20140122172243.GC29184@titan.lakedaemon.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140122172243.GC29184-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 22 Jan 2014 12:22:43 -0500, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> Grant,
> 
> On Tue, Jan 21, 2014 at 02:40:48PM +0000, Grant Likely wrote:
> > Hi everyone,
> > 
> > Today on the devicetree conf call 
> 
> Sorry I couldn't make it, I had a last minute engagement yesterday AM.
> 
> > we (Rob, Ian and I) talked about culling the volume of traffic on the
> > devicetree list so that it would be more useful to the DTC maintainers
> > and non-Linux users like freebsd. We'd like to propose creating the
> > following two lists so that those interested don't need to drink from
> > the firehose:
> > 
> > devicetree-compiler: Specifically for discussing dt tooling topics
> > (parsing, schema validation, data format)
> 
> Ack.
> 
> > devicetree-spec: For discussing 'core' device tree bindings. ie.
> > anything that would be a candidate for putting into an ePAPR type
> > spec. Individual device bindings would continue to be posted to
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, but anything affecting subsystems or
> > generic patterns should be posted to this new list.
> > 
> > Thoughts?
> 
> How do patch series submitters easily determine when to send to -spec
> vice the general list?  I'm thinking wrt get_maintainers.pl.

Driver patch authors wouldn't need to worry about it over much.
get_maintainer.pl currently does what is needed. Only when developers
start venturing into core bindings would they need to worry about the
spec list. I'm inclined to believe that the traffic will be small enough
that we can simply tell people, "hey, this looks pretty generic, you
should probably post it to the spec list."

Maybe devicetree-core would be a better list name though.

> 
> Perhaps it's worth considering organizing Doc.../bindings/ into
> subsystem/ and ...'not'?  The "suitable for ePAPR" criteria would be a
> good differentiator.

I'm not opposed to that. Having someone curate that directory would be
helpful. Want to volunteer? :-)

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
