From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 5/8] arm64: dts: allwinner: Add mali GPU
 supply for Pine H64
Date: Tue, 14 May 2019 17:22:46 +0200
Message-ID: <CAJiuCccZvk_rHmh4Trt+1uG0APu886Zp_DvUwGcMkph0U0biAA@mail.gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com> <20190512174608.10083-6-peron.clem@gmail.com>
 <CAMty3ZBTO9+9HLikR8=KgWZQBp+1yVgxQ_rD-E8WeJ8VvpuAcA@mail.gmail.com> <CAGb2v64QpH2uL3Q2=ePEaYhrB1_J5uNT4VnBssBgwbOB0NDD0Q@mail.gmail.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBUV25PTAKGQEAYJ5XXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v64QpH2uL3Q2=ePEaYhrB1_J5uNT4VnBssBgwbOB0NDD0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jagan, Chen-Yu,

On Tue, 14 May 2019 at 12:18, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> On Mon, May 13, 2019 at 2:28 AM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> w=
rote:
> >
> > On Sun, May 12, 2019 at 11:16 PM <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >
> > > From: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > >
> > > Enable and add supply to the Mali GPU node on the
> > > Pine H64 board.
> > >
> > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> > > index 4802902e128f..e16a8c6738f9 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> > > @@ -85,6 +85,11 @@
> > >         status =3D "okay";
> > >  };
> > >
> > > +&gpu {
> > > +       mali-supply =3D <&reg_dcdcc>;
> > > +       status =3D "okay";
> > > +};
> >
> > I think we can squash all these board dts changes into single patch.
>
> Yes. Please do so for all patches with the same changes applied to differ=
ent
> boards, and authored by the same person.

I thought it was required to have "smallest" patch as possible.
And it's also better for tracking "Tested-by" tag.

I will squash them in the next version.

Thanks,
Clement
>
> ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/CAJiuCccZvk_rHmh4Trt%2B1uG0APu886Zp_DvUwGcMkph0U0biAA%40mail.g=
mail.com.
For more options, visit https://groups.google.com/d/optout.
