From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH 2/6] ARM: sun8i: r40: add USB host port nodes for R40
Date: Mon, 16 Oct 2017 17:39:58 +0800
Message-ID: <7ee77556174b84846a59d57525ec1cb9@aosc.io>
References: <20171008042906.46779-1-icenowy@aosc.io>
 <20171008042906.46779-3-icenowy@aosc.io>
 <20171009210340.ak6wo3vqnwj4gom4@flea.home>
 <55B35500-67FC-40AA-9A07-98C843DE55B3@aosc.io>
 <20171016093229.waizww2n4gwn4qpw@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171016093229.waizww2n4gwn4qpw-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-10-16 17:32，Maxime Ripard 写道：
> On Tue, Oct 10, 2017 at 07:24:28AM +0800, Icenowy Zheng wrote:
>> >> +			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
>> >> +			clocks = <&ccu CLK_BUS_OHCI1>,
>> >> +				 <&ccu CLK_BUS_EHCI1>,
>> >> +				 <&ccu CLK_USB_OHCI1>;
>> >> +			resets = <&ccu RST_BUS_OHCI1>,
>> >> +				 <&ccu RST_BUS_EHCI1>;
>> >
>> >Why do you need to take the OHCI resources too?
>> 
>> AW's strange design -- without OHCI resources taken EHCI
>> won't work.
> 
> How has this been tested?

As EHCI is probed before OHCI, this behavior is easy to
appear if the OHCI resources are removed.

> 
> Thanks!
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
