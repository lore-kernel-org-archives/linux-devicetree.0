From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH 1/3] arm64: allwinner: a64: add ethernet0 alias for BPi M64 EMAC node
Date: Thu, 10 Aug 2017 12:40:26 +0800
Message-ID: <660391B7-FD1B-44BC-98AF-4CA99DCEBB0B@aosc.io>
References: <20170722022852.7868-1-icenowy@aosc.io> <20170722022852.7868-2-icenowy@aosc.io> <CAGb2v64DVdFU37V422KfT5zUFN7c6dXyLFBukZegbAuUKZmJBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v64DVdFU37V422KfT5zUFN7c6dXyLFBukZegbAuUKZmJBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wens-jdAy2FN1RRM@public.gmane.orgChen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



于 2017年8月10日 GMT+08:00 上午11:56:02, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> 写到:
>Hi,
>
>On Sat, Jul 22, 2017 at 10:28 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>wrote:
>> The Banana Pi M64 board uses the A64 chip's EMAC to provide Ethernet
>> link.
>>
>> Add the ethernet0 alias in the device tree, in order to let U-Boot
>> generate a MAC address from the chip's SID.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>
>As mentioned in the discussion of the cover letter of this series,
>we'd really like to move this to fixes for 4.13.
>
>I'd like to move forward on this soon. Can I just do a wholesale
>rewrite of the commit message along the lines of the following
>example, and move the 3 patches to fixes for 4.13?

Yes.

Thanks!

>
>arm64: allwinner: a64: bananapi-m64: add missing ethernet0 alias
>
>The EMAC Ethernet controller was enabled, but an accompanying alias
>was not added. This results in unstable numbering if other Ethernet
>devices, such as a USB dongle, are present. Also, the bootloader uses
>the alias to assign a generated stable MAC address to the device node.
>
>Fixes: e7295499903d ("arm64: allwinner: bananapi-m64: Enable
>dwmac-sun8i")
>
>
>Thanks
>ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
