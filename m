From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v3 1/6] pinctrl: qcom: ipq4019: Add IPQ4019 pinctrl support
Date: Sun, 14 Feb 2016 16:41:12 -0800
Message-ID: <CAJAp7Oib4xJEHoxiwwGhOhcD3WG4AfdCGGVNqmit+Y6LGnkgoA@mail.gmail.com>
References: <1447975173-29485-1-git-send-email-mmcclint@qca.qualcomm.com>
	<1447975173-29485-2-git-send-email-mmcclint@qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447975173-29485-2-git-send-email-mmcclint@qca.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew McClintock <mmcclint@qca.qualcomm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Gross <agross@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Varadarajan Narayanan <varada@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, qca-upstream.external@qca.qualcomm.com, Sricharan R <sricharan@codeaurora.org>, Mathieu Olivari <mathieu@codeaurora.org>, Matthew McClintock <mmcclint@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 19, 2015 at 3:19 PM, Matthew McClintock
<mmcclint@qca.qualcomm.com> wrote:
> From: Varadarajan Narayanan <varada@codeaurora.org>
>
> Add pinctrl driver support for IPQ4019 platform
>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
> ---

I was asked to review this, to make sure that Linus wasn't waiting for
my ack or anything. But now I see that you have not added him as a
recipient. Please make sure to run ./scripts/get_maintainer.pl and
pick appropriate recipients in the future.

>
> v3
> - update example with actual values from dts
> - add missing pins 71-99
> - drop many functions and stick to basic functionality
>

I hope to see a patch later on adding all those functions back, but
that's fine with me.

[..]

> +static struct platform_driver ipq4019_pinctrl_driver = {
> +       .driver = {
> +               .name = "ipq4019-pinctrl",
> +               .owner = THIS_MODULE,

platform_drivers do get their .owner assigned by platform_drive_register().

> +               .of_match_table = ipq4019_pinctrl_of_match,
> +       },
> +       .probe = ipq4019_pinctrl_probe,
> +       .remove = msm_pinctrl_remove,
> +};

Part of the .owner above you have my
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

@Linus, this still applies and builds cleanly on linux-next.
Would you be okay dropping the owner assignment while applying this patch?

Regards,
Bjorn
