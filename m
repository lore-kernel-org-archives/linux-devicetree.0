From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v2 5/9] drm/sun4i: tcon_top: Register clock
 gates in probe
Date: Mon, 17 Jun 2019 15:59:50 +0530
Message-ID: <CAMty3ZDRYBPKrGQxAZoB+trFiDLJ5BxDfNUOnPzgd+UWcpwCoQ@mail.gmail.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-6-jagan@amarulasolutions.com> <CAGb2v669MprYgy2wc_a7Kz8VpzzNGZxDxsj0z_Ujx5bV25+AWQ@mail.gmail.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBK6XTXUAKGQEUO3LV7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v669MprYgy2wc_a7Kz8VpzzNGZxDxsj0z_Ujx5bV25+AWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula <linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 16, 2019 at 11:01 AM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> On Sat, Jun 15, 2019 at 12:44 AM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> >
> > TCON TOP have clock gates for TV0, TV1, dsi and right
> > now these are register during bind call.
> >
> > Of which, dsi clock gate would required during DPHY probe
> > but same can miss to get since tcon top is not bound at
> > that time.
> >
> > To solve, this circular dependency move the clock gate
> > registration from bind to probe so-that DPHY can get the
> > dsi gate clock on time.
> >
> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 94 ++++++++++++++------------
> >  1 file changed, 49 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> > index 465e9b0cdfee..a8978b3fe851 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> > @@ -124,7 +124,53 @@ static struct clk_hw *sun8i_tcon_top_register_gate(struct device *dev,
> >  static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
> >                                void *data)
> >  {
> > -       struct platform_device *pdev = to_platform_device(dev);
> > +       struct sun8i_tcon_top *tcon_top = dev_get_drvdata(dev);
> > +       int ret;
> > +
> > +       ret = reset_control_deassert(tcon_top->rst);
> > +       if (ret) {
> > +               dev_err(dev, "Could not deassert ctrl reset control\n");
> > +               return ret;
> > +       }
> > +
> > +       ret = clk_prepare_enable(tcon_top->bus);
> > +       if (ret) {
> > +               dev_err(dev, "Could not enable bus clock\n");
> > +               goto err_assert_reset;
> > +       }
>
> You have to de-assert the reset control and enable the clock before the
> clocks it provides are registered. Otherwise a consumer may come in and
> ask for the provided clock to be enabled, but since the TCON TOP's own
> reset and clock are still disabled, you can't actually access the registers
> that controls the provided clock.

These rst and bus are common reset and bus clocks not tcon top clocks
that are trying to register here. ie reason I have not moved it in
top.
