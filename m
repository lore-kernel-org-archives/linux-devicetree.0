From: =?UTF-8?B?TWVzaWggS8SxbMSxbsOn?= <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/7] Timer & SPI support for Allwinner suniv F1C100s
Date: Mon, 18 Mar 2019 12:25:18 +0300
Message-ID: <CA+J+62WKvuKCXfK1p3sRrxeV5w2hmmLeZYB06K7YtmsrZ9N9bw@mail.gmail.com>
References: <cover.1549875778.git.mesihkilinc@gmail.com> <2485e6c52810df376a0df6eb7f749f35b7b19044.camel@aosc.xyz>
 <177e2598-3491-03af-8638-c60e77cc4a34@linaro.org> <8e1cf9c7111a423ce7cc32a6759d16e4197b87d9.camel@aosc.xyz>
 <c741ed1a-ef02-c7c9-846b-c5240c8d07b6@linaro.org>
Reply-To: mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="00000000000043ad3d05845af8c6"
Return-path: <linux-sunxi+bncBDI4VHO5SYLBBC6IXXSAKGQEKPURF7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <c741ed1a-ef02-c7c9-846b-c5240c8d07b6-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--00000000000043ad3d05845af8c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yep, it's my fault. Sorry about that.

18 Mar 2019 Pzt 11:04 tarihinde Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
=C5=9Funu yazd=C4=B1:

> On 18/03/2019 08:18, Icenowy Zheng wrote:
> > =E5=9C=A8 2019-03-17=E6=97=A5=E7=9A=84 21:52 +0100=EF=BC=8CDaniel Lezca=
no=E5=86=99=E9=81=93=EF=BC=9A
> >> On 17/03/2019 18:39, Icenowy Zheng wrote:
> >>> =E5=9C=A8 2019-02-11=E4=B8=80=E7=9A=84 12:21 +0300=EF=BC=8CMesih Kili=
nc=E5=86=99=E9=81=93=EF=BC=9A
> >>>> This is followup series for F1C100s initial support patchset.
> >>>> All patches merged except patch 1 ~ 2 which is related to timer.
> >>>> I am resending those since they are already have Acked tags.
> >>>
> >>> Ping.
> >>>
> >>> Could you please merge these timer-related patches?
> >>
> >> Hi,
> >>
> >> I acked the timer-related patches. If you resend the patches with my
> >> acked-by I will consider them to go through the allwinner tree.
> >>
> >> Do you want me to take 1 and 2 through my tree?
> >
> > Please. They also have the ACK from Allwinner/sunXi maintainer.
>
> Applied for 5.2. Thanks
>
> By the way, I did not find any trace of the email in my mailer, was I
> To'ed or CC'ed for those patches ?
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--00000000000043ad3d05845af8c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yep, it&#39;s my fault. Sorry about that.=C2=A0</div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">18 Mar 201=
9 Pzt 11:04 tarihinde Daniel Lezcano &lt;<a href=3D"mailto:daniel.lezcano@l=
inaro.org">daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; =C5=9Funu yazd=C4=B1:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On 18/03/2019 08:18, Icenowy Zheng wrote:<b=
r>
&gt; =E5=9C=A8 2019-03-17=E6=97=A5=E7=9A=84 21:52 +0100=EF=BC=8CDaniel Lezc=
ano=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt;&gt; On 17/03/2019 18:39, Icenowy Zheng wrote:<br>
&gt;&gt;&gt; =E5=9C=A8 2019-02-11=E4=B8=80=E7=9A=84 12:21 +0300=EF=BC=8CMes=
ih Kilinc=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt;&gt;&gt;&gt; This is followup series for F1C100s initial support patchs=
et. <br>
&gt;&gt;&gt;&gt; All patches merged except patch 1 ~ 2 which is related to =
timer.<br>
&gt;&gt;&gt;&gt; I am resending those since they are already have Acked tag=
s.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Ping.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Could you please merge these timer-related patches?<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I acked the timer-related patches. If you resend the patches with =
my<br>
&gt;&gt; acked-by I will consider them to go through the allwinner tree.<br=
>
&gt;&gt;<br>
&gt;&gt; Do you want me to take 1 and 2 through my tree?<br>
&gt; <br>
&gt; Please. They also have the ACK from Allwinner/sunXi maintainer.<br>
<br>
Applied for 5.2. Thanks<br>
<br>
By the way, I did not find any trace of the email in my mailer, was I<br>
To&#39;ed or CC&#39;ed for those patches ?<br>
<br>
<br>
-- <br>
=C2=A0&lt;<a href=3D"http://www.linaro.org/" rel=3D"noreferrer noreferrer" =
target=3D"_blank">http://www.linaro.org/</a>&gt; Linaro.org =E2=94=82 Open =
source software for ARM SoCs<br>
<br>
Follow Linaro:=C2=A0 &lt;<a href=3D"http://www.facebook.com/pages/Linaro" r=
el=3D"noreferrer noreferrer" target=3D"_blank">http://www.facebook.com/page=
s/Linaro</a>&gt; Facebook |<br>
&lt;<a href=3D"http://twitter.com/#!/linaroorg" rel=3D"noreferrer noreferre=
r" target=3D"_blank">http://twitter.com/#!/linaroorg</a>&gt; Twitter |<br>
&lt;<a href=3D"http://www.linaro.org/linaro-blog/" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">http://www.linaro.org/linaro-blog/</a>&gt; Blog<br>
<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--00000000000043ad3d05845af8c6--
