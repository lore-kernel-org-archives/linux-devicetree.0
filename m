From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH 1/2] dt-bindings: add binding for A64 DE2 CCU with SRAM
 section
Date: Mon, 16 Oct 2017 17:41:10 +0800
Message-ID: <d62ac8b8ff9073b886ceaa9ce54e6903@aosc.io>
References: <20171014122925.13220-1-icenowy@aosc.io>
 <20171016091136.b4rnckh2tfi26shx@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171016091136.b4rnckh2tfi26shx-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-10-16 17:11，Maxime Ripard 写道：
> On Sat, Oct 14, 2017 at 08:29:24PM +0800, Icenowy Zheng wrote:
>> A64's Display Engine 2.0 needs a section of SRAM (SRAM C) to be 
>> claimed.
> 
> Why?

Allwinner didn't document this, but if the SRAM is not claimed, the
DE2 MMIO zone is totally not accessible.

It seems that Allwinner uses the SRAM C in the DE2 internally.

> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
