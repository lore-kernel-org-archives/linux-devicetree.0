Return-Path: <SRS0=skGX=WE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730678AbfHHPJC (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 8 Aug 2019 11:09:02 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190726092332.25202-5-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org> <20190726092332.25202-5-govinds@codeaurora.org>
Subject: Re: [PATCH v5 4/7] clk: qcom: Add Q6SSTOP clock controller for QCS404
From: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 08 Aug 2019 08:09:00 -0700
Message-Id: <20190808150901.D6C932184E@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Govind Singh (2019-07-26 02:23:29)
> diff --git a/drivers/clk/qcom/q6sstop-qcs404.c b/drivers/clk/qcom/q6sstop=
-qcs404.c
> new file mode 100644
> index 000000000000..b6281986b077
> --- /dev/null
> +++ b/drivers/clk/qcom/q6sstop-qcs404.c
> @@ -0,0 +1,223 @@
[...]
> +};
> +
> +static struct platform_driver q6sstopcc_qcs404_driver =3D {
> +       .probe          =3D q6sstopcc_qcs404_probe,
> +       .remove         =3D q6sstopcc_qcs404_remove,
> +       .driver         =3D {
> +               .name   =3D "qcs404-q6sstopcc",
> +               .of_match_table =3D q6sstopcc_qcs404_match_table,
> +       .pm =3D &q6sstopcc_pm_ops,

This got some weird indent.

> +       },
> +};
> +
> +module_platform_driver(q6sstopcc_qcs404_driver);
> +
> +MODULE_DESCRIPTION("QTI QCS404 Q6SSTOP Clock Controller Driver");
> +MODULE_LICENSE("GPL v2");
