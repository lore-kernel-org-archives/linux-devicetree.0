From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH 0/4] Add SimpleFB support for Allwinner H3 SoC
Date: Fri, 27 Oct 2017 12:07:51 +0800
Message-ID: <239eed81945193af3af465c7ef0008ca@aosc.io>
References: <20170911155529.62891-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBGPCZLHQKGQEPQ2UURI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170911155529.62891-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-09-11 23:55=EF=BC=8CIcenowy Zheng =E5=86=99=E9=81=93=EF=BC=
=9A
> This patchset adds devicetree-side support of SimpleFB on Allwinner H3
> SoC.
>=20
> The DE2 CCU is initialized and used by the SimpleFB node, in order to
> furtherly coexist with the DRM code.
>=20
> The first patch adds pipelines for DE2 displays in simplefb-sunxi
> device tree binding.
>=20
> The second patch adds DE2 CCU device node for H3 SoC, and the skeleton
> of the node enters the H3/H5 common DTSI; the H5 support is splited
> into the third patch, as they will enter different tree.
>=20
> The fourth patch finally adds simplefb nodes, using the
> pipeline strings introduced in the first patch.
>=20
> Icenowy Zheng (4):
>   dt-bindings: simplefb-sunxi: add pipelines for DE2
>   ARM: sun8i: h3/h5: add DE2 CCU device node for H3
>   arm64: allwinner: h5: add compatible string for DE2 CCU
>   ARM: sunxi: h3/h5: add simplefb nodes

Maxime,
as the U-Boot side is applied to u-boot-video, could you take a look at=20
this
patchset?

Thanks!
Icenowy

>=20
>  .../bindings/display/simple-framebuffer-sunxi.txt  |  4 ++
>  arch/arm/boot/dts/sun8i-h3.dtsi                    |  4 ++
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi                 | 43=20
> ++++++++++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |  4 ++
>  4 files changed, 55 insertions(+)

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
