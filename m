From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 2/7] soc: qcom: Add AOSS QMP communication driver
Date: Mon, 14 Jan 2019 14:36:42 -0800
Message-ID: <154750540229.169631.4962369801600780946@swboyd.mtv.corp.google.com>
References: <20190106080915.4493-1-bjorn.andersson@linaro.org> <20190106080915.4493-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190106080915.4493-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-01-06 00:09:10)
> diff --git a/drivers/soc/qcom/aoss-qmp.c b/drivers/soc/qcom/aoss-qmp.c
> new file mode 100644
> index 000000000000..de52703b96b6
> --- /dev/null
> +++ b/drivers/soc/qcom/aoss-qmp.c
> @@ -0,0 +1,313 @@
[...]
> +
> +static int qmp_probe(struct platform_device *pdev)
> +{
> +       struct resource *res;
> +       struct qmp *qmp;
> +       int irq;
> +       int ret;
> +
> +       qmp =3D devm_kzalloc(&pdev->dev, sizeof(*qmp), GFP_KERNEL);
> +       if (!qmp)
> +               return -ENOMEM;
> +
> +       qmp->dev =3D &pdev->dev;
> +       init_waitqueue_head(&qmp->event);
> +       mutex_init(&qmp->tx_lock);
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       qmp->msgram =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(qmp->msgram))
> +               return PTR_ERR(qmp->msgram);
> +
> +       qmp->mbox_client.dev =3D &pdev->dev;
> +       qmp->mbox_client.knows_txdone =3D true;
> +       qmp->mbox_chan =3D mbox_request_channel(&qmp->mbox_client, 0);
> +       if (IS_ERR(qmp->mbox_chan)) {
> +               dev_err(&pdev->dev, "failed to acquire ipc mailbox\n");
> +               return PTR_ERR(qmp->mbox_chan);
> +       }
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       ret =3D devm_request_irq(&pdev->dev, irq, qmp_intr, IRQF_ONESHOT,
> +                              "aoss-qmp", qmp);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "failed to request interrupt\n");

Don't we need to free_mbox_channel() all over the place here?

> +               return ret;
> +       }
> +
> +       ret =3D qmp_open(qmp);
> +       if (ret < 0)
> +               return ret;
> +
> +       platform_set_drvdata(pdev, qmp);
> +
> +       if (of_property_read_bool(pdev->dev.of_node, "#power-domain-cells=
")) {
> +               qmp->pd_pdev =3D platform_device_register_data(&pdev->dev,
> +                                                            "aoss_qmp_pd=
",
> +                                                            PLATFORM_DEV=
ID_NONE,
> +                                                            NULL, 0);
> +               if (IS_ERR(qmp->pd_pdev))
> +                       dev_err(&pdev->dev, "failed to register AOSS PD\n=
");
> +       }
> +
> +       return 0;
> +}
[...]
> diff --git a/include/linux/soc/qcom/aoss-qmp.h b/include/linux/soc/qcom/a=
oss-qmp.h
> new file mode 100644
> index 000000000000..32ccaa091a9f
> --- /dev/null
> +++ b/include/linux/soc/qcom/aoss-qmp.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018, Linaro Ltd
> + */
> +#ifndef __AOP_QMP_H__
> +#define __AOP_QMP_H__

include <linux/types.h> for size_t usage?

> +
> +struct qmp;
> +
> +int qmp_send(struct qmp *qmp, const void *data, size_t len);
> +
