From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: fix ordering in Armada 370 .dtsi
Date: Mon, 17 Nov 2014 10:49:15 +0100
Message-ID: <20141117104915.0c16e554@free-electrons.com>
References: <1415993776-3469-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<20141114202200.GI2001@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141114202200.GI2001-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Andrew Lunn,

On Fri, 14 Nov 2014 21:22:00 +0100, Andrew Lunn wrote:

> Humm.
> 
> Now we have things in the right order, we see that the
> system-controller and the clock-gating-controller overlap.
> 
> I know the HW engineers have gone a bit crazy around here, so maybe we
> have no choice?

Not nice indeed. All those "system-level" registers that do not belong
to clearly identified hardware blocks are really a mess. Maybe it's
time to use the 'syscon' infrastructure to deal with those registers?

Unfortunately, due to the major pain caused by DT backward
compatibility, switching completely and properly to syscon is probably
going to be difficult if we don't want to break old Device Tree files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
