From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 14/15] ARM: dts: sun8i: h3: Enable HDMI
 output on H3 boards
Date: Sun, 25 Feb 2018 16:43:52 +0800
Message-ID: <E26547A5-F219-4310-B0E6-49AC3A700566@aosc.io>
References: <20180224214545.3740-1-jernej.skrabec@siol.net> <20180224214545.3740-15-jernej.skrabec@siol.net> <CAGRGNgWgkfax2TUSjK4397i678gXTTLh80r2HWwTB6u0GM0Cuw@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB2POZHKAKGQEFM5DLZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGRGNgWgkfax2TUSjK4397i678gXTTLh80r2HWwTB6u0GM0Cuw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B42=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884:=
11:34, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi Jernej,
>
>On Sun, Feb 25, 2018 at 8:45 AM, Jernej Skrabec
><jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
>> Enable HDMI output on all boards which have HDMI connector.
>>
>> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts    | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-beelink-x2.dts          | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dts | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts           | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-orangepi-2.dts          | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts       | 25
>++++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-orangepi-one.dts        | 24
>+++++++++++++++++++++
>>  arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts         | 25
>++++++++++++++++++++++
>>  8 files changed, 199 insertions(+)
>
>As I understand it, the H2+ is just a slightly trimmed down H3. In
>terms of HDMI support, the difference is that the H2+ can't output 4k.

H2+ can OUTPUT 4K. The BSP restricts it to DECODE 4K. (And mainline won't h=
ave such restriction)

>If this code is compatible with the H2+, could you please add the
>necessary bits and pieces to the h2-plus DTSs too?
>
>Thanks,

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
