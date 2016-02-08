From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: keystone: Create new binding for K2G SoC
Date: Mon, 8 Feb 2016 10:11:31 -0600
Message-ID: <20160208161131.GA20324@rob-hp-laptop>
References: <1454455517-7360-1-git-send-email-fcooper@ti.com>
 <1454455517-7360-2-git-send-email-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454455517-7360-2-git-send-email-fcooper-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Cc: nm-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 02, 2016 at 05:25:15PM -0600, Franklin S Cooper Jr wrote:
> From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
> 
> K2G SoC family is the newest version of the Keystone family of processors.
> 
> The technical reference manual for K2G can be found here:
> http://www.ti.com/lit/ug/spruhy8/spruhy8.pdf
> 
> Add new bindings for K2G and the K2G evm. Also document these new bindings.
> 
> Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/keystone/keystone.txt | 5 +++++
>  arch/arm/mach-keystone/keystone.c                           | 1 +
>  2 files changed, 6 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
