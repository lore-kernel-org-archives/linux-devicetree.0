From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 01/10] dt-bindings: fix the binding of Allwinner DE2
 CCU of A83T and H3
Date: Wed, 1 Nov 2017 16:12:58 -0500
Message-ID: <20171101211258.m7lk4s2glhxhs7el@rob-hp-laptop>
References: <20171027150658.18509-1-icenowy@aosc.io>
 <20171027150658.18509-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171027150658.18509-2-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 27, 2017 at 11:06:49PM +0800, Icenowy Zheng wrote:
> The DE2 CCU is different on A83T and H3 -- the parent of the clocks on
> A83T is PLL_DE but on H3 it's the DE module clock. This is not noticed
> when I develop the DE2 CCU driver.
> 
> Fix the binding by using different compatibles for A83T and H3, adding
> notes for the PLL_DE usage on A83T, and change the binding example's
> compatible from A83T to H3 (as it specifies the DE module clock).
> 
> Fixes: ed74f8a8a679 ("dt-bindings: add binding for the Allwinner DE2 CCU")
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/sun8i-de2.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
