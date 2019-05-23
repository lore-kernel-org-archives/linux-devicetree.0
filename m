From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v7 2/4] soc: qcom: Add AOSS QMP driver
Date: Thu, 23 May 2019 12:03:38 -0700
Message-ID: <20190523190338.GT31438@minitux>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-3-bjorn.andersson@linaro.org>
 <CAD=FV=VVxKSp6e=j8YM8JBrhsF+T=0=8xDjd_817hphOMWHVFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=VVxKSp6e=j8YM8JBrhsF+T=0=8xDjd_817hphOMWHVFA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu 23 May 09:38 PDT 2019, Doug Anderson wrote:

> Hi,
> 
> On Tue, Apr 30, 2019 at 9:38 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > +static int qmp_qdss_clk_prepare(struct clk_hw *hw)
> > +{
> > +       struct qmp *qmp = container_of(hw, struct qmp, qdss_clk);
> > +       char buf[QMP_MSG_LEN] = "{class: clock, res: qdss, val: 1}";
> 
> nit: "static const" the buf?  No need to copy it to the stack each
> time.  In qmp_qdss_clk_unprepare() too.
> 

Thanks, that makes sense.

> ...your string is also now fixed at 34 bytes big (including the '\0').
> Do we still need to send exactly 96 bytes, or can we dumb this down to
> 36?  We'll get a compile error if we overflow, right?  If this truly
> needs to be exactly 96 bytes maybe qmp_send()'s error checks should
> check for things being exactly 96 bytes instead of checking for > and
> % 4.
> 

I double checked with my contacts and the only requirement here is that
memory has to be word-accessed, so I'll figure out a sane way to write
this.

> 
> > +static int qmp_qdss_clk_add(struct qmp *qmp)
> > +{
> > +       struct clk_init_data qdss_init = {
> > +               .ops = &qmp_qdss_clk_ops,
> > +               .name = "qdss",
> > +       };
> 
> Can't qdss_init be "static const"?  That had the advantage of not
> needing to construct it on the stack and also of it having a longer
> lifetime.  It looks like clk_register() stores the "hw" pointer in its
> structure and the "hw" structure will have a pointer here.  While I
> can believe that it never looks at it again, it's nice if that pointer
> doesn't point somewhere on an old stack.
> 

The purpose here was for clk_hw_register() to consume it and never look
back, but I agree that it's a bit fragile. I'll review Stephen's
proposed patch.

> I suppose we could go the other way and try to mark more stuff in this
> module as __init and __initdata, but even then at least the pointer
> won't be onto a stack.  ;-)
> 
> 
> > +       int ret;
> > +
> > +       qmp->qdss_clk.init = &qdss_init;
> > +       ret = clk_hw_register(qmp->dev, &qmp->qdss_clk);
> > +       if (ret < 0) {
> > +               dev_err(qmp->dev, "failed to register qdss clock\n");
> > +               return ret;
> > +       }
> > +
> > +       return of_clk_add_hw_provider(qmp->dev->of_node, of_clk_hw_simple_get,
> > +                                     &qmp->qdss_clk);
> 
> devm_clk_hw_register() and devm_of_clk_add_hw_provider()?  If you're
> worried about ordering you could always throw in
> devm_add_action_or_reset() to handle the qmp_pd_remove(), qmp_close()
> and mbox_free_channel().
> 
> ...with that you could fully get rid of qmp_remove() and also your
> setting of drvdata.
> 

Yeah, I was worried about qmp_close() before unregistering the clock.
I'll take another look, will at least have to fix the error handling on
of_clk_add_hw_provider()

> 
> > +static void qmp_pd_remove(struct qmp *qmp)
> > +{
> > +       struct genpd_onecell_data *data = &qmp->pd_data;
> > +       struct device *dev = qmp->dev;
> > +       int i;
> > +
> > +       of_genpd_del_provider(dev->of_node);
> > +
> > +       for (i = 0; i < data->num_domains; i++)
> > +               pm_genpd_remove(data->domains[i]);
> 
> Still feels like the above loop would be better as:
>   for (i = data->num_domains - 1; i >= 0; i--)
> 

To me this carries a message that the removal order is significant,
which I'm unable to convince myself that it is.

> 
> (BTW: any way you could add me to the CC list for future patches so I
> notice them earlier?)
> 

Yes of course, thanks for your review.

Regards,
Bjorn
