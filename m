From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] nvmem: sunxi-sid: add support for A64/H5's SID controller
Date: Thu, 21 Sep 2017 18:12:40 -0500
Message-ID: <20170921231240.tsoapk6zlwcysiud@rob-hp-laptop>
References: <20170918154204.54427-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170918154204.54427-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 18, 2017 at 11:42:04PM +0800, Icenowy Zheng wrote:
> Allwinner A64/H5 SoCs come with a SID controller like the one in H3, but
> without the silicon bug that makes the initial value at 0x200 wrong, so
> the value at 0x200 can be directly read.
> 
> Add support for this kind of SID controller.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt | 1 +
>  drivers/nvmem/sunxi_sid.c                                       | 6 ++++++
>  2 files changed, 7 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
