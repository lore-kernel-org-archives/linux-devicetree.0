From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM64: dts: rockchip: enable eMMC for rk3399 EVB
Date: Thu, 12 May 2016 00:36:20 +0200
Message-ID: <8868581.lJFUogXGzy@phil>
References: <1462924975-69072-1-git-send-email-briannorris@chromium.org> <4355979.JCGxOmTVBW@phil> <20160511223233.GB65449@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160511223233.GB65449-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 11. Mai 2016, 15:32:33 schrieb Brian Norris:
> On Wed, May 11, 2016 at 04:51:58PM +0200, Heiko Stuebner wrote:
> > Hi Brian,
> > 
> > Am Dienstag, 10. Mai 2016, 17:02:55 schrieb Brian Norris:
> > > The 'mmc-hs400-enhanced-strobe' property has been acked by Rob
> > > Herring,
> > > though it's still not merged.
> > 
> > The commit message should describe the actual change not the volatile
> > environment surrounding it :-) .
> > 
> > When I apply this patch the property-binding will have made it into a
> > maintainer-tree so is not valid anymore then. That is more material for
> > the "comment-section" below the "---"
> 
> Of course. I think I just felt guilty without a commit message :)

I really prefer a (even simple) message being there - although I'm not as 
strict as Greg and Felipe ;-) , and in cases like this I think something 
like "enable the newly added emmc node on the rk3399 evaluation board" 
should be sufficient.


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
