From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 0/8] Convert Netgear WNR854T to devicetree
Date: Fri, 26 Aug 2016 16:33:58 +0200
Message-ID: <20160826143358.GI25046@lunn.ch>
References: <1468679348-10522-1-git-send-email-jm@lentin.co.uk>
 <1472203264-21089-1-git-send-email-jm@lentin.co.uk>
 <op.ymsxegsy2s3iss@ecaz>
 <alpine.DEB.2.11.1608261325310.19980@marmot.wormnet.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1608261325310.19980-5X291BYdrx55rAo4AelP/Ydd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> >- the factory layout gives you almost no space to play with

Given that the kernel has grown in size over the years, does the
mainline kernel fit in the factory layout?

> Of course, one could also argue I'm breaking backwards compatibility
> at this point by changing it, so maybe I should put it back.

I don't mind breaking backwards compatibility, if the factory defaults
no longer actually work.....

Also, lets think about the users here. This is a very old box. Anybody
playing with one are probably of the sort who tinker with a classic
car in the garage, taking the engine apart and putting it back
together again. I doubt there are users of this box who take their car
in for a service once they are out of windscreen washing water.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
