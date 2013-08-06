Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:51427 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755917Ab3HFQLv (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 6 Aug 2013 12:11:51 -0400
Date: Tue, 6 Aug 2013 17:11:30 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RESEND PATCHv2] of: add vendor prefix for Altera Corp.
Message-ID: <20130806161130.GA26996@e106331-lin.cambridge.arm.com>
References: <1375735699-7056-1-git-send-email-dinguyen@altera.com>
 <5FD2B856-610A-4D25-85F4-0CE30EB86323@codeaurora.org>
 <1375736573.7277.7.camel@linux-builds1>
 <20130806083901.GA23111@e106331-lin.cambridge.arm.com>
 <71B37E0559AC6849A68C5BA94C509FB45CCE13F108@SJ-ITMSG02.altera.priv.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71B37E0559AC6849A68C5BA94C509FB45CCE13F108@SJ-ITMSG02.altera.priv.altera.com>
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@altera.com>
Cc: "grant.likely@linaro.org" <grant.likely@linaro.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>, "dinh.linux@gmail.com" <dinh.linux@gmail.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 06, 2013 at 04:56:01PM +0100, Dinh Nguyen wrote:
> On Tue, 2013-08-06 at 09:39 +0100, Mark Rutland wrote:
> > On Mon, Aug 05, 2013 at 10:02:53PM +0100, Dinh Nguyen wrote:
> > > On Mon, 2013-08-05 at 15:50 -0500, Kumar Gala wrote:
> > > > On Aug 5, 2013, at 3:48 PM, <dinguyen@altera.com> <dinguyen@altera.com> wrote:
> > > >
> > > > > From: Dinh Nguyen <dinguyen@altera.com>
> > > > >
> > > > > Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
> > > > > Cc: Grant Likely <grant.likely@linaro.org>
> > > > > Cc: Rob Herring <rob.herring@calxeda.com>
> > > > > Cc: Pawel Moll <pawel.moll@arm.com>
> > > > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > > > Cc: Stephen Warren <swarren@wwwdotorg.org>
> > > > > Cc: Ian Campbell <ian.campbell@citrix.com>
> > > > > Cc: devicetree@vger.kernel.org
> > > > >
> > > > > v2:
> > > > > - Changed altr -> ALTR
> > > > > ---
> > > > > .../devicetree/bindings/vendor-prefixes.txt        |    1 +
> > > > > 1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > > > > index 366ce9b..6c2b273 100644
> > > > > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > > > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > > > > @@ -7,6 +7,7 @@ ad      Avionic Design GmbH
> > > > > adi     Analog Devices, Inc.
> > > > > aeroflexgaisler Aeroflex Gaisler AB
> > > > > ak      Asahi Kasei Corp.
> > > > > +ALTR   Altera Corp.
> > > >
> > > > why all caps?  we seem to have avoid doing that for almost everyone?
> > >
> > > CC: David Gibson <david@gibson.dropbear.id.au>
> > >
> > > I can't find the archived email, but this is the excerpt from v1:
> > >
> > > On Sat, Jul 27, 2013 at 10:41:25PM -0600, Grant Likely wrote:
> > > > On Fri, 26 Jul 2013 14:05:26 -0600, Stephen Warren
> > > <swarren@wwwdotorg.org> wrote:
> > > > > On 07/26/2013 01:39 PM, dinguyen@altera.com wrote:
> > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > > b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > > > >
> > > > > > +altr     Altera Corp.
> > > > >
> > > > > In the context of Marvel(?) wanting to change between a longer and
> > > > > stock-ticker vendor name, there was some discussion re: whether we
> > > had
> > > > > decided not to use stock tickers any more. Is there still consensus
> > > that
> > > > > we should? If so, I have no problem with this patch, but I wanted to
> > > > > make sure everyone was on the same page.
> > > >
> > > > Stock ticker names are just fine by me. But once set they should not
> > > > change.
> > >
> > > On Tue, 2013-07-30 at 16:10 +1000, David Gibson wrote:
> > > >The old recommendation from OF working group was that vendor
> > > >prefixes could be either ticker symbols in all caps (e.g. "AAPL"), or
> > > >some other string in lower case.
> >
> > This would leave ALTR as the oddball out of all the prefixes currently
> > in existence (of which several are *lower case* stock ticker symbols).
> >
> > Grant, do you have any view here? I'm happy to allow uppercase if you're
> > happy with it.
> >
> > >
> > > >We've mostly only used the second option.
> > > ------
> > >
> > > So I'm think we're going with all caps for ALTR. We've already been
> > > using altr, so the 2nd option is colliding with the 1st option.
> >
> > Why is using the string you're using already (atlr) a problem?
> 
> Its not a problem. It was a suggestion from the V1 patch and then
> silence. I took the silence as *caps* was the way to go.

Aah, sorry for the confusion there. I guess we're all a bit stretched at
the moment. I'm happy with altr (lower case) as a vendor prefix, and
I'll reply to the original patch to clarify the matter.

Thanks,
Mark.
