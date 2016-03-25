From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] phy: rockchip-emmc: adapt binding to specifiy
 register offset and length
Date: Fri, 25 Mar 2016 09:53:13 -0500
Message-ID: <20160325145313.GA506@rob-hp-laptop>
References: <1458854943-17388-1-git-send-email-heiko@sntech.de>
 <1458854943-17388-3-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458854943-17388-3-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 24, 2016 at 10:29:03PM +0100, Heiko Stuebner wrote:
> The emmc-phy occupies a contiguous set of 8 registers inside the general
> register files, so the reg property should specify this.
> 
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
> This is essential a counter argument for Shawn's move from reg to reg_offset
> in "phy: rockchip-emmc: fix compile issue on arm64 platform" [0].
> With the move under the grf we now also are able to specify this stuff
> cleanly using already present mechanisms.
> 
> Also meant to v4.6-rc before the binding solidifies.
> 
> 
> [0] https://lkml.org/lkml/2016/3/8/114
> 
>  Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
