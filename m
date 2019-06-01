From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v8 2/4] soc: qcom: Add AOSS QMP driver
Date: Fri, 31 May 2019 17:09:17 -0700
Message-ID: <20190601000917.GE25597@minitux>
References: <20190531030057.18328-1-bjorn.andersson@linaro.org>
 <20190531030057.18328-3-bjorn.andersson@linaro.org>
 <CAD=FV=V=_ozPiTvT-Fnrc1a+qfHYi3ynNn8cbw9ibqfKk7Am_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=V=_ozPiTvT-Fnrc1a+qfHYi3ynNn8cbw9ibqfKk7Am_w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri 31 May 15:24 PDT 2019, Doug Anderson wrote:

> Hi,
> 
> On Thu, May 30, 2019 at 8:01 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > +/**
> > + * qmp_send() - send a message to the AOSS
> > + * @qmp: qmp context
> > + * @data: message to be sent
> > + * @len: length of the message
> > + *
> > + * Transmit @data to AOSS and wait for the AOSS to acknowledge the message.
> > + * @len must be a multiple of 4 and not longer than the mailbox size. Access is
> > + * synchronized by this implementation.
> > + *
> > + * Return: 0 on success, negative errno on failure
> > + */
> > +static int qmp_send(struct qmp *qmp, const void *data, size_t len)
> > +{
> > +       int ret;
> > +
> > +       if (WARN_ON(len + sizeof(u32) > qmp->size))
> > +               return -EINVAL;
> > +
> > +       if (WARN_ON(len % sizeof(u32)))
> > +               return -EINVAL;
> > +
> > +       mutex_lock(&qmp->tx_lock);
> > +
> > +       /* The message RAM only implements 32-bit accesses */
> > +       __iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
> > +                        data, len / sizeof(u32));
> > +       writel(len, qmp->msgram + qmp->offset);
> > +       qmp_kick(qmp);
> > +
> > +       ret = wait_event_interruptible_timeout(qmp->event,
> > +                                              qmp_message_empty(qmp), HZ);
> > +       if (!ret) {
> > +               dev_err(qmp->dev, "ucore did not ack channel\n");
> > +               ret = -ETIMEDOUT;
> > +
> > +               /* Clear message from buffer */
> > +               writel(0, qmp->msgram + qmp->offset);
> > +       } else {
> > +               ret = 0;
> > +       }
> 
> Just like Vinod said in in v7, the "ret = 0" is redundant.
> 

If the condition passed to wait_event_interruptible_timeout() evaluates
true the remote side has consumed the message and ret will be 1. We end
up in the else block (i.e. not timeout) and we want the function to
return 0, so we set ret to 0.

Please let me know if I'm reading this wrong.

> 
> > +static int qmp_qdss_clk_add(struct qmp *qmp)
> > +{
> > +       struct clk_init_data qdss_init = {
> > +               .ops = &qmp_qdss_clk_ops,
> > +               .name = "qdss",
> > +       };
> 
> As I mentioned in v7, there is no downside in marking qdss_init as
> "static const" and it avoids the compiler inserting a memcpy() to get
> this data on the stack.  Using static const also reduces your stack
> usage.
> 

In which case we would just serve it from .ro, makes sense now that I
read your comment again. 

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
> > +       ret = of_clk_add_hw_provider(qmp->dev->of_node, of_clk_hw_simple_get,
> > +                                    &qmp->qdss_clk);
> 
> I still prefer to devm-ify the whole driver, using
> devm_add_action_or_reset() to handle things where there is no devm.
> ...but I won't insist.
> 
> 
> Above things are just nits and I won't insist.  They also could be
> addressed in follow-up patches.  Thus:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!

Regards,
Bjorn
