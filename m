From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v4 3/8] phy: sun4i-usb: add PHYCTL offset
 for H3 SoC
Date: Fri, 24 Mar 2017 14:55:44 +0800
Message-ID: <CAGb2v64DgFdmHiJ1r4NJR6Ck5ny1Mik_XhTEd_7=XMyptrD2uA@mail.gmail.com>
References: <20170319161951.55834-1-icenowy@aosc.xyz> <20170319161951.55834-4-icenowy@aosc.xyz>
 <CAGb2v65NHgDDPGChR4rg28NS1tuj2RZ9ERrQz2cSa_haZLypXA@mail.gmail.com> <1157651490336844@web12m.yandex.ru>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBCMG2PDAKGQEFCJCR6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1157651490336844-slj663OZ0j5xpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 2:27 PM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
>
>
> 24.03.2017, 11:05, "Chen-Yu Tsai" <wens-jdAy2FN1RRM@public.gmane.org>:
>> On Mon, Mar 20, 2017 at 12:19 AM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
>>>  The config structure of H3 in phy-sun4i-usb driver have the PHYCTL
>>>  register offset missing.
>>>
>>>  Add it. Because it's a SoC after A33, its PHYCTL offset should be 0x10.
>>
>> You are implying that all SoCs after A33 have PHYCTL at 0x10.
>>
>> This is not true. As the A83T, which was released after the A33, has
>> PHYCTL at the old offset.
>
> No, in Allwinner's BSP A83T is using also PHYCTL at 0x10.
>
> The code in linux-3.4/drivers/usb/sunxi_usb/include/sunxi_usb_bsp.c is
> ```
> #if defined (CONFIG_ARCH_SUN8IW5) || defined (CONFIG_ARCH_SUN8IW6) || defined (CONFIG_ARCH_SUN8IW9) || defined (CONFIG_ARCH_SUN8IW8) || defined (CONFIG_ARCH_SUN8IW7)
> #define  USBPHYC_REG_o_PHYCTL               0x0410
> #else
> #define  USBPHYC_REG_o_PHYCTL               0x0404
> #endif
> ```
>
> In linux-3.10/drivers/usb/sunxi_usb/include/sunxi_usb_bsp.c is
> ```
> #if defined (CONFIG_ARCH_SUN50I) || defined (CONFIG_ARCH_SUN8IW10) || defined (CONFIG_ARCH_SUN8IW11)
> #define  USBPHYC_REG_o_PHYCTL               0x0410
> #else
> #define  USBPHYC_REG_o_PHYCTL               0x0404
> #endif
> ```
>
> So sun50i* and sun50iw5~w11 all use PHYCTL at 0x10.
>

Seems you are right. However I think it's best to not assume or infer
anything. Who knows, Allwinner might re-release some old SoC under a
different under a different name again.

Just state the facts: H3 has its PHYCTL at 0x10.

ChenYu

>>
>> Just state that H3 has PHYCTL at 0x10.
>>
>> ChenYu
>>
>>>  Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>>>  ---
>>>  New patch in v4.
>>>
>>>   drivers/phy/phy-sun4i-usb.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>>  diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
>>>  index 62b4d25448c6..a650f283f6ff 100644
>>>  --- a/drivers/phy/phy-sun4i-usb.c
>>>  +++ b/drivers/phy/phy-sun4i-usb.c
>>>  @@ -821,6 +821,7 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
>>>          .num_phys = 4,
>>>          .type = sun8i_h3_phy,
>>>          .disc_thresh = 3,
>>>  + .phyctl_offset = REG_PHYCTL_A33,
>>>          .dedicated_clocks = true,
>>>          .enable_pmu_unk1 = true,
>>>   };
>>>  --
>>>  2.12.0
>>>
>>>  --
>>>  You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
>>>  To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>>>  For more options, visit https://groups.google.com/d/optout.
>>
>> --
>> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
