Return-Path: <SRS0=8TRJ=F5=gmail.com=musashino.open@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CACna6rwKt1wdryaSs1DsGztSjugBbfRfQqpzGKjvqWf=j=N5kw@mail.gmail.com>
References: <1520260563-4167-1-git-send-email-musashino.open@gmail.com> <CACna6rwKt1wdryaSs1DsGztSjugBbfRfQqpzGKjvqWf=j=N5kw@mail.gmail.com>
From: =?UTF-8?B?56iy5Z6j5aSn5b+X?= <musashino.open@gmail.com>
Date: Wed, 7 Mar 2018 19:37:14 +0900
Message-ID: <CADkYQDOnkdAj_eW_1kG=Z2-c8gd_u5OkAa1nG2rWyf5GiACA9w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: add missing LEDs for Buffalo WZR-900DHP
Content-Type: multipart/alternative; boundary="f4f5e808e5d480fd000566d024de"
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--f4f5e808e5d480fd000566d024de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for review.

I see, the trigger of "default-off" is unnecessary... I will fix it and
send again.

It was my first time to send patches, but your detailed advice helped me a
lot.

Thank you!

2018-03-07 17:51 GMT+09:00 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>:

> On 5 March 2018 at 15:36,  <musashino.open@gmail.com> wrote:
> > From: INAGAKI Hiroshi <musashino.open@gmail.com>
> >
> > Buffalo WZR-900DHP has 8 LEDs, but there is not LED definitions in the
> > dts and cannot configure these LEDs.
> > I Added missing LED definitions for WZR-900DHP.
> >
> > Signed-off-by: INAGAKI Hiroshi <musashino.open@gmail.com>
>
> Looks almost good, thanks for sending this patch to Florian.
>
> One comment: please drop all linux,default-trigger =3D "default-off";
> lines. I did the same mistake long time ago, see my fixing commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/
> linux.git/commit/?id=3D0b660259e927177dc0c6eb3b1c39f23c6a011c5f
>
> When you fix that, please generate a V2 of your patch, you can do it
> with something like:
> git format-patch --subject-prefix=3D"PATCH V2" -1
> and send again the same way.
>
> Thanks!
>

--f4f5e808e5d480fd000566d024de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for review.</div><div><br></div><div>I see,=
 the trigger of &quot;default-off&quot; is unnecessary... I will fix it and=
 send again.</div><div><br></div><div>It was my first time to send patches,=
 but your detailed advice helped me a lot.</div><div><br></div><div>Thank y=
ou!<br></div><div class=3D"gmail_extra"><b></b><i></i><u></u><sub></sub><su=
p></sup><strike></strike><font size=3D"3"></font><br><div class=3D"gmail_qu=
ote">2018-03-07 17:51 GMT+09:00 Rafa=C5=82 Mi=C5=82ecki <span dir=3D"ltr">&=
lt;<a href=3D"mailto:zajec5@gmail.com" target=3D"_blank">zajec5@gmail.com</=
a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-=
width:1px;border-left-style:solid"><span>On 5 March 2018 at 15:36,=C2=A0 &l=
t;<a href=3D"mailto:musashino.open@gmail.com">musashino.open@gmail.com</a>&=
gt; wrote:<br>
&gt; From: INAGAKI Hiroshi &lt;<a href=3D"mailto:musashino.open@gmail.com">=
musashino.open@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Buffalo WZR-900DHP has 8 LEDs, but there is not LED definitions in the=
<br>
&gt; dts and cannot configure these LEDs.<br>
&gt; I Added missing LED definitions for WZR-900DHP.<br>
&gt;<br>
&gt; Signed-off-by: INAGAKI Hiroshi &lt;<a href=3D"mailto:musashino.open@gm=
ail.com">musashino.open@gmail.com</a>&gt;<br>
<br>
</span>Looks almost good, thanks for sending this patch to Florian.<br>
<br>
One comment: please drop all linux,default-trigger =3D &quot;default-off&qu=
ot;;<br>
lines. I did the same mistake long time ago, see my fixing commit:<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D0b660259e927177dc0c6eb3b1c39f23c6a011c5f" target=3D"_blank"=
 rel=3D"noreferrer">https://git.kernel.org/pub/<wbr>scm/linux/kernel/git/to=
rvalds/<wbr>linux.git/commit/?id=3D<wbr>0b660259e927177dc0c6eb3b1c39f2<wbr>=
3c6a011c5f</a><br>
<br>
When you fix that, please generate a V2 of your patch, you can do it<br>
with something like:<br>
git format-patch --subject-prefix=3D&quot;PATCH V2&quot; -1<br>
and send again the same way.<br>
<br>
Thanks!<br>
</blockquote></div><br></div></div>

--f4f5e808e5d480fd000566d024de--
