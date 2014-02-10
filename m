From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/6] dt: Update binding information for mvebu gating
 clocks with Armada 380/385
Date: Mon, 10 Feb 2014 18:59:08 +0100
Message-ID: <20140210185908.3374eaf6@skate>
References: <1392053569-28037-1-git-send-email-gregory.clement@free-electrons.com>
	<1392053569-28037-7-git-send-email-gregory.clement@free-electrons.com>
	<20140210175350.GD9995@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140210175350.GD9995-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Andrew Lunn,

On Mon, 10 Feb 2014 18:53:50 +0100, Andrew Lunn wrote:
> > +The following is a list of provided IDs for Armada 380/385:
> > +ID	Clock		Peripheral
> > +-----------------------------------
> > +0	audio		Audio
> > +2	ge2		Gigabit Ethernet 2
> > +3	ge1		Gigabit Ethernet 1
> > +4	ge0		Gigabit Ethernet 0
> > +5	pex1		PCIe 1
> > +6	pex2		PCIe 2
> > +7	pex3		PCIe 3
> > +8	pex4		PCIe 0
> 
> Is that last one a typo? It at least looks a bit odd.

Right, this should be:

	8	pex0		PCIe 0

(just checked again in the datasheet)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
