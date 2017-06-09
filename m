From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH v2 01/11] dt-bindings: update the
 binding for Allwinner H3 TVE support
Date: Sat, 10 Jun 2017 00:51:02 +0800
Message-ID: <53E8FC74-8AC0-461A-B875-812EE4A3267E@aosc.io>
References: <20170604160149.30230-1-icenowy@aosc.io> <20170604160149.30230-2-icenowy@aosc.io> <20170607084544.kgclybyxxttfk3ko@flea.lan> <092D4797-0034-4C39-A30A-92CFAB23AAF8@aosc.io> <20170609164915.enap3epreg5vr2gy@flea.home>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBAFE5PEQKGQECOWSFZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170609164915.enap3epreg5vr2gy-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.orgMaxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B46=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=8812=
:49:15, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0=
:
>On Wed, Jun 07, 2017 at 04:48:50PM +0800, Icenowy Zheng wrote:
>> >> @@ -189,6 +211,8 @@ supported.
>> >>  Required properties:
>> >>    - compatible: value must be one of:
>> >>      * allwinner,sun8i-v3s-de2-mixer
>> >> +    * allwinner,sun8i-h3-de2-mixer0
>> >> +    * allwinner,sun8i-h3-de2-mixer1
>> >
>> >Again, please explain why we need to have different compatibles
>> >here. If it's only about the number of planes, this should be dealt
>> >with a property, not a compatible.
>>=20
>> Only mixer0 has "VEP" and write-back support, at least on H3.
>
>What is that VEP? writeback support can also be expressed by a
>property.

I don't know what VEP is...

But we are really facing different cores, like sun50i-a64-mmc
and sun50i-a64-emmc.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
