Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:45139 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758522Ab3HMPyG (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2013 11:54:06 -0400
Message-ID: <520A569A.5040805@wwwdotorg.org>
Date: Tue, 13 Aug 2013 09:54:02 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH V5 4/6] of: call __of_parse_phandle_with_args from of_parse_phandle
References: <1376328992-3115-1-git-send-email-swarren@wwwdotorg.org> <1376328992-3115-4-git-send-email-swarren@wwwdotorg.org> <20130813090851.GG27165@e106331-lin.cambridge.arm.com>
In-Reply-To: <20130813090851.GG27165@e106331-lin.cambridge.arm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On 08/13/2013 03:08 AM, Mark Rutland wrote:
> On Mon, Aug 12, 2013 at 06:36:30PM +0100, Stephen Warren wrote:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> The simplest case of __of_parse_phandle_with_args() implements
>> of_parse_phandle(), except that it doesn't return the node referenced by
>> the phandle. Modify it to do so, and then rewrite of_parse_phandle() to
>> call __of_parse_phandle_with_args() rather than open-coding the simple
>> case.
> 
> That commit message doesn't seem to match the patch (which doesn't
> modify __of_parse_phandle_with_args).
> 
> Rather, now that __of_parse_phandle_with_args can handle parsing with a
> fixed number of argument cells, it's possible to write of_parse_phandle
> in terms of it.

True. I originally hadn't realized that __of_parse_phandle_with_args()
does already return the node and so started to add that feature, then
forgot to re-write the commit description. How about:

-----
of: call __of_parse_phandle_with_args from of_parse_phandle

The simplest case of __of_parse_phandle_with_args() now implements the
semantics of of_parse_phandle(). Rewrite of_parse_phandle() to call
__of_parse_phandle_with_args() rather than open-coding the simple case.
-----

> What's the overhead over the old of_parse_phandle? It looks like this is
> going to do a lot of pointless work beyond what it already does --
> parsing each prior entry in the list, and for each prior entry walking
> the tree in of_find_node_by_phandle. Maybe we don't use long enough
> phandle lists anywhere for that to be noticeable.

I think the overhead is pretty minimal. The main difference is that the
new code will loop over the property cell by cell rather than directly
jump into the required index. That's not likely to be much work for
typical properties. In particular, no extra DT property lookups are
performed, since of_parse_phandle() passes in cells_name=NULL,
cell_count=0, so the cells_name property is not looked up.

Besides, Grant told me to do this change:-)
