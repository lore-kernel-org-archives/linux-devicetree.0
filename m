From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH/RFC] ARM: shmobile: lager: Fix node name of GPIO keys
Date: Wed, 12 Nov 2014 17:31:11 +0900
Message-ID: <20141112083111.GV9007@verge.net.au>
References: <1414648571-30419-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXaq+VGBvMzxxaLxwv6x+97o3ZxKHops8pZ8hS1jkG6cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXaq+VGBvMzxxaLxwv6x+97o3ZxKHops8pZ8hS1jkG6cg@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-sh list <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 30, 2014 at 10:48:33AM +0100, Geert Uytterhoeven wrote:
> On Thu, Oct 30, 2014 at 6:56 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> >
> > gpio_keys appears to be consistent with more dts files than gpio-keys
> 
> The closest match on page 17 of ePAPR is "keyboard".
> Should we use that?
> 
> https://www.power.org/wp-content/uploads/2012/06/Power_ePAPR_APPROVED_v1.1.pdf

Sure. I will do a sweep to update that for all our boards.

> > [simon: reworded changelog]
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > Based on the renesas-devel-20141030-v3.18-rc2 branch of my renesas tree
> >
> >  arch/arm/boot/dts/r8a7790-lager.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
> > index 830f2e8..6c05644 100644
> > --- a/arch/arm/boot/dts/r8a7790-lager.dts
> > +++ b/arch/arm/boot/dts/r8a7790-lager.dts
> > @@ -43,7 +43,7 @@
> >                 #size-cells = <1>;
> >         };
> >
> > -       gpio_keys {
> > +       gpio-keys {
> >                 compatible = "gpio-keys";
> >
> >                 button@1 {
> 
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
> 
