From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/2] mtd: nand: add sunxi NAND flash
 controller support
Date: Sat, 20 Sep 2014 13:03:15 +0200
Message-ID: <20140920130315.197ab359@bbrezillon>
References: <1408382788-32153-1-git-send-email-boris.brezillon@free-electrons.com>
	<20140920043438.GD8127@brian-ubuntu>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBB5V56WQAKGQE34T6L2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140920043438.GD8127@brian-ubuntu>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "Dmitriy B." <rzk333-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yassin Jaffer <yassinjaffer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Meyer <quitte-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,

On Fri, 19 Sep 2014 21:34:38 -0700
Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi Boris,
> 
> On Mon, Aug 18, 2014 at 07:26:26PM +0200, Boris BREZILLON wrote:
> > This patch series adds support for the sunxi NAND Flash Controller (NFC)
> > block.
> > 
> > These two patches only add support for the basic NAND stuff:
> >  - NAND controller operations
> >  - SW and HW ECC handling (with both syndrome and normal ECC scheme)
> > 
> > If you want support for advanced features you can find it on my github
> > repo [1]:
> >  - HW randomization support
> >  - per partition ECC/Randomizer to handle bootloader partitions
> > 
> > DMA transfers are not supported yet, but I have reworked the OOB layout
> > when using the HW ECC scheme to match the one used when accessing the NAND
> > with DMA transfers (the available OOB bytes are placed at the end of the
> > OOB area).
> > 
> > This patch series depends on this other one [2] which adds support for ONFI
> > timing mode retrieval on non-ONFI NANDs.
> 
> Were you planning to send v2 of your series [2]? I see you made a
> mistake you were planning on fixing:
> 
>   https://lkml.org/lkml/2014/7/30/423

Yep, I was just waiting for your feedback before fixing it ;-).

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
