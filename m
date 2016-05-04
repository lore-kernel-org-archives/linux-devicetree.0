From: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Wed, 4 May 2016 06:07:16 -0700 (PDT)
Message-ID: <948be370-4401-43cb-862e-d4376755a75d@googlegroups.com>
References: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
 <CAGb2v66E2TuN3+tYaAbniV3q67waDZOfqKAW14VJz6xZFomZ=Q@mail.gmail.com>
 <57285162.2000704@schinagl.nl>
 <CAGb2v66r9m7qVW6BszeT2wqs0KyEr4x5ivTJYqu2Fes=R9-Ltw@mail.gmail.com>
 <CANCTEQgjiuQXcaw=3Dr5kUsTPc3nsDQf2odwzs4nHvrkREAqrg@mail.gmail.com>
 <5729F07C.3080308@schinagl.nl>
Reply-To: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_316_1707913696.1462367236878"
Return-path: <linux-sunxi+bncBD7ORYHCVECRBBPIU64QKGQE7SZZZUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <5729F07C.3080308-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_316_1707913696.1462367236878
Content-Type: multipart/alternative;
	boundary="----=_Part_317_1734458210.1462367236878"

------=_Part_317_1734458210.1462367236878
Content-Type: text/plain; charset=UTF-8

Hi Olliver,

I have already test it a few weeks ago and definitely can say that 8-bit 
bus did not work on A20-Olinuxino-Lime2-eMMC with mainline kernel.
See may post here 
<http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7361>
.

Best regards

Chris

On Wednesday, May 4, 2016 at 3:52:17 PM UTC+3, Olliver Schinagl wrote:
>
> Hey Radoslav, 
>
> On 04-05-16 14:30, Radoslav Kolev wrote: 
> > 2016-05-03 10:25 GMT+03:00 Chen-Yu Tsai <we...-jdAy2FN1RRM@public.gmane.org <javascript:>>: 
> >> On Tue, May 3, 2016 at 3:21 PM, Olliver Schinagl <oli...-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org 
> <javascript:>> wrote: 
> >>>>> +       bus-width = <4>; 
> >>>> Only 4 bits? We normally see eMMC with 8 bits. 4 bits are some kind 
> of 
> >>>> embedded SD card. 
> >>> On A20 as well? Our investigations so far have concluded that the A10 
> and 
> >>> A20 have those pins not mapped out to pads. The IP does support it 
> however 
> >>> we assume. 
> >> You're right. My bad. First time A10/A20 sees eMMC support. 
> > I can't say anything about A10/A20, but I have a board with A13 and 
> > the same eMMC chip and it works fine in 8 bit mode. 
> Yep, sun5i actually brings them all out to pads, the A20 however does 
> not :( We first thought that the A20 would also be an 8bitter, because 
> the mmc IP appears to be the same as sun5i, but initial tests show it is 
> not. As for A10, it has older IP and it might not even support 8 bit 
> mode, let alone bring out the pins. 
>
> But with A20's + eMMC being available via the lime2, others may repeat 
> my experiments! The lime2 is 8 bit connected. 
>
> Olliver 
> > 
> > Regards, 
> > Radoslav 
>
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_317_1734458210.1462367236878
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Olliver,<br><br>I have already test it a few weeks ago =
and definitely can say that 8-bit bus did not work on A20-Olinuxino-Lime2-e=
MMC with mainline kernel.<br>See may post <a href=3D"http://forum.armbian.c=
om/index.php/topic/853-armbian-customization/page-2#entry7361">here</a>.<br=
><br>Best regards<br><br>Chris<br><br>On Wednesday, May 4, 2016 at 3:52:17 =
PM UTC+3, Olliver Schinagl wrote:<blockquote class=3D"gmail_quote" style=3D=
"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex=
;">Hey Radoslav,
<br>
<br>On 04-05-16 14:30, Radoslav Kolev wrote:
<br>&gt; 2016-05-03 10:25 GMT+03:00 Chen-Yu Tsai &lt;<a href=3D"javascript:=
" target=3D"_blank" gdf-obfuscated-mailto=3D"kudQW1JaAQAJ" rel=3D"nofollow"=
 onmousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"=
this.href=3D&#39;javascript:&#39;;return true;">we...-jdAy2FN1RRM@public.gmane.org</a>&gt;:
<br>&gt;&gt; On Tue, May 3, 2016 at 3:21 PM, Olliver Schinagl &lt;<a href=
=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailto=3D"kudQW1JaAQAJ" r=
el=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return tru=
e;" onclick=3D"this.href=3D&#39;javascript:&#39;;return true;">oli...@schin=
agl.nl</a>&gt; wrote:
<br>&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 bus-width =3D &lt;4&gt;;
<br>&gt;&gt;&gt;&gt; Only 4 bits? We normally see eMMC with 8 bits. 4 bits =
are some kind of
<br>&gt;&gt;&gt;&gt; embedded SD card.
<br>&gt;&gt;&gt; On A20 as well? Our investigations so far have concluded t=
hat the A10 and
<br>&gt;&gt;&gt; A20 have those pins not mapped out to pads. The IP does su=
pport it however
<br>&gt;&gt;&gt; we assume.
<br>&gt;&gt; You&#39;re right. My bad. First time A10/A20 sees eMMC support=
.
<br>&gt; I can&#39;t say anything about A10/A20, but I have a board with A1=
3 and
<br>&gt; the same eMMC chip and it works fine in 8 bit mode.
<br>Yep, sun5i actually brings them all out to pads, the A20 however does=
=20
<br>not :( We first thought that the A20 would also be an 8bitter, because=
=20
<br>the mmc IP appears to be the same as sun5i, but initial tests show it i=
s=20
<br>not. As for A10, it has older IP and it might not even support 8 bit=20
<br>mode, let alone bring out the pins.
<br>
<br>But with A20&#39;s + eMMC being available via the lime2, others may rep=
eat=20
<br>my experiments! The lime2 is 8 bit connected.
<br>
<br>Olliver
<br>&gt;
<br>&gt; Regards,
<br>&gt; Radoslav
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_317_1734458210.1462367236878--

------=_Part_316_1707913696.1462367236878--
