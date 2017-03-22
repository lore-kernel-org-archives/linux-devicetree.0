From: jacopo <jacopo@jmondi.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Wed, 22 Mar 2017 16:36:28 +0100
Message-ID: <20170322153628.GH30223@w540>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490026491-21742-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWT6vJNmMhYzMEqYRbuT=W=ZuND-WfG812LfH0r0AzM_g@mail.gmail.com>
 <CAMuHMdUvq6afz4h8XGUP=Ui6re9J1uZDrcSZ9OV+agY-jhJebQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUvq6afz4h8XGUP=Ui6re9J1uZDrcSZ9OV+agY-jhJebQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,
    thanks for reviews

On Wed, Mar 22, 2017 at 02:20:08PM +0100, Geert Uytterhoeven wrote:
> On Wed, Mar 22, 2017 at 11:33 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, Mar 20, 2017 at 5:14 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> >> Add device tree bindings documentation for Renesas RZ/A1 gpio and pin
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> 
> ulating the pin index from its position
> >> +      (port where it sits on and pin offset), and alternate function
> >> +      configuration options are provided in pin controller header file at:
> >
> > the pin ... file
> >
> >> +      include/dt-bindings/pinctrl/r7s72100-pinctrl.h
> >
> > Hence I'd include that file in this patch, as it's part of the bindings.
> 
> Ah, that would create a hard dependency between the DTS files and the
> DT bindings, which typically go in through different trees.
> As the driver replicates the definitions from the header, the include file
> can go in with the DTS updates.
> 

Sorry, got confused by multiple reviews here..
Are you suggesting to squash [03/07] in [04/07] here?

Thanks
   j

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
