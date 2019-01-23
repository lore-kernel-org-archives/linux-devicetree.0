Return-Path: <SRS0=rkZQ=P7=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190123134833.119031-1-chris.brandt@renesas.com>
 <CAL_JsqKuDzL2N_fihJzUEZ9uRK5HWd1ARD7DzZZM7Dy4C8M_BA@mail.gmail.com> <TYXPR01MB1568588CC80BDB074A4FADA08A990@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568588CC80BDB074A4FADA08A990@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Jan 2019 15:59:05 +0100
Message-ID: <CAMuHMdUsJ5dhH5Rz8iWW8ocbnwaEeSBL9ToKibb5Sj29Y0jRog@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Document RZ/A2M EVB
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jan 23, 2019 at 3:10 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wednesday, January 23, 2019, Rob Herring wrote:
> > Please check your changes with 'dt_binding_check' target. This will
> > fail. 'description' already has a value, so you can't add a list to
> > it. And description has to be a string.
> >
> > >          items:
> >
> > Move the 2 lines here.
> >
> > >            - const: renesas,r7s9210
>
> I can't find 'dt_binding_check' (I guess it's only in the DT tree).

This seems to be a make target: "make dt_binding_check"
(included in last renesas-drivers).

This needs "dt-mk-schema", which you can find in
https://github.com/robherring/yaml-bindings

Cloned, patch sent for missing python3-pip dependency, installed, put in $PATH,
and now it seems to like your v2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
