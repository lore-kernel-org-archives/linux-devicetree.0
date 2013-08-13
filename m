Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:41134 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757080Ab3HMQaN (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Tue, 13 Aug 2013 12:30:13 -0400
Date: Tue, 13 Aug 2013 17:29:28 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V5 4/6] of: call __of_parse_phandle_with_args from
 of_parse_phandle
Message-ID: <20130813162928.GS27165@e106331-lin.cambridge.arm.com>
References: <1376328992-3115-1-git-send-email-swarren@wwwdotorg.org>
 <1376328992-3115-4-git-send-email-swarren@wwwdotorg.org>
 <20130813090851.GG27165@e106331-lin.cambridge.arm.com>
 <520A569A.5040805@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <520A569A.5040805@wwwdotorg.org>
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 13, 2013 at 04:54:02PM +0100, Stephen Warren wrote:
> On 08/13/2013 03:08 AM, Mark Rutland wrote:
> > On Mon, Aug 12, 2013 at 06:36:30PM +0100, Stephen Warren wrote:
> >> From: Stephen Warren <swarren@nvidia.com>
> >>
> >> The simplest case of __of_parse_phandle_with_args() implements
> >> of_parse_phandle(), except that it doesn't return the node referenced by
> >> the phandle. Modify it to do so, and then rewrite of_parse_phandle() to
> >> call __of_parse_phandle_with_args() rather than open-coding the simple
> >> case.
> > 
> > That commit message doesn't seem to match the patch (which doesn't
> > modify __of_parse_phandle_with_args).
> > 
> > Rather, now that __of_parse_phandle_with_args can handle parsing with a
> > fixed number of argument cells, it's possible to write of_parse_phandle
> > in terms of it.
> 
> True. I originally hadn't realized that __of_parse_phandle_with_args()
> does already return the node and so started to add that feature, then
> forgot to re-write the commit description. How about:
> 
> -----
> of: call __of_parse_phandle_with_args from of_parse_phandle
> 
> The simplest case of __of_parse_phandle_with_args() now implements the
> semantics of of_parse_phandle(). Rewrite of_parse_phandle() to call
> __of_parse_phandle_with_args() rather than open-coding the simple case.
> -----

Sounds good to me!

> 
> > What's the overhead over the old of_parse_phandle? It looks like this is
> > going to do a lot of pointless work beyond what it already does --
> > parsing each prior entry in the list, and for each prior entry walking
> > the tree in of_find_node_by_phandle. Maybe we don't use long enough
> > phandle lists anywhere for that to be noticeable.
> 
> I think the overhead is pretty minimal. The main difference is that the
> new code will loop over the property cell by cell rather than directly
> jump into the required index. That's not likely to be much work for
> typical properties. In particular, no extra DT property lookups are
> performed, since of_parse_phandle() passes in cells_name=NULL,
> cell_count=0, so the cells_name property is not looked up.

I thought even with your patch we still call of_find_node_by_phandle on
each (phandle) cell as we go over the property, before we hit the check
for cells_name?

Given that of_find_node_by_phandle does a pretty naive linear search of
the of_allnodes list, that could get significant, especially if all the
elements referred to in the property are near the end of the of_allnodes
list.

> 
> Besides, Grant told me to do this change:-)
> 

A Likely story... :)

Thanks,
Mark.
