From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 01/11] dt-bindings: add binding for the
 Allwinner DE2 CCU
Date: Fri, 28 Apr 2017 12:52:57 -0500
Message-ID: <20170428175257.iob2i33fjfyrg7cv@rob-hp-laptop>
References: <20170423103754.50012-1-icenowy@aosc.io>
 <20170423103754.50012-2-icenowy@aosc.io>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERB7ECR3EAKGQEE3EFLPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170423103754.50012-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 23, 2017 at 06:37:44PM +0800, Icenowy Zheng wrote:
> Allwinner "Display Engine 2.0" contains some clock controls in it.
> 
> In order to add them as clock drivers, we need a device tree binding.
> Add the binding here.
> 
> Also add the device tree binding headers.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v5:
> - Moved dt-binding headers here.
> - Changed dt-binding headers' license header to SPDX license.
> Changes in v4:
> - Dropped the leading 0 in clock at 1000000 .
> Changes in v3:
> - Fill the address space length of DE2 CCU to 0x100000, just reach the start of mixer0.
> 
>  .../devicetree/bindings/clock/sun8i-de2.txt        | 31 ++++++++++++++++++++++
>  include/dt-bindings/clock/sun8i-de2.h              | 18 +++++++++++++
>  include/dt-bindings/reset/sun8i-de2.h              | 14 ++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt
>  create mode 100644 include/dt-bindings/clock/sun8i-de2.h
>  create mode 100644 include/dt-bindings/reset/sun8i-de2.h

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
