From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v6 5/8] soc: qcom: Add AOSS QMP communication driver
Date: Mon, 11 Feb 2019 14:30:26 -0800
Message-ID: <CAD=FV=WDnKgiqP7Ta0xJtm5COTApYQ2DPTcUXH95O7S_vUJBCA@mail.gmail.com>
References: <20190206051335.23799-1-bjorn.andersson@linaro.org> <20190206051335.23799-6-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206051335.23799-6-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Feb 5, 2019 at 9:13 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> +       if (of_property_read_bool(pdev->dev.of_node, "#power-domain-cells")) {
> +               qmp->pd_pdev = platform_device_register_data(&pdev->dev,
> +                                                            "aoss_qmp_pd",
> +                                                            PLATFORM_DEVID_NONE,
> +                                                            NULL, 0);
> +               if (IS_ERR(qmp->pd_pdev)) {
> +                       dev_err(&pdev->dev, "failed to register AOSS PD\n");

nit: not worth spinning just for this, but if you happen to spin you
could print the error number in your message.


> +                       ret = PTR_ERR(qmp->pd_pdev);
> +                       goto err_close_qmp;
> +               }
> +       }

As discussed in v5 I wonder if the complexity of a separate driver is
really worth it or if everything would be a lot easier to just link
the two ".c" files together.  Now that it's a full error case if
"aoss_qmp_pd" doesn't probe I'd vote for linking the two ".c" files
together, but part of that is because I don't really want to dig into
all the details of how you're supposed to call
platform_device_register_data() for sub-devices and double-checking
that you've got all the corner cases correct.

...NOTE: presumably if you just change it to a straight-up function
call then you can also get rid of the above "dev_err" since
(presumably) you'll know that the init code of aoss_qmp_pd will print
any relevant errors?


-Doug
