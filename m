From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sunxi: add MMC support for A83T
Date: Tue, 20 Jun 2017 18:50:32 +0800
Message-ID: <CAAST=9zhF0-JDNTPyBeZxUP5ukdWG6HusRYhJd+B-6jX3gMm7w@mail.gmail.com>
References: <20170618130018.10684-1-techping.chan@gmail.com>
 <20170618130018.10684-2-techping.chan@gmail.com> <20170620094906.7bwg6zvth6oqkasd@flea.lan>
Reply-To: techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="f403043eecd851ac1f05526205fe"
Return-path: <linux-sunxi+bncBCJ6PAPY4MPBB6P3UPFAKGQEMB5KSTI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170620094906.7bwg6zvth6oqkasd-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--f403043eecd851ac1f05526205fe
Content-Type: text/plain; charset="UTF-8"

2017-06-20 17:49 GMT+08:00 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:

> Hi,
>
> On Sun, Jun 18, 2017 at 09:00:17PM +0800, Ziping Chen wrote:
> > From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > The Allwinner A83T's MMC can work with
> > compatible "allwinner,sun7i-a20-mmc".
> >
> > Add support for it.
>
> This has been proven not to be the case already.
>
> Please use an A83T compatible only.
>

OK!

Thanks,
Ziping

>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--f403043eecd851ac1f05526205fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2017-06-20 17:49 GMT+08:00 Maxime Ripard <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" target=3D"_blank">maxime.ripar=
d@free-electrons.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<=
br>
<span class=3D""><br>
On Sun, Jun 18, 2017 at 09:00:17PM +0800, Ziping Chen wrote:<br>
&gt; From: Ziping Chen &lt;<a href=3D"mailto:techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">techp=
ing.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt;<br>
&gt; The Allwinner A83T&#39;s MMC can work with<br>
&gt; compatible &quot;allwinner,sun7i-a20-mmc&quot;.<br>
&gt;<br>
&gt; Add support for it.<br>
<br>
</span>This has been proven not to be the case already.<br>
<br>
Please use an A83T compatible only.<br></blockquote><div><br></div><div>OK!=
</div><div><br></div><div>Thanks,</div><div>Ziping=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Maxime<br>
<br>
--<br>
Maxime Ripard, Free Electrons<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"http://free-electrons.com" rel=3D"noreferrer" target=3D"_blank">=
http://free-electrons.com</a><br>
</font></span></blockquote></div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--f403043eecd851ac1f05526205fe--
