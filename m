From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Thu, 17 Jul 2014 12:21:56 +0200
Message-ID: <5456516.0fVZeXjF8k@wuerfel>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com> <22032517.gk8PRUMaIU@wuerfel> <93903d5fdf85427bb8a418894540c122@BN1PR0301MB0772.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <93903d5fdf85427bb8a418894540c122-RQSpjbwlmjS6oBnG8T5U3ZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Antoine =?ISO-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 17 July 2014 01:20:54 Peter Chen wrote:
> Thanks, arnd.
> 
> For chipidea generic glue layer case, if there are three devices who use this
> driver, and all devices have 32-bit bus, some devices have less 32 address lines.
> For example:
> 
> - the device_a doesn't need to use dma_mask
> - the device_b needs dma_mask as 0xfffffffff
> - the device_c needs dma_mask as 0xfffffff0, assume it has only 28 address lines

This makes no sense. You always need a dma mask, so the first case doesn't exist,
and the second one is the default.

In the third case, I assume you mean 0x0fffffff, which is a 28-bit mask.

> My questions are:
> - Can we not set dma_mask at driver, and only set dma-ranges at dts for device_b
> and device_c as a solution to cover this different dma mask use case?

try to understand my earlier reply. What is the problem with device_b?
Is that a limitation of the bus it is connected to, or the version of the
chipidea hardware?

> - If we can't use this solution, would you suggest one?

It depends on what the requirement of the hardware is, as I explained
now for three times.

> - If we can use this solution, for device_b and device_c, how can we write dma-ranges?
> I can't find any arm platforms use it, only some powerpc platform use it.
> According to the definition from Power_ePAPR_APPROVED_v1.1.pdf, it is
> dma-ranges = <child-bus-address, parent-bus-address, length>
> but I find the powerpc has different way for using dma-ranges. 

It's now handled by of_dma_configure() in drivers/of/platform.c for all
architectures.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
