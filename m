Return-Path: <devicetree-owner@vger.kernel.org>
Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]:9058 "EHLO
	va3outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754498Ab3HEVCc (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2013 17:02:32 -0400
Message-ID: <1375736573.7277.7.camel@linux-builds1>
Subject: Re: [RESEND PATCHv2] of: add vendor prefix for Altera Corp.
From: Dinh Nguyen <dinguyen@altera.com>
Date: Mon, 5 Aug 2013 16:02:53 -0500
In-Reply-To: <5FD2B856-610A-4D25-85F4-0CE30EB86323@codeaurora.org>
References: <1375735699-7056-1-git-send-email-dinguyen@altera.com>
	 <5FD2B856-610A-4D25-85F4-0CE30EB86323@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, dinh.linux@gmail.com, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 2013-08-05 at 15:50 -0500, Kumar Gala wrote:
> On Aug 5, 2013, at 3:48 PM, <dinguyen@altera.com> <dinguyen@altera.com> wrote:
> 
> > From: Dinh Nguyen <dinguyen@altera.com>
> > 
> > Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
> > Cc: Grant Likely <grant.likely@linaro.org>
> > Cc: Rob Herring <rob.herring@calxeda.com>
> > Cc: Pawel Moll <pawel.moll@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Stephen Warren <swarren@wwwdotorg.org>
> > Cc: Ian Campbell <ian.campbell@citrix.com>
> > Cc: devicetree@vger.kernel.org
> > 
> > v2:
> > - Changed altr -> ALTR
> > ---
> > .../devicetree/bindings/vendor-prefixes.txt        |    1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index 366ce9b..6c2b273 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -7,6 +7,7 @@ ad	Avionic Design GmbH
> > adi	Analog Devices, Inc.
> > aeroflexgaisler	Aeroflex Gaisler AB
> > ak	Asahi Kasei Corp.
> > +ALTR	Altera Corp.
> 
> why all caps?  we seem to have avoid doing that for almost everyone?

CC: David Gibson <david@gibson.dropbear.id.au>

I can't find the archived email, but this is the excerpt from v1:

On Sat, Jul 27, 2013 at 10:41:25PM -0600, Grant Likely wrote:
> On Fri, 26 Jul 2013 14:05:26 -0600, Stephen Warren
<swarren@wwwdotorg.org> wrote:
> > On 07/26/2013 01:39 PM, dinguyen@altera.com wrote:
> > 
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > 
> > > +altr     Altera Corp.
> > 
> > In the context of Marvel(?) wanting to change between a longer and
> > stock-ticker vendor name, there was some discussion re: whether we
had
> > decided not to use stock tickers any more. Is there still consensus
that
> > we should? If so, I have no problem with this patch, but I wanted to
> > make sure everyone was on the same page.
> 
> Stock ticker names are just fine by me. But once set they should not
> change.

On Tue, 2013-07-30 at 16:10 +1000, David Gibson wrote:
>The old recommendation from OF working group was that vendor
>prefixes could be either ticker symbols in all caps (e.g. "AAPL"), or
>some other string in lower case.

>We've mostly only used the second option.
------

So I'm think we're going with all caps for ALTR. We've already been
using altr, so the 2nd option is colliding with the 1st option.


Dinh

> 
> - k
> 
> > amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
> > apm	Applied Micro Circuits Corporation (APM)
> > arm	ARM Ltd.
> > -- 
> > 1.7.9.5
> > 
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> --
> Employee of Qualcomm Innovation Center, Inc.
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
> 
> 



