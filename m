From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/4] irqchip: irq-mvebu-pic: new driver for Marvell
 Armada 7K/8K PIC
Date: Fri, 5 Aug 2016 17:58:12 +0200
Message-ID: <20160805175812.55162108@free-electrons.com>
References: <1470408921-447-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1470408921-447-3-git-send-email-thomas.petazzoni@free-electrons.com>
	<20160805153113.GW4541@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160805153113.GW4541-fahSIxCzskDQ+YiMSub0/l6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

Thanks for the quick feedback!

On Fri, 5 Aug 2016 15:31:13 +0000, Jason Cooper wrote:

> > +config MVEBU_PIC
> > +	bool  
> 
> tri-state?  Is there anything else attached to the PIC besides the PMU?

tri-state would be fine I believe, it's indeed a secondary interrupt
controller, not essential for booting the platform.

But then I probably need to rework PATCH 3/4 and not have it
unconditionally selected by the platform Kconfig option, right?

Regarding what else is attached to the PIC, I have no idea, I don't
have this information.

> > +static const struct of_device_id mvebu_pic_of_match[] = {
> > +	{ .compatible = "marvell,armada-8k-pic", },  
> 
> You mention 7k in $subject, should you use that here as the youngest
> compatible SoC generation?

There isn't anything youngest or oldest between 7K and 8K, they both
got released at the same time. They are really the same family of SoCs,
the 7K having only one CP110, the 8K having two of them, which provides
more I/Os.

For several other IPs, we're using armada-8k as the compatible string:

 * marvell,armada8k-pcie
 * marvell,armada-8k-xhci

(Yes you will already notice how consistent we are in the naming of the
compatible string :-/).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
