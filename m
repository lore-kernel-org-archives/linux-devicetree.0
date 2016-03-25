From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] phy: rockchip-dp: should be a child device of the
 GRF
Date: Fri, 25 Mar 2016 09:51:01 -0500
Message-ID: <20160325145101.GA31747@rob-hp-laptop>
References: <1458854943-17388-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458854943-17388-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 24, 2016 at 10:29:01PM +0100, Heiko Stuebner wrote:
> The displayport-phy is fully enclosed in the general register files (GRF).
> Therefore as seen from the device-tree it shouldn't be a separate platform-
> device but instead a sub-device of the GRF - using the simply-mfd mechanism.
> 
> The driver entered the kernel in the current merge-window, so we can still
> adapt the binding without needing a fallback, as the binding hasn't been
> released with a full kernel yet.
> 
> While the edp phy is fully part of the GRF, it doesn't have any separate
> register set there, so doesn't get any register-area assigned.
> 
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
> While one of my intermediate versions did include that conversion
> already, it looks like it was lost when the dp-phy got split out into
> its own series and I missed that dropped change.
> 
> As mentioned in the patch description above, this is meant as a fixup for
> kernel 4.6.
> 
>  .../devicetree/bindings/phy/rockchip-dp-phy.txt        | 18 +++++++++++-------
>  drivers/phy/phy-rockchip-dp.c                          |  7 +++++--
>  2 files changed, 16 insertions(+), 9 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
