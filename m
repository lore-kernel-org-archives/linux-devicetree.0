From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/7] soc: qcom: Add AOSS QMP communication driver
Date: Mon, 14 Jan 2019 15:20:31 -0800
Message-ID: <20190114232031.GD9278@minitux>
References: <20190106080915.4493-1-bjorn.andersson@linaro.org>
 <20190106080915.4493-3-bjorn.andersson@linaro.org>
 <154750540229.169631.4962369801600780946@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154750540229.169631.4962369801600780946@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 14 Jan 14:36 PST 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-01-06 00:09:10)
> > diff --git a/drivers/soc/qcom/aoss-qmp.c b/drivers/soc/qcom/aoss-qmp.c
> > new file mode 100644
> > index 000000000000..de52703b96b6
> > --- /dev/null
> > +++ b/drivers/soc/qcom/aoss-qmp.c
> > @@ -0,0 +1,313 @@
> [...]
> > +
> > +static int qmp_probe(struct platform_device *pdev)
> > +{
> > +       struct resource *res;
> > +       struct qmp *qmp;
> > +       int irq;
> > +       int ret;
> > +
> > +       qmp = devm_kzalloc(&pdev->dev, sizeof(*qmp), GFP_KERNEL);
> > +       if (!qmp)
> > +               return -ENOMEM;
> > +
> > +       qmp->dev = &pdev->dev;
> > +       init_waitqueue_head(&qmp->event);
> > +       mutex_init(&qmp->tx_lock);
> > +
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       qmp->msgram = devm_ioremap_resource(&pdev->dev, res);
> > +       if (IS_ERR(qmp->msgram))
> > +               return PTR_ERR(qmp->msgram);
> > +
> > +       qmp->mbox_client.dev = &pdev->dev;
> > +       qmp->mbox_client.knows_txdone = true;
> > +       qmp->mbox_chan = mbox_request_channel(&qmp->mbox_client, 0);
> > +       if (IS_ERR(qmp->mbox_chan)) {
> > +               dev_err(&pdev->dev, "failed to acquire ipc mailbox\n");
> > +               return PTR_ERR(qmp->mbox_chan);
> > +       }
> > +
> > +       irq = platform_get_irq(pdev, 0);
> > +       ret = devm_request_irq(&pdev->dev, irq, qmp_intr, IRQF_ONESHOT,
> > +                              "aoss-qmp", qmp);
> > +       if (ret < 0) {
> > +               dev_err(&pdev->dev, "failed to request interrupt\n");
> 
> Don't we need to free_mbox_channel() all over the place here?
> 

We do, thanks for spotting this.

[..]
> > diff --git a/include/linux/soc/qcom/aoss-qmp.h b/include/linux/soc/qcom/aoss-qmp.h
> > new file mode 100644
> > index 000000000000..32ccaa091a9f
> > --- /dev/null
> > +++ b/include/linux/soc/qcom/aoss-qmp.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2018, Linaro Ltd
> > + */
> > +#ifndef __AOP_QMP_H__
> > +#define __AOP_QMP_H__
> 
> include <linux/types.h> for size_t usage?
> 

That wouldn't hurt.

> > +
> > +struct qmp;
> > +
> > +int qmp_send(struct qmp *qmp, const void *data, size_t len);
> > +

Thanks,
Bjorn
