From: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: updating ePAPR
Date: Fri, 27 Sep 2013 19:18:49 +0000
Message-ID: <9F6FE96B71CF29479FF1CDC8046E15036D1F24@039-SN1MPN1-003.039d.mgd.msft.net>
References: <F02F49F7-1214-4DFF-A5E7-5DB33B3BCBD0@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <F02F49F7-1214-4DFF-A5E7-5DB33B3BCBD0-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Kumar Gala [mailto:galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org]
> Sent: Friday, September 27, 2013 10:38 AM
> To: Yoder Stuart-B08248
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: updating ePAPR
> 
> Stuart,
> 
> Is there any activity to update ePAPR?  If not what would be involved in
> doing so?

The ePAPR committee has not been meeting as we've not had proposed
changes in the last couple of years.

> We are having some discussion about unit addresses and what ePAPR says in
> section 2.2.1.1 "Node Name Requirements" about them.  Technically the soc
> nodes in most (if not all) PPC dts would be in violation of what is
> stated here, in addition I don't think the simple-bus binding says
> anything about node names.
> 
> Here's a link to some of the discussion:
> 
> https://lkml.org/lkml/2013/9/19/301

It's a matter of the committee meeting, agreeing on proposed
changes, voting.  And then following the power.org approval
process which takes a few months.

I would prefer including other updates at the same time
before incurring the bureaucratic overhead.   ePAPR 1.1
came out in 2011.  I wonder if there are other changes
that would make sense to include.

I will ping the power.org mailing list to see if anyone is
aware of any updates needed.

Stuart


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
