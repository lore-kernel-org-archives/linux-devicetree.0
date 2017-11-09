From: Chris Obbard <obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH v2 00/10] Allwinner H3/H5/A64(DE2)
 SimpleFB support
Date: Thu, 9 Nov 2017 11:17:03 +0000
Message-ID: <CAP03XerMhdOYL08ED7=rt99BZ=RpXLhz_EySUhrJ4HbjYTX93g@mail.gmail.com>
References: <20171027150658.18509-1-icenowy@aosc.io> <9bca10cc95d04f87a1122bc582402310@aosc.io>
 <20171102154447.b5qo3rvu5djxupay@flea> <20171106084043.2vv56w2dmrutz4gn@phenom.ffwll.local>
Reply-To: obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="f403045f8e7e9ab21c055d8af176"
Return-path: <linux-sunxi+bncBCVP56HU4ELBB6FFSHIAKGQEP6DO3VI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171106084043.2vv56w2dmrutz4gn-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: daniel-/w4YWyX8dFk@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--f403045f8e7e9ab21c055d8af176
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

What's the status of HDMI/SimpleFB driver for H5?

I don't see anything related to HDMI in linux-next dts files:

arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  (example board)
arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
arch/arm/boot/dts/sunxi-h3-h5.dtsi

On 6 November 2017 at 08:40, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:

> On Thu, Nov 02, 2017 at 04:44:47PM +0100, Maxime Ripard wrote:
> > On Thu, Nov 02, 2017 at 04:51:29PM +0800, Icenowy Zheng wrote:
> > > =E5=9C=A8 2017-10-27 23:06=EF=BC=8CIcenowy Zheng =E5=86=99=E9=81=93=
=EF=BC=9A
> > > > This patchset adds support for the SimpleFB on Allwinner SoCs with
> > > > "Display Engine 2.0".
> > > >
> > > > PATCH 1 to PATCH 3 are DE2 CCU fixes for H3/H5 SoCs.
> > > >
> > > > PATCH 4 adds the pipeline strings for DE2 SimpleFB.
> > > >
> > > > PATCH 5 to 7 adds necessary device tree nodes (DE2 CCU and SimpleFB=
)
> > > > for H3/H5 SoCs.
> > > >
> > > > PATCH 8 to 10 are for Allwinner A64 SoC to enable SimpleFB.
> > > >
> > > > Icenowy Zheng (10):
> > > >   dt-bindings: fix the binding of Allwinner DE2 CCU of A83T and H3
> > > >   clk: sunxi-ng: add support for Allwinner H3 DE2 CCU
> > > >   clk: sunxi-ng: fix the A64/H5 clock description of DE2 CCU
> > > >   dt-bindings: simplefb-sunxi: add pipelines for DE2
> > > >   ARM: sun8i: h3/h5: add DE2 CCU device node for H3
> > > >   arm64: allwinner: h5: add compatible string for DE2 CCU
> > > >   ARM: sunxi: h3/h5: add simplefb nodes
> > > >   dt-bindings: add binding for A64 DE2 CCU SRAM
> > > >   arm64: allwinner: a64: add DE2 CCU for A64 SoC
> > > >   arm64: allwinner: a64: add simplefb for A64 SoC
> > >
> > > Maxime, could you review and, if possible, apply the H3/5
> > > part of this patchset?
> >
> > This came a bit late, we're too close from the merge window
> > now. Please resend them after -rc1 is out.
>
> Just dropping here that drm-misc is open all the time, making for a much
> better process for contributors :-)
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--f403045f8e7e9ab21c055d8af176
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Everyone,<div><br></div><div>What&#39;s the status of H=
DMI/SimpleFB driver for H5?</div><div><br></div><div>I don&#39;t see anythi=
ng related to HDMI in linux-next dts files:</div><div><br></div><div>arch/a=
rm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts=C2=A0 (example board)<br=
></div><div>arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi<br></div><div>arch=
/arm/boot/dts/sunxi-h3-h5.dtsi<br></div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On 6 November 2017 at 08:40, Daniel Vetter <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:daniel-/w4YWyX8dFk@public.gmane.org" target=3D"_blank">dan=
iel-/w4YWyX8dFk@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu=
, Nov 02, 2017 at 04:44:47PM +0100, Maxime Ripard wrote:<br>
&gt; On Thu, Nov 02, 2017 at 04:51:29PM +0800, Icenowy Zheng wrote:<br>
&gt; &gt; =E5=9C=A8 2017-10-27 23:06=EF=BC=8CIcenowy Zheng =E5=86=99=E9=81=
=93=EF=BC=9A<br>
&gt; &gt; &gt; This patchset adds support for the SimpleFB on Allwinner SoC=
s with<br>
&gt; &gt; &gt; &quot;Display Engine 2.0&quot;.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; PATCH 1 to PATCH 3 are DE2 CCU fixes for H3/H5 SoCs.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; PATCH 4 adds the pipeline strings for DE2 SimpleFB.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; PATCH 5 to 7 adds necessary device tree nodes (DE2 CCU and S=
impleFB)<br>
&gt; &gt; &gt; for H3/H5 SoCs.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; PATCH 8 to 10 are for Allwinner A64 SoC to enable SimpleFB.<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Icenowy Zheng (10):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0dt-bindings: fix the binding of Allwinner DE2 CC=
U of A83T and H3<br>
&gt; &gt; &gt;=C2=A0 =C2=A0clk: sunxi-ng: add support for Allwinner H3 DE2 =
CCU<br>
&gt; &gt; &gt;=C2=A0 =C2=A0clk: sunxi-ng: fix the A64/H5 clock description =
of DE2 CCU<br>
&gt; &gt; &gt;=C2=A0 =C2=A0dt-bindings: simplefb-sunxi: add pipelines for D=
E2<br>
&gt; &gt; &gt;=C2=A0 =C2=A0ARM: sun8i: h3/h5: add DE2 CCU device node for H=
3<br>
&gt; &gt; &gt;=C2=A0 =C2=A0arm64: allwinner: h5: add compatible string for =
DE2 CCU<br>
&gt; &gt; &gt;=C2=A0 =C2=A0ARM: sunxi: h3/h5: add simplefb nodes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0dt-bindings: add binding for A64 DE2 CCU SRAM<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0arm64: allwinner: a64: add DE2 CCU for A64 SoC<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0arm64: allwinner: a64: add simplefb for A64 SoC<=
br>
&gt; &gt;<br>
&gt; &gt; Maxime, could you review and, if possible, apply the H3/5<br>
&gt; &gt; part of this patchset?<br>
&gt;<br>
&gt; This came a bit late, we&#39;re too close from the merge window<br>
&gt; now. Please resend them after -rc1 is out.<br>
<br>
Just dropping here that drm-misc is open all the time, making for a much<br=
>
better process for contributors :-)<br>
-Daniel<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
<br>
--<br>
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi%2Bunsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux=
-sunxi+unsubscribe@<wbr>googlegroups.com</a>.<br>
For more options, visit <a href=3D"https://groups.google.com/d/optout" rel=
=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/<wbr>optout</=
a>.<br>
</font></span></blockquote></div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--f403045f8e7e9ab21c055d8af176--
