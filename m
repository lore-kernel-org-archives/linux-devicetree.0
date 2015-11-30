Return-Path: <qsyousef@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJOz7+spUgBf56RkwGKbvgOYHn8tgf1X9UuoUu4ttFSTA@mail.gmail.com>
References: <CAL_JsqJOz7+spUgBf56RkwGKbvgOYHn8tgf1X9UuoUu4ttFSTA@mail.gmail.com>
Date: Mon, 30 Nov 2015 12:11:57 +0000
Message-ID: <CA+mqd+45AV82hbPeEJDOYjVaO5cEApgZBY6r5M=nF7aX=5ofYw@mail.gmail.com>
Subject: Re: [GIT PULL] DeviceTree for 4.4
From: Qais Yousef <qsyousef@gmail.com>
Content-Type: multipart/alternative; boundary=001a1130c9e49a24e10525c0f21f
To: Rob Herring <robherring2@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

--001a1130c9e49a24e10525c0f21f
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri, Nov 6, 2015 at 1:28 PM, Rob Herring <robherring2@gmail.com> wrote:

>
>
> Jonas Gorski (3):
>       of/irq: move of_msi_configure to the right guard and add a dummy
>       of/irq: make of_irq_find_parent static
>       of/irq: fix guards for irq_of_parse_and_map prototype
>
>
>

Sorry if I'm going about this in the wrong way. But the of/irq make
of_irq_find_parent() static commit is breaking some patches that are still
being reviewed.

The patch in question can be found here

    https://lkml.org/lkml/2015/11/25/291

The whole series is here

     https://lkml.org/lkml/2015/11/25/283

Maybe I shouldn't have used this function. But if not, can we have this
patch reverted?
If I should be doing something else, can you point me to the right
direction please?

Thanks,
Qais

--001a1130c9e49a24e10525c0f21f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Fri, Nov 6, 2015 at 1:28 PM, Rob Herring <span dir=3D"ltr">&=
lt;<a href=3D"mailto:robherring2@gmail.com" target=3D"_blank">robherring2@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
Jonas Gorski (3):<br>
=C2=A0 =C2=A0 =C2=A0 of/irq: move of_msi_configure to the right guard and a=
dd a dummy<br>
=C2=A0 =C2=A0 =C2=A0 of/irq: make of_irq_find_parent static<br>
=C2=A0 =C2=A0 =C2=A0 of/irq: fix guards for irq_of_parse_and_map prototype<=
br>
<br>
<br></blockquote><div><br><br></div><div>Sorry if I&#39;m going about this =
in the wrong way. But the of/irq make of_irq_find_parent() static commit is=
 breaking some patches that are still being reviewed.<br><br></div><div>The=
 patch in question can be found here<br><br>=C2=A0 =C2=A0 <a href=3D"https:=
//lkml.org/lkml/2015/11/25/291">https://lkml.org/lkml/2015/11/25/291</a><br=
><br></div><div>The whole series is here<br><br>=C2=A0 =C2=A0=C2=A0 <a href=
=3D"https://lkml.org/lkml/2015/11/25/283">https://lkml.org/lkml/2015/11/25/=
283</a><br><br></div><div>Maybe I shouldn&#39;t have used this function. Bu=
t if not, can we have this patch reverted?<br></div><div>If I should be doi=
ng something else, can you point me to the right direction please?<br></div=
><div><br></div><div>Thanks,<br></div><div>Qais<br></div></div><br></div></=
div></div>

--001a1130c9e49a24e10525c0f21f--
