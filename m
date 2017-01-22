From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/6] rtc: sun6i: Force the mux to the external oscillator
Date: Sun, 22 Jan 2017 15:44:14 +0100
Message-ID: <20170122144414.fvir5la7cgocxfqn@piout.net>
References: <cover.180d5ae6bc36ead9625d208824f5cbd7114cf92e.1484927680.git-series.maxime.ripard@free-electrons.com>
 <409c56f0ed1c4b0026ad60cb1218c99fe1686408.1484927680.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v650f-4RZ6RrRBGcmPz8mJ4KbJwTTj6=w3HeSWUZtLAKcw@mail.gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCKYNX7Y3IMBBSMKSPCAKGQEFJR4NFQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v650f-4RZ6RrRBGcmPz8mJ4KbJwTTj6=w3HeSWUZtLAKcw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21/01/2017 at 11:53:08 +0800, Chen-Yu Tsai wrote :
> Hi,
> 
> On Fri, Jan 20, 2017 at 11:56 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > The internal oscillator is way too inaccurate to do something useful with
> > it. Switch to the external oscillator if it is available.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  drivers/rtc/rtc-sun6i.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > index edd5627da10f..1695fae24cd5 100644
> > --- a/drivers/rtc/rtc-sun6i.c
> > +++ b/drivers/rtc/rtc-sun6i.c
> > @@ -493,6 +493,7 @@ static const struct rtc_class_ops sun6i_rtc_ops = {
> >  static int sun6i_rtc_probe(struct platform_device *pdev)
> >  {
> >         struct sun6i_rtc_dev *chip = sun6i_rtc;
> > +       struct clk *parent;
> >         int ret;
> >
> >         if (!chip)
> > @@ -540,6 +541,17 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
> >         /* disable alarm wakeup */
> >         writel(0, chip->base + SUN6I_ALARM_CONFIG);
> >
> > +       parent = clk_get(&pdev->dev, NULL);
> > +       if (!IS_ERR(parent)) {
> > +               ret = clk_set_parent(chip->losc, parent);
> > +               clk_put(parent);
> > +
> > +               if (ret) {
> > +                       dev_err(&pdev->dev,
> > +                               "Failed to reparent the RTC to the external oscillator\n");
> > +                       return ret;
> > +               }
> > +       }
> 
> Following what I mentioned in patch 1, maybe it is easier to force
> the mux before the clocks are registered by writing directly to
> the registers? We could also backport the changes to stable?
> 

I'd say that the risk to break existing platforms is low enough to
backport that patch to stable.
Maxime as you are certainly the one that will handle the potential
breakage, I'll let you choose what you want to do.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
