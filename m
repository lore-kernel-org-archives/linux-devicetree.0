From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH v2 2/4] clk: sunxi-ng: add support for
 V3s CCU
Date: Wed, 18 Jan 2017 01:02:03 +0800
Message-ID: <20170117200213.27eGY8hi@smtp3h.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBHU47HBQKGQEGBWFAMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zepan <715805855-9uewiaClKEY@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B41=E6=9C=8817=E6=97=A5 17:04=E4=BA=8E Maxime Ripard <maxime.rip=
ard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,=20
>
> On Tue, Jan 17, 2017 at 02:01:14AM +0800, Icenowy Zheng wrote:=20
> > V3s has a similar but cut-down CCU to H3.=20
> >=20
> > Add support for it.=20
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > ---=20
>
> Output from checkpatch:=20
> total: 5 errors, 2 warnings, 3 checks, 857 lines checked=20
>
> > I think I should make a comparsion between V3s and H3 CCU here:=20
> > (I won't mention the missing/added clocks here, only list conflicting c=
locks)=20
>
> That should be in your commit log.=20

I think it can be easily get by a diff command :-)

And we do not have the tradition to describe clock difference in commit
log, is it right?

>
> > - "bus-ehci0" is at different bit (The bit that is "bus-ehci0" on V3s i=
s=20
> >=C2=A0=C2=A0 "bus-ehci2" on H3)=20
> > - The mux of "ce" is different. (According the view at V3s datasheet by=
 the=20
> >=C2=A0=C2=A0 author of sun4i-ss, V3s may have sun4i-ss, not sun8i-ce)=20
> > - The mux of "de" is different. (V3s do not have "pll-de", but it can m=
ux "de"=20
> >=C2=A0=C2=A0 to "pll-video")=20
> > - Clocks about CSI largely differs. (As V3s is designed as a camera SoC=
, and=20
> >=C2=A0=C2=A0 it have an extra "pll-isp")=20
>
> OK.=20
>
> Thanks,=20
> Maxime=20
>
> --=20
> Maxime Ripard, Free Electrons=20
> Embedded Linux and Kernel engineering=20
> http://free-electrons.com=20
>
> --=20
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.=20
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org=20
> For more options, visit https://groups.google.com/d/optout.=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
