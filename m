From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v3 03/11] pinctrl: sunxi: Prepare for
 alternative bias voltage setting methods
Date: Thu, 11 Apr 2019 12:44:53 +0200
Message-ID: <20190411104453.fhwhw3gkffikusfl@core.my.home>
References: <20190411101951.30223-1-megous@megous.com>
 <20190411101951.30223-4-megous@megous.com>
 <CAGRGNgUhPC+G+H_zYSi7KFx-K10uPOXRsPqPFcirGaWScw59dQ@mail.gmail.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBJVVXTSQKGQEDL4NI4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGRGNgUhPC+G+H_zYSi7KFx-K10uPOXRsPqPFcirGaWScw59dQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TasMV2rI37PzA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2019 at 08:34:33PM +1000, Julian Calaby wrote:
> Hi Ondrej
> 
> On Thu, Apr 11, 2019 at 8:19 PM megous via linux-sunxi
> <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
> >
> > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >
> > H6 has a different I/O voltage bias setting method than A80. Prepare
> > existing code for using alternative bias voltage setting methods.
> >
> > Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > index ee15ab067b5f..4bfc8a6d9dce 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -95,6 +95,13 @@
> >  #define PINCTRL_SUN7I_A20      BIT(7)
> >  #define PINCTRL_SUN8I_R40      BIT(8)
> >
> > +enum sunxi_desc_bias_voltage {
> > +       BIAS_VOLTAGE_NONE,
> > +       /* Bias voltage configuration is done through
> > +        * Pn_GRP_CONFIG registers, as seen on A80 SoC. */
> > +       BIAS_VOLTAGE_GRP_CONFIG,
> > +};
> > +
> >  struct sunxi_desc_function {
> >         unsigned long   variant;
> >         const char      *name;
> > @@ -117,7 +124,7 @@ struct sunxi_pinctrl_desc {
> >         const unsigned int              *irq_bank_map;
> >         bool                            irq_read_needs_mux;
> >         bool                            disable_strict_mode;
> > -       bool                            has_io_bias_cfg;
> > +       int                             io_bias_cfg_variant;
> 
> Shouldn't we be defining this field using the enum rather than as an int?

Yes, thank you, I fixed it for v4.

regards,
  	o.

> Thanks,
> 
> -- 
> Julian Calaby
> 
> Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Profile: http://www.google.com/profiles/julian.calaby/
