Return-Path: <paupa13@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFqH_53D52WGDZUTv=w7SguTeROwrzmn9XLB+cTg-3y+Q4FxfQ@mail.gmail.com>
References: <1426162154-8716-1-git-send-email-eliad@wizery.com>
	<1426162154-8716-6-git-send-email-eliad@wizery.com>
	<CABxcv=mETO9ESVa04YjRO1d-h5ksEwvwGKb1G-jxVk6ttr9JYg@mail.gmail.com>
	<CAFqH_53D52WGDZUTv=w7SguTeROwrzmn9XLB+cTg-3y+Q4FxfQ@mail.gmail.com>
Date: Mon, 16 Mar 2015 14:08:04 +0100
Message-ID: <CAN692hmTGDDB3W5TtgfmQK5V9hUGpqVHpF=xK7F_v85cUjcRPw@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] ARM: dts: add wl12xx/wl18xx bindings
From: Pau Pajuel <paupa13@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bb70a225b3b3d0511678ae7
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Eliad Peller <eliad@wizery.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@deeprootsystems.com>, =?UTF-8?Q?Agust=C3=AD?= <afontquerni@gmail.com>, eduard gavin <egavinc@gmail.com>
List-ID: <devicetree@vger.kernel.org>

--047d7bb70a225b3b3d0511678ae7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

2015-03-13 9:17 GMT+01:00 Enric Balletbo Serra <eballetbo@gmail.com>:

> Hello,
>
> 2015-03-13 9:01 GMT+01:00 Javier Martinez Canillas <javier@dowhile0.org>:
> > Hello Eliad,
> >
> > On Thu, Mar 12, 2015 at 1:09 PM, Eliad Peller <eliad@wizery.com> wrote:
> >> Replace all the pdata-quirks for setting wl12xx/wl18xx
> >> platform data with proper DT definitions.
> >>
> >> The patch was compile-tested only.
> >>
> >> Signed-off-by: Eliad Peller <eliad@wizery.com>
> >> ---
> >
> > I wanted to test your series but I realized that the IGEPv2 I've
> > access is the old revision that has another SDIO wlan module instead
> > of a Wilink8.
> >
> > Maybe Enric have the new revision? I also added to Pau Pajuel as cc
> > who still works in the company manufacturing these boards so he should
> > be able to test it.
> >
>
> Sorry, now I only have an old revision too, so I can't test, cc'ing
> Agust=C3=AD that has access to the hardware, maybe he can test it or he c=
an
> provide to us a board ;)
>
> > But in any case, your patch looks good to me so for the
> > arch/arm/boot/dts/omap3-igep00* changes:
> >
> > Acked-by: Javier Martinez Canillas <javier@dowhile0.org>
> >
>
> For my part also looks good.
>
> Acked-by: Enric Balletbo i Serra <eballetbo@gmail.com>
>
> Best regards,
>    Enric
>
> > Best regards,
> > Javier
>

I'm gonna test it this week. I added Eduard Gavin as cc too.

Cheers!

--047d7bb70a225b3b3d0511678ae7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">2015-03-13 9:17 GMT+01:00 Enric Balletbo Serra <span dir=3D"ltr=
">&lt;<a href=3D"mailto:eballetbo@gmail.com" target=3D"_blank">eballetbo@gm=
ail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hello,<br>
<span class=3D""><br>
2015-03-13 9:01 GMT+01:00 Javier Martinez Canillas &lt;<a href=3D"mailto:ja=
vier@dowhile0.org">javier@dowhile0.org</a>&gt;:<br>
&gt; Hello Eliad,<br>
&gt;<br>
&gt; On Thu, Mar 12, 2015 at 1:09 PM, Eliad Peller &lt;<a href=3D"mailto:el=
iad@wizery.com">eliad@wizery.com</a>&gt; wrote:<br>
&gt;&gt; Replace all the pdata-quirks for setting wl12xx/wl18xx<br>
&gt;&gt; platform data with proper DT definitions.<br>
&gt;&gt;<br>
&gt;&gt; The patch was compile-tested only.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Eliad Peller &lt;<a href=3D"mailto:eliad@wizery.com=
">eliad@wizery.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;<br>
&gt; I wanted to test your series but I realized that the IGEPv2 I&#39;ve<b=
r>
&gt; access is the old revision that has another SDIO wlan module instead<b=
r>
&gt; of a Wilink8.<br>
&gt;<br>
&gt; Maybe Enric have the new revision? I also added to Pau Pajuel as cc<br=
>
&gt; who still works in the company manufacturing these boards so he should=
<br>
&gt; be able to test it.<br>
&gt;<br>
<br>
</span>Sorry, now I only have an old revision too, so I can&#39;t test, cc&=
#39;ing<br>
Agust=C3=AD that has access to the hardware, maybe he can test it or he can=
<br>
provide to us a board ;)<br>
<span class=3D""><br>
&gt; But in any case, your patch looks good to me so for the<br>
&gt; arch/arm/boot/dts/omap3-igep00* changes:<br>
&gt;<br>
&gt; Acked-by: Javier Martinez Canillas &lt;<a href=3D"mailto:javier@dowhil=
e0.org">javier@dowhile0.org</a>&gt;<br>
&gt;<br>
<br>
</span>For my part also looks good.<br>
<br>
Acked-by: Enric Balletbo i Serra &lt;<a href=3D"mailto:eballetbo@gmail.com"=
>eballetbo@gmail.com</a>&gt;<br>
<br>
Best regards,<br>
=C2=A0 =C2=A0Enric<br>
<br>
&gt; Best regards,<br>
&gt; Javier<br>
</blockquote></div><br></div><div class=3D"gmail_extra">I&#39;m gonna test =
it this week. I added Eduard Gavin <span class=3D"">as cc too.<br><br></spa=
n></div><div class=3D"gmail_extra"><span class=3D"">Cheers!<br></span></div=
></div></div>

--047d7bb70a225b3b3d0511678ae7--
