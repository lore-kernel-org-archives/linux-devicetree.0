From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: allwinner: a64: Add device node for DMA
 controller
Date: Mon, 11 Sep 2017 17:00:59 -0500
Message-ID: <20170911220059.qzokhgdsykkgrllq@rob-hp-laptop>
References: <20170830233609.13855-1-stefan.bruens@rwth-aachen.de>
 <20170830233609.13855-3-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170830233609.13855-3-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 31, 2017 at 01:36:08AM +0200, Stefan Brüns wrote:
> The A64 SoC has a DMA controller that supports 8 DMA channels
> to and from various peripherals.
> 
> Add a device node for it.
> 
> Signed-off-by: Stefan Brüns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/dma/sun6i-dma.txt | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi       | 9 +++++++++
>  2 files changed, 10 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
