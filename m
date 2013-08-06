Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:51562 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755863Ab3HFQSk (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 6 Aug 2013 12:18:40 -0400
Date: Tue, 6 Aug 2013 17:18:05 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] of: add vendor prefix for Altera Corp.
Message-ID: <20130806161804.GB26996@e106331-lin.cambridge.arm.com>
References: <1374867540-9477-1-git-send-email-dinguyen@altera.com>
 <51F2D686.4090104@wwwdotorg.org>
 <20130728044125.60F3A3E08FE@localhost>
 <20130730061028.GM29970@voom.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130730061028.GM29970@voom.fritz.box>
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: "dinguyen@altera.com" <dinguyen@altera.com>, David Gibson <david@gibson.dropbear.id.au>
Cc: "grant.likely@linaro.org" <grant.likely@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, "dinh.linux@gmail.com" <dinh.linux@gmail.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>
List-ID: <devicetree@vger.kernel.org>

Dinh,

Apologies for the delay on this.

On Tue, Jul 30, 2013 at 07:10:28AM +0100, David Gibson wrote:
> On Sat, Jul 27, 2013 at 10:41:25PM -0600, Grant Likely wrote:
> > On Fri, 26 Jul 2013 14:05:26 -0600, Stephen Warren <swarren@wwwdotorg.org> wrote:
> > > On 07/26/2013 01:39 PM, dinguyen@altera.com wrote:
> > > 
> > > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > > 
> > > > +altr	Altera Corp.
> > > 
> > > In the context of Marvel(?) wanting to change between a longer and
> > > stock-ticker vendor name, there was some discussion re: whether we had
> > > decided not to use stock tickers any more. Is there still consensus that
> > > we should? If so, I have no problem with this patch, but I wanted to
> > > make sure everyone was on the same page.
> > 
> > Stock ticker names are just fine by me. But once set they should not
> > change.
> 
> The old recommendation from OF working group was that vendor prefixes
> could be either ticker symbols in all caps (e.g. "AAPL"), or some
> other string in lower case.
> 
> We've mostly only used the second option.

Given that all the vendor prefixes we have (even those that are based on 
stock-ticker symbols) are lower case, I'd be happier with the lower-case
"altr" in the original patch.

>From the sounds of it, no-one wants to push for "altera", and we already
have bindings with "altr", so I guess "altr" it is:

Acked-by: Mark Rutland <mark.rutland@arm.com>

I note that there are some bindings with "altr" and some with "ALTR",
though "altr" is more common. It would be nice if the binding documents
were updated mention "ALTR" being deprecated, but useful for
compatibility, hopefully this will lead to less confusion in future.

It would also be nice for the drivers dealing with "ALTR" to be updated
to also support "altr" (without removing support for "ALTR").

Thanks,
Mark.
