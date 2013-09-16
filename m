From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: arm: cpus/cpu nodes
 bindings updates
Date: Mon, 16 Sep 2013 09:57:23 +0100
Message-ID: <20130916085723.GB22390@e102568-lin.cambridge.arm.com>
References: <1376559743-31848-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1376559743-31848-2-git-send-email-lorenzo.pieralisi@arm.com>
 <520CE665.8060907@gmail.com>
 <20130815152238.GF17839@e102568-lin.cambridge.arm.com>
 <20130913165708.GC5408@e102568-lin.cambridge.arm.com>
 <20130915083658.GH23705@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130915083658.GH23705-g2DYL2Zd6BY@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave P Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 15, 2013 at 09:36:58AM +0100, Andrew Lunn wrote:
> > > > > +			    "faraday,fa526"
> > > > > +			    "intel,sa110"
> > > > > +			    "intel,sa1100"
> > > > > +			    "marvell,feroceon"
> > > > > +			    "marvell,mohawk"
> > > > > +			    "marvell,pj4"
> > > > > +			    "marvell,sheeva-v7"
> > > > > +			    "marvell,xsc3"
> > > > > +			    "marvell,xscale"
> > > > 
> > > > Better make sure the Marvell folks are happy with these. We don't need
> > > > another rename here. I'm too annoyed with all the renames to pay attention.
> > > 
> > > Ok, I will verify that, I copied maintainers in.
> 
> Hi Lorenzo
> 
> Here are the compatibility strings we would like, and a comment about
> which SoCs will/do use them.
> 
> "marvell,feroceon"  - Orion5x
> "marvell,sheeva-v5" - Mv78xx0, Kirkwood
> "marvell,pj4a"      - Dove
> "marvell,pj4b"      - Armada XP, Armada 370, Armada 1500
> "marvell,mohawk"    - Armada 100
> 
> "marvell,xscale" & "marvell,xsc3" should be removed.
> 
> The compatibility strings are not correct, or present in all the
> current <soc>.dtsi files. 
> 
> orion5x cpus needs adding.
> mv78xx0 needs adding.
> kirkwood.dtsi needs changing.
> armada-370-xp.dtsi need changing.
> armada-xp-mv*.dtsi needs changing.
> 
> We will deal with these in the next cycle.

Thank you very much Andrew, appreciated. I will update the document
accordingly and should be able to post a final version very soon.

Lorenzo

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
