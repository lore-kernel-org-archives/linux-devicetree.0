From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/4] dmaengine driver for Marvell XOR v2 engine
Date: Tue, 12 Jul 2016 10:12:48 +0530
Message-ID: <20160712044248.GQ9681@localhost>
References: <1466080116-26777-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160628143850.GD14945@localhost>
 <20160707224248.71511ecd@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160707224248.71511ecd-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 07, 2016 at 10:42:48PM +0200, Thomas Petazzoni wrote:
> Hello Vinod,
> 
> On Tue, 28 Jun 2016 20:08:50 +0530, Vinod Koul wrote:
> > On Thu, Jun 16, 2016 at 02:28:32PM +0200, Thomas Petazzoni wrote:
> > > Hello,
> > > 
> > > Here is the fourth version of the mv_xor_v2 driver, which allows to
> > > use the XOR engines available on the Marvell Armada 7K/8K ARM64 SoCs.  
> > 
> > Looks okay. But need ack on two ARM patches...
> 
> Now that the two ARM patches have been taken by the ARM mvebu
> maintainer, do you think you could merge the DT binding and driver
> patches (PATCH 1/2 and PATCH 2/2 of this series) ?

Sorry for bit delay, I have applied them now :)

I modified commit of patch 2 for correcting subsystem name

While applying notice git warned of empty newline in the new file, have
remove that as well

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
