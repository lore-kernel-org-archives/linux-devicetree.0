From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 3/4] ARM: l2x0: add arm,ecc-enable property for aurora
Date: Fri, 9 Jun 2017 11:29:41 -0500
Message-ID: <20170609162941.hlrkfqm7jfxtzzuu@rob-hp-laptop>
References: <20170608041124.4624-1-chris.packham@alliedtelesis.co.nz>
 <20170608041124.4624-4-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170608041124.4624-4-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 08, 2017 at 04:11:23PM +1200, Chris Packham wrote:
> The aurora cache on the Marvell Armada-XP SoC supports ECC protection
> for the L2 data arrays. Add a "arm,ecc-enable" device tree property
> which can be used to enable this.
> 
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/l2c2x0.txt | 2 ++
>  arch/arm/mm/cache-l2x0.c                         | 7 +++++++
>  2 files changed, 9 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
