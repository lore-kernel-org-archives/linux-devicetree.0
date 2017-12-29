From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH] ARM: dts: sun8i: fix USB Ethernet of Orange Pi R1
Date: Fri, 29 Dec 2017 16:56:16 +0800
Message-ID: <511FDCF7-4B8D-4270-8E51-FF723AF07082@aosc.io>
References: <20171228140538.14388-1-icenowy@aosc.io> <CAGb2v679BdkA=4hzsTiHXwqdSop+dFDTePqmd_eNSMQR+gq9fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v679BdkA=4hzsTiHXwqdSop+dFDTePqmd_eNSMQR+gq9fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



于 2017年12月29日 GMT+08:00 下午4:55:34, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> 写到:
>On Thu, Dec 28, 2017 at 10:05 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>wrote:
>> Orange Pi R1 uses a Realtek RTL8152B USB Ethernet chip, which is
>easily
>> seen on the board but not show in the schematics. A regulator for the
>> power of the RTL8152B chip is hidden, which uses the same pin with
>the
>> Wi-Fi regulator on the original Orange Pi Zero.
>>
>> Add this regulator back to the device tree, and bind it to USB1.
>>
>> Tested-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>
>Applied. There is no guarantee this will make it into 4.16-rc1. If not,
>this will be sent later on as a fix for 4.16.

Because of New Year?

>
>ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
