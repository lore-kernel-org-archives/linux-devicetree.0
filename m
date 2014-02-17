From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Turn of_match_node into a static inline when CONFIG_OF isn't set
Date: Mon, 17 Feb 2014 18:19:53 +0000
Message-ID: <20140217181953.297FBC40372@trevor.secretlab.ca>
References: <1392122211-11422-1-git-send-email-laurent.pinchart@ideasonboard .com> <20140211144108.GB841@joshc.qualcomm.com> <1596542.hkJp71u3OJ@avalon> <20140211164825.GC841@joshc.qualcomm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140211164825.GC841-OP5zVEFNDbfdOxZ39nK119BPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Feb 2014 10:48:26 -0600, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On Tue, Feb 11, 2014 at 03:55:35PM +0100, Laurent Pinchart wrote:
> > Hi Josh,
> > 
> > On Tuesday 11 February 2014 08:41:08 Josh Cartwright wrote:
> > > On Tue, Feb 11, 2014 at 01:36:51PM +0100, Laurent Pinchart wrote:
> > > > when CONFIG_OF is disabled of_match_node is defined as a macro that
> > > > evaluates to NULL. This breaks compilation of drivers that dereference
> > > > the function's return value directly. Fix it by turning the macro into a
> > > > static inline function that returns NULL.
> > > 
> > > Just this past week I did the same thing, but noticed that it breaks the
> > > following usecase:
> > > 
> > > 	#ifdef CONFIG_OF
> > > 	static const struct of_device_id foobar_matches[] = {
> > > 		{ .compatible = "foobar,whatsit", },
> > > 		{ },
> > > 	};
> > > 	#endif
> > > 
> > > 	static int probeme(struct platform_device *pdev)
> > > 	{
> > > 		struct of_device_id *id;
> > > 
> > > 		id = of_match_node(foobar_matches, pdev->dev.of_node);
> > > 		if (id) {
> > > 			/* ... */
> > > 		}
> > > 		return 0;
> > > 	}
> > > 
> > > When !CONFIG_OF and with your change, this will fail to build due to
> > > foobar_matches being undefined.
> > 
> > Good point. What would you think about
> > 
> > #define of_match_node(_matches, _node)  ((const struct of_device_id *)NULL)
> 
> I've just sent out a patchset that cleans up at least a couple of users
> that directly do of_match_node(matches, np)->data using
> of_find_matching_node_and_match.  Not sure if that will fix the usage
> you have in mind, though.
> 
> I am a bit weary about having an of_match_node() user that both directly
> dereferences the result (i.e. of_match_node(matches, np)->data) _and_
> builds when !CONFIG_OF; most likely due to a traumatic childhood event
> where demons flew out my nose.

As is supposed to happen when code dereferrences pointers blindly.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
