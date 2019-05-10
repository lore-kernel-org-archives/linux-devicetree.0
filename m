Return-Path: <SRS0=FVw4=TK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-5-chris.brandt@renesas.com> <OSBPR01MB3174A8008FF1E216893398E8D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3174A8008FF1E216893398E8D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 May 2019 08:55:13 +0200
Message-ID: <CAMuHMdVVoYak4FGEOYK_dGLCLEQ7avVCv5AcY43BPkDnt7OZ4w@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of usb_x1
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san, Chris,

On Fri, May 10, 2019 at 6:38 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Chris Brandt, Sent: Friday, May 10, 2019 5:12 AM
> >
> > Document the optional renesas,uses_usb_x1 property.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > ---
> > v2:
> >  * removed 'use_usb_x1' option
> >  * document that 'usb_x1' clock node will be detected to determine if
> >    48MHz clock exists
> > ---
> >  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > index d46188f450bf..79d8360d92e5 100644
> > --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > @@ -28,7 +28,9 @@ Required properties:
> >             followed by the generic version.
> >
> >  - reg: offset and length of the partial USB 2.0 Host register block.
> > -- clocks: clock phandle and specifier pair(s).
> > +- clocks: clock phandle and specifier pair(s). For SoCs that have a separate
> > +          dedicated 48MHz USB_X1 input, if a 'usb_x1' clock node exists and is
> > +          set to non-zero, the PHY will use the 48MHZ input for the PLL.
>
> I think we need to add clock-names property for usb_x1 at least.

Indeed. "if a 'usb_x1' clock node exists" is too fragile; better reference
the clock from "clocks".

> I checked the other doc "renesas,du.txt".
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/renesas,du.txt#n31
>
> I think we can reuse it like below:
>
> - clock-names: Name of the clocks. This property is model-dependent.
>   - R-Car Gen3 SoCs use a single functional clock. The clock doesn't need to be
>     named.
>   - RZ/A2 uses a single functional clock as a separate dedicated 48MHz

and a separate?

>     USB_X1 input. So, the functional clock must be named "???" and
>     the USB_X1 input must be named as "usb_x1".
>
> What do you think? I'm not sure how to be named the functional clock so that
> the sample is named as "???".

We typically use "fclk" for the functional clock's name.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
