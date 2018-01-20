From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 2/9] ARM: sunxi: add Allwinner ARMv5 SoCs
Date: Sat, 20 Jan 2018 14:22:06 +1100
Message-ID: <CAGRGNgUj47nyf2dkgdk1bT2kO1p5oP8nk5LQ4EpCya2dfK=uMg@mail.gmail.com>
References: <20180119231735.61504-1-icenowy@aosc.io> <20180119231735.61504-3-icenowy@aosc.io>
 <CAGRGNgUjvvzseAtUuiy5xCaZrLw2Jq4+A_dPXR9r_Xs-yYL1cw@mail.gmail.com> <76DC4CD7-4A07-40C7-80A8-1C2D177E8109@aosc.io>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQIP76OUQLBB5HLRLJQKGQEVQS3LIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <76DC4CD7-4A07-40C7-80A8-1C2D177E8109-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Icenowy,

On Sat, Jan 20, 2018 at 2:10 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
>
> =E4=BA=8E 2018=E5=B9=B41=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
11:06:40, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =E5=86=99=E5=88=B0:
>>Hi Icenowy,
>>
>>On Sat, Jan 20, 2018 at 10:17 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>wrote:
>>> Add option for Allwinner ARMv5 SoCs and a SoC suniv (which is a die
>>used
>>> for many new F-series products, including F1C100A, F1C100s, F1C200s,
>>> F1C500, F1C600).
>>>
>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>> ---
>>>  arch/arm/mach-sunxi/Kconfig    | 13 +++++++++++++
>>>  arch/arm/mach-sunxi/Makefile   |  1 +
>>>  arch/arm/mach-sunxi/sunxi_v5.c | 22 ++++++++++++++++++++++
>>>  3 files changed, 36 insertions(+)
>>>  create mode 100644 arch/arm/mach-sunxi/sunxi_v5.c
>>>
>>> diff --git a/arch/arm/mach-sunxi/Kconfig
>>b/arch/arm/mach-sunxi/Kconfig
>>> index 65509a35935f..78ac9ce70641 100644
>>> --- a/arch/arm/mach-sunxi/Kconfig
>>> +++ b/arch/arm/mach-sunxi/Kconfig
>>> @@ -59,3 +59,16 @@ config MACH_SUN9I
>>>         select ARM_GIC
>>>
>>>  endif
>>> +
>>> +menuconfig ARCH_SUNXI_V5
>>> +       bool "Allwinner SoCs"
>>
>>That name seems a little too generic. Maybe "Allwinner ARMv5 SoCs"?
>
> This is already required by armv5.
>
> Allwinner currently has only ARMv5,7,8 SoCs. ARMv8 is under
> arm64 architecture, and ARMv5 and v7 cannot be selected at the same time.

I'm going to try to back my way out of this hole by saying that they
should be more descriptive anyway (and it'll give clueless kconfiggers
a hint as to why they're not seeing their SoC listed)

However you're right, if both cannot be visible at the same time, then
it really doesn't matter if they both have the same name.

Sorry for the noise,

--=20
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
