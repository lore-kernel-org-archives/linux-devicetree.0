From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 0/4] Patches to fix remote wakeup on rk3288 dwc2 "host" port
Date: Sat, 24 Oct 2015 14:26:21 +0200
Message-ID: <1633226.9pFzvpSks6@diego>
References: <1445624891-31680-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445624891-31680-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 23. Oktober 2015, 11:28:07 schrieb Douglas Anderson:
> The "host1" port (AKA the dwc2 port that isn't the OTG port) on rk3288
> has a hardware errata that causes everything to get confused when we get
> a remote wakeup.  It appears that the "port reset" bit that's in the USB
> phy (located in the rk3288 GRF) fixes things up and appears safe to do.
> 
> This series of patches exports the "port reset" from the PHY and then
> hooks it up to dwc2 through a quirk.
> 
> I've tested this series atop a bit of a conglomeration of Heiko's github
> "somewhat stable" branch (v4.3-rc3-876-g6509232) but with Greg KH's
> usb-next merged in.

I've been involved in the earlier revisions already, so this version already 
implements the review-comments I had. I've also gave this a spin on 4.3-rc6 
with usb-next merged in on a rk3288-firefly, so

Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>


If the first two patches get picked up, I'll pick the two dts patches 
afterwards.


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
