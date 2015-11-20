From: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v12 0/3] Mediatek xHCI support
Date: Fri, 20 Nov 2015 13:20:49 +0200
Message-ID: <564F0211.3090605@intel.com>
References: <1447751921-26746-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447751921-26746-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17.11.2015 11:18, Chunfeng Yun wrote:
>  From 577f68d9c0ca1531d5f9cae0dcbea2ba116c8551 Mon Sep 17 00:00:00 2001
> From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Date: Tue, 17 Nov 2015 17:09:05 +0800
> Subject: [PATCH v12 0/3] Mediatek xHCI support
>
> The patch supports MediaTek's xHCI controller.
>
> There are some differences from xHCI spec:
> 1. The interval is specified in 250 * 8ns increments for Interrupt Moderation
> Interval(IMODI) of the Interrupter Moderation(IMOD) register, it is 8 times as
> much as that defined in xHCI spec.
>
> 2. For the value of TD Size in Normal TRB, MTK's xHCI controller defines a
> number of packets that remain to be transferred for a TD after processing all
> Max packets in all previous TRBs,that means don't include the current TRB's,
> but in xHCI spec it includes the current ones.
>
> 3. To minimize the scheduling effort for synchronous endpoints in xHC, the MTK
> architecture defines some extra SW scheduling parameters for HW. According to
> these parameters provided by SW, the xHC can easily decide whether a
> synchronous endpoint should be scheduled in a specific uFrame. The extra SW
> scheduling parameters are put into reserved DWs in Slot and Endpoint Context.
> And a bandwidth scheduler algorithm is added to support such feature.
>
> A usb3.0 phy driver is also added which used by mt65xx SoCs platform, it
> supports two usb2.0 ports and one usb3.0 port.
>

Added to my tree, I'll send it forward to Greg shortly

Fixed the documentation "wakeup_deb_p0" -> "wakeup_deb_p1" typo as well

-Mathias  

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
