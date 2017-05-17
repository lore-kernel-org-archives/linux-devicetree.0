From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v8 0/9] Initial Allwinner Display Engine 2.0 Support
Date: Thu, 18 May 2017 01:39:12 +0800
Message-ID: <06245ECF-0A04-480C-B3CE-F670A312A646@aosc.io>
References: <20170517144725.3463-1-icenowy@aosc.io> <20170517173739.c7mxj6gr2buhaoes@flea.home>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBSUV6LEAKGQEXGYDKMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170517173739.c7mxj6gr2buhaoes-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B45=E6=9C=8818=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881:=
37:39, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>On Wed, May 17, 2017 at 10:47:16PM +0800, Icenowy Zheng wrote:
>> This patchset is the initial patchset for Allwinner DE2 support.
>>=20
>> As the DE2 CCU support is already applied, this patchset now contains
>> only DRM changes and device tree changes.=20
>>=20
>> The SoC used to develop this patchset is V3s, as V3s is the simplest
>> one of the SoCs that have DE2.
>>=20
>> (Allwinner V3s features only one mixer, and its only video output is
>> RGB LCD, which is already supported in our TCON driver)
>>=20
>> The last patch is only a testing patch, it shouldn't be merged; and
>> for the patch to be really usable, the RFC fix of the TCON driver [1]
>> is needed.
>>=20
>> No HDMI, TV encoder or other internal bridges' support is included
>> in this patchset, which makes it currently not usable on H3.
>>=20
>> Thanks to Jean-Francois Moine and Jernej Skrabec for their efforts
>> to discover the internal of DE2!
>>=20
>> [1]
>https://lists.freedesktop.org/archives/dri-devel/2016-December/126264.html
>>=20
>> Icenowy Zheng (9):
>>   drm/sun4i: abstract a engine type
>>   drm/sun4i: add a dedicated module for sun4i-backend and sun4i-layer
>>   drm/sun4i: add a Kconfig option for sun4i-backend
>>   drm/sun4i: add support for Allwinner DE2 mixers
>>   drm/sun4i: Add compatible string for V3s display engine
>>   drm/sun4i: tcon: add support for V3s TCON
>
>Applied all those patches...
>
>>   ARM: sun8i: v3s: add device nodes for DE2 display pipeline
>
>But this one doesn't apply. Please rebase and resend.

OK. Will rebase it once all these patches entered linux-next.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
