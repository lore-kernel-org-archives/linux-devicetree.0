From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCHv3 09/16] ARM: mvebu: implement suspend/resume support
 for Armada XP
Date: Fri, 21 Nov 2014 19:50:50 -0500
Message-ID: <20141122005050.GK22670@titan.lakedaemon.net>
References: <1416585613-2113-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1416585613-2113-10-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141121164142.GB20238@lunn.ch>
 <20141121175957.6ef4f26d@free-electrons.com>
 <20141121172031.GC20238@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141121172031.GC20238-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 21, 2014 at 06:20:31PM +0100, Andrew Lunn wrote:
> > > Hi Thomas
> > > 
> > > Is this a well defined mechanism supported by mainline uboot, barebox
> > > etc. Or is it some Marvell extension to their uboot?
> > 
> > As far as I know, it is a Marvell extension to their "binary header",
> > so it's done even before U-Boot starts.
> 
> Ah, O.K. So i miss understood what you meant by bootloader. It is the
> first stage boot loader as part of the BootROM that does this.
> 
> If i've got this wrong, probably others will as well. So could you
> make the comments talk about BootROM bootloader?

No need to respin just for this, I'll quote Thomas' explanation in the
commit log.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
