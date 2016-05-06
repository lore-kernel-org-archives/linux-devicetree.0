Return-Path: <philip.j.elwell@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJkJyMi4_RoxLAiVD3GXst8CX_8ekounavztXZKxdMKtg@mail.gmail.com>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1462477724-8092-4-git-send-email-pantelis.antoniou@konsulko.com>
	<CAL_JsqJkJyMi4_RoxLAiVD3GXst8CX_8ekounavztXZKxdMKtg@mail.gmail.com>
Date: Fri, 6 May 2016 10:14:43 +0100
Message-ID: <CAPhXvM4QNbtt9mdUhn+3VJv1vvCN8gtAkR4S5QFiwviF+0JVrQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] plugin: Transparently support old style syntax
From: Phil Elwell <philip.j.elwell@gmail.com>
Content-Type: multipart/alternative; boundary=001a11423120ac0d26053228e30f
To: Rob Herring <robherring2@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Gibson <david@gibson.dropbear.id.au>, Jon Loeliger <jdl@jdl.com>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Jan Luebbe <jlu@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Matt Porter <mporter@konsulko.com>, devicetree-compiler@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a11423120ac0d26053228e30f
Content-Type: text/plain; charset=UTF-8

On Fri, May 6, 2016 at 1:58 AM, Rob Herring <robherring2@gmail.com> wrote:

> In the wild where?
>
> IMO, too bad. That's the danger of deploying prototype code. Perhaps a
> tool to convert them would be better.


At Raspberry Pi we've been making good use of overlays for over a year now.
They have been an invaluable tool, allowing us to reduce the need for
downstream code while retaining and extending the flexibility our users
need. Without the circulating patches I would have pressed ahead with a
homegrown equivalent, which would have made switching to overlays much more
painful.

I hope to see Pantelis's overlay configfs code in a kernel release soon,
but until then we'll continue to apply the patches downstream.

Phil

--001a11423120ac0d26053228e30f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, May 6, 2016 at 1:58 AM, Rob Herring <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:robherring2@gmail.com" target=3D"_blank">robherring2@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:=
rgb(204,204,204);padding-left:1ex">In the wild where?<br>
<br>
IMO, too bad. That&#39;s the danger of deploying prototype code. Perhaps a<=
br>
tool to convert them would be better.</blockquote><div><br></div><div>At Ra=
spberry Pi we&#39;ve been making good use of overlays for over a year now. =
They have been an invaluable tool, allowing us to reduce the need for downs=
tream code while retaining and extending the flexibility our users need. Wi=
thout the circulating patches I would have pressed ahead with a homegrown e=
quivalent, which would have made switching to overlays much more painful.</=
div><div><br></div><div>I hope to see Pantelis&#39;s overlay configfs code =
in a kernel release soon, but until then we&#39;ll continue to apply the pa=
tches downstream.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Phil</div></div></div></div>

--001a11423120ac0d26053228e30f--
