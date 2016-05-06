From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/4] plugin: Transparently support old style syntax
Date: Fri, 6 May 2016 07:39:35 -0500
Message-ID: <CAL_JsqJRaqn2iCY2f=FLUd-RH0FSP9A-DgXv4PoUf6wpBWrYbg@mail.gmail.com>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1462477724-8092-4-git-send-email-pantelis.antoniou@konsulko.com>
 <CAL_JsqJkJyMi4_RoxLAiVD3GXst8CX_8ekounavztXZKxdMKtg@mail.gmail.com>
 <CAPhXvM7D-Uv9nzmiiz8kw6w18nZQ-h_R4UEEPzj+_HPt3t=+BA@mail.gmail.com> <572C6449.9080103@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572C6449.9080103-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 6, 2016 at 4:30 AM, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>=
 wrote:
> Le 06/05/2016 11:16, Phil Elwell a =C3=A9crit :
>>> In the wild where?
>>>
>>> IMO, too bad. That's the danger of deploying prototype code. Perhap=
s a
>>> tool to convert them would be better.
>
> Prototype code or no code, which one solve actual problems?

I didn't say don't use it. You just have to understand the risks when
you take things off the list and be willing to deal with the changes.

In any case, we're only talking about changes in the source format.
Anything deployed should be fine. Folks can't update their dts files?

>> At Raspberry Pi we've been making good use of overlays for over a ye=
ar now.
>> They have been an invaluable tool, allowing us to reduce the need fo=
r
>> downstream code while retaining and extending the flexibility our us=
ers
>> need. Without the circulating patches I would have pressed ahead wit=
h a
>> homegrown equivalent, which would have made switching to overlays mu=
ch more
>> painful.

And I'm glad you did. It works great for me.

>> I hope to see Pantelis's overlay configfs code in a kernel release s=
oon,
>> but until then we'll continue to apply the patches downstream.
>
> +1
>
> Same situation for for Atmel Xplained boards.
> I remember having identified DT overlays as the solution to my
> out-of-tree nightmare nearly 2 years ago...

I'm hardly saying you should have done something different.

Rob
