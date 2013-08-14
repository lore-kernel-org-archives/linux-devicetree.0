Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:33343 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751014Ab3HNQFL (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 14 Aug 2013 12:05:11 -0400
Date: Wed, 14 Aug 2013 17:04:59 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V5 4/6] of: call __of_parse_phandle_with_args from
 of_parse_phandle
Message-ID: <20130814160459.GB18868@e106331-lin.cambridge.arm.com>
References: <1376328992-3115-1-git-send-email-swarren@wwwdotorg.org>
 <1376328992-3115-4-git-send-email-swarren@wwwdotorg.org>
 <20130813090851.GG27165@e106331-lin.cambridge.arm.com>
 <520A569A.5040805@wwwdotorg.org>
 <20130813162928.GS27165@e106331-lin.cambridge.arm.com>
 <520A7719.1090007@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <520A7719.1090007@wwwdotorg.org>
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 13, 2013 at 07:12:41PM +0100, Stephen Warren wrote:
> On 08/13/2013 10:29 AM, Mark Rutland wrote:
> > On Tue, Aug 13, 2013 at 04:54:02PM +0100, Stephen Warren wrote:
> >> On 08/13/2013 03:08 AM, Mark Rutland wrote:
> >>> On Mon, Aug 12, 2013 at 06:36:30PM +0100, Stephen Warren wrote:
> >>>> From: Stephen Warren <swarren@nvidia.com>
> >>>>
> >>>> The simplest case of __of_parse_phandle_with_args() implements
> >>>> of_parse_phandle(), except that it doesn't return the node referenced by
> >>>> the phandle. Modify it to do so, and then rewrite of_parse_phandle() to
> >>>> call __of_parse_phandle_with_args() rather than open-coding the simple
> >>>> case.
> ...
> >>> What's the overhead over the old of_parse_phandle? It looks like this is
> >>> going to do a lot of pointless work beyond what it already does --
> >>> parsing each prior entry in the list, and for each prior entry walking
> >>> the tree in of_find_node_by_phandle. Maybe we don't use long enough
> >>> phandle lists anywhere for that to be noticeable.
> >>
> >> I think the overhead is pretty minimal. The main difference is that the
> >> new code will loop over the property cell by cell rather than directly
> >> jump into the required index. That's not likely to be much work for
> >> typical properties. In particular, no extra DT property lookups are
> >> performed, since of_parse_phandle() passes in cells_name=NULL,
> >> cell_count=0, so the cells_name property is not looked up.
> > 
> > I thought even with your patch we still call of_find_node_by_phandle on
> > each (phandle) cell as we go over the property, before we hit the check
> > for cells_name?
> > 
> > Given that of_find_node_by_phandle does a pretty naive linear search of
> > the of_allnodes list, that could get significant, especially if all the
> > elements referred to in the property are near the end of the of_allnodes
> > list.
> 
> Oh yes, that is true.
> 
> I suppose it'd be possible to make the call to of_find_node_by_phandle()
> conditional; it'd be needed:
> 
> if (cells_name /* Need to get property from it */ ||
> 	cur_index == index /* Need to return it */)
> 
> Do you think it's worth making that change?
> 

To be honest, I'm not sure. From a quick grep, most of_parse_phandle()
instances are only grabbing element 0, and without digging I can only
see a couple that do more than that. There's probably not that big a hit
in those cases.

I'm happy either way, so feel free to stick my ack on with or without:

Acked-by: Mark Rutland <mark.rutland@arm.com> 

Thanks,
Mark.
