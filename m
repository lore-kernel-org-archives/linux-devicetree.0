From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v8 2/4] soc: qcom: Add AOSS QMP driver
Date: Fri, 31 May 2019 15:24:00 -0700
Message-ID: <CAD=FV=V=_ozPiTvT-Fnrc1a+qfHYi3ynNn8cbw9ibqfKk7Am_w@mail.gmail.com>
References: <20190531030057.18328-1-bjorn.andersson@linaro.org> <20190531030057.18328-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531030057.18328-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, May 30, 2019 at 8:01 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +/**
> + * qmp_send() - send a message to the AOSS
> + * @qmp: qmp context
> + * @data: message to be sent
> + * @len: length of the message
> + *
> + * Transmit @data to AOSS and wait for the AOSS to acknowledge the message.
> + * @len must be a multiple of 4 and not longer than the mailbox size. Access is
> + * synchronized by this implementation.
> + *
> + * Return: 0 on success, negative errno on failure
> + */
> +static int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +{
> +       int ret;
> +
> +       if (WARN_ON(len + sizeof(u32) > qmp->size))
> +               return -EINVAL;
> +
> +       if (WARN_ON(len % sizeof(u32)))
> +               return -EINVAL;
> +
> +       mutex_lock(&qmp->tx_lock);
> +
> +       /* The message RAM only implements 32-bit accesses */
> +       __iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
> +                        data, len / sizeof(u32));
> +       writel(len, qmp->msgram + qmp->offset);
> +       qmp_kick(qmp);
> +
> +       ret = wait_event_interruptible_timeout(qmp->event,
> +                                              qmp_message_empty(qmp), HZ);
> +       if (!ret) {
> +               dev_err(qmp->dev, "ucore did not ack channel\n");
> +               ret = -ETIMEDOUT;
> +
> +               /* Clear message from buffer */
> +               writel(0, qmp->msgram + qmp->offset);
> +       } else {
> +               ret = 0;
> +       }

Just like Vinod said in in v7, the "ret = 0" is redundant.


> +static int qmp_qdss_clk_add(struct qmp *qmp)
> +{
> +       struct clk_init_data qdss_init = {
> +               .ops = &qmp_qdss_clk_ops,
> +               .name = "qdss",
> +       };

As I mentioned in v7, there is no downside in marking qdss_init as
"static const" and it avoids the compiler inserting a memcpy() to get
this data on the stack.  Using static const also reduces your stack
usage.


> +       int ret;
> +
> +       qmp->qdss_clk.init = &qdss_init;
> +       ret = clk_hw_register(qmp->dev, &qmp->qdss_clk);
> +       if (ret < 0) {
> +               dev_err(qmp->dev, "failed to register qdss clock\n");
> +               return ret;
> +       }
> +
> +       ret = of_clk_add_hw_provider(qmp->dev->of_node, of_clk_hw_simple_get,
> +                                    &qmp->qdss_clk);

I still prefer to devm-ify the whole driver, using
devm_add_action_or_reset() to handle things where there is no devm.
...but I won't insist.


Above things are just nits and I won't insist.  They also could be
addressed in follow-up patches.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
