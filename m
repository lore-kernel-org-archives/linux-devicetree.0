From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 04/11] drm: sun4i: add support for H3's TCON0/1
Date: Wed, 07 Jun 2017 22:21:02 +0800
Message-ID: <4CD8A3BB-965C-4C74-884C-ACE8AAF9989B@aosc.io>
References: <20170604160149.30230-1-icenowy@aosc.io> <20170604160149.30230-5-icenowy@aosc.io> <3642057.oKT9kIlu8M@jernej-laptop> <493AC6F2-3CB3-48F5-9568-A34AA927238F@aosc.io> <20170607094343.qqiwnu2mhmoi6jn7@flea.lan> <52F9F9C7-9A9C-435D-A0AF-FDD4317DAD69@aosc.io> <20170607141957.akonr7hmuwpt7hlt@flea.lan>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBXMX4DEQKGQEO64E35I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170607141957.akonr7hmuwpt7hlt-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B46=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8810:=
19:57, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>On Wed, Jun 07, 2017 at 05:44:56PM +0800, Icenowy Zheng wrote:
>> =E4=BA=8E 2017=E5=B9=B46=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
5:43:43, Maxime Ripard
><maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>> >On Mon, Jun 05, 2017 at 03:03:47AM +0800, Icenowy Zheng wrote:
>> >> >You should also expand function sun4i_drv_node_is_tcon() at
>> >sun4i_drv.c
>> >> >with=20
>> >> >new entries, but I'm not sure if this fits in this patch.
>> >>=20
>> >> Instead I think it should be renamed to something like
>> >> "sun4i_drv_node_is_tcon_with_ch0".
>> >
>> >I'm not sure, or at least, it shouldn't make any difference, since
>> >TCON without a channel 0 will not have an endpoint 0, so this will
>be
>> >dealt with already.
>>=20
>> But that will prevent new coders from add CH1-less TCON
>> compatibles to this function.
>
>Why? We already have such TCONs (like the A33's, or V3S') in that
>function.

Sorry, CH0-less.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
