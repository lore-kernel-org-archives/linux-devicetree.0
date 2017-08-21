From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH] ARM: sun8i: a33: add dts for Q8 tablets with different
 resolution
Date: Mon, 21 Aug 2017 16:44:30 +0800
Message-ID: <4a0a72b4679db296a8e48512c41a2ce5@aosc.io>
References: <20170817074926.3410-1-icenowy@aosc.io>
 <20170821084053.s4qmhlvgsmckmqgh@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170821084053.s4qmhlvgsmckmqgh-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-08-21 16:40，Maxime Ripard 写道：
> On Thu, Aug 17, 2017 at 03:49:26PM +0800, Icenowy Zheng wrote:
>> Q8 tablets with Allwinner A33 SoC now come with two kind of LCD, 
>> either
>> 800x480 or 1024x600.
>> 
>> In order for sun4i-drm to be able to choose correct LCD configuration,
>> two different device trees should be present, one for a resolution.
>> 
>> Add stub device trees for two resolutions.
>> 
>> As the sun4i-drm driver still has some problems to support the LCDs, 
>> the
>> real LCD device nodes are not added to the device tree files.
>> 
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> 
> This should be an overlay, ideally applied by the bootloader.

I think this is not suitable for overlay.

The two kind of Q8 tablets are not compatible at all, and they
should both have a suitable device tree. The old DT without
resolution is only kept for backward compatibility.

> 
> Maxime
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
