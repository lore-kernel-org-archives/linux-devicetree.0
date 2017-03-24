From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v4 3/8] phy: sun4i-usb: add PHYCTL offset
 for H3 SoC
Date: Fri, 24 Mar 2017 14:27:24 +0800
Message-ID: <1157651490336844@web12m.yandex.ru>
References: <20170319161951.55834-1-icenowy@aosc.xyz> <20170319161951.55834-4-icenowy@aosc.xyz> <CAGb2v65NHgDDPGChR4rg28NS1tuj2RZ9ERrQz2cSa_haZLypXA@mail.gmail.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBT7Y2LDAKGQEJSAOU2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v65NHgDDPGChR4rg28NS1tuj2RZ9ERrQz2cSa_haZLypXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



24.03.2017, 11:05, "Chen-Yu Tsai" <wens-jdAy2FN1RRM@public.gmane.org>:
> On Mon, Mar 20, 2017 at 12:19 AM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
>> =C2=A0The config structure of H3 in phy-sun4i-usb driver have the PHYCTL
>> =C2=A0register offset missing.
>>
>> =C2=A0Add it. Because it's a SoC after A33, its PHYCTL offset should be =
0x10.
>
> You are implying that all SoCs after A33 have PHYCTL at 0x10.
>
> This is not true. As the A83T, which was released after the A33, has
> PHYCTL at the old offset.

No, in Allwinner's BSP A83T is using also PHYCTL at 0x10.

The code in linux-3.4/drivers/usb/sunxi_usb/include/sunxi_usb_bsp.c is
```
#if defined (CONFIG_ARCH_SUN8IW5) || defined (CONFIG_ARCH_SUN8IW6) || defin=
ed (CONFIG_ARCH_SUN8IW9) || defined (CONFIG_ARCH_SUN8IW8) || defined (CONFI=
G_ARCH_SUN8IW7)
#define  USBPHYC_REG_o_PHYCTL		    0x0410
#else
#define  USBPHYC_REG_o_PHYCTL		    0x0404
#endif
```

In linux-3.10/drivers/usb/sunxi_usb/include/sunxi_usb_bsp.c is
```
#if defined (CONFIG_ARCH_SUN50I) || defined (CONFIG_ARCH_SUN8IW10) || defin=
ed (CONFIG_ARCH_SUN8IW11)
#define  USBPHYC_REG_o_PHYCTL		    0x0410
#else
#define  USBPHYC_REG_o_PHYCTL		    0x0404
#endif
```

So sun50i* and sun50iw5~w11 all use PHYCTL at 0x10.

>
> Just state that H3 has PHYCTL at 0x10.
>
> ChenYu
>
>> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> =C2=A0---
>> =C2=A0New patch in v4.
>>
>> =C2=A0=C2=A0drivers/phy/phy-sun4i-usb.c | 1 +
>> =C2=A0=C2=A01 file changed, 1 insertion(+)
>>
>> =C2=A0diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-u=
sb.c
>> =C2=A0index 62b4d25448c6..a650f283f6ff 100644
>> =C2=A0--- a/drivers/phy/phy-sun4i-usb.c
>> =C2=A0+++ b/drivers/phy/phy-sun4i-usb.c
>> =C2=A0@@ -821,6 +821,7 @@ static const struct sun4i_usb_phy_cfg sun8i_h3=
_cfg =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 4,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun8i_h3=
_phy,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 3=
,
>> =C2=A0+ .phyctl_offset =3D REG_PHYCTL_A33,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.enable_pmu_unk1 =
=3D true,
>> =C2=A0=C2=A0};
>> =C2=A0--
>> =C2=A02.12.0
>>
>> =C2=A0--
>> =C2=A0You received this message because you are subscribed to the Google=
 Groups "linux-sunxi" group.
>> =C2=A0To unsubscribe from this group and stop receiving emails from it, =
send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> =C2=A0For more options, visit https://groups.google.com/d/optout.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
