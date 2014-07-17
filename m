From: pramod gurav <pramod.gurav.etc@gmail.com>
Subject: Re: [PATCH v4 2/3] soc: qcom-rpm: Driver for the Qualcomm RPM
Date: Thu, 17 Jul 2014 23:03:23 +0530
Message-ID: <CAMf-jSnPpo39cXLbM9cefUr37J=hnEHqfJSetORxMnjsdoANdw@mail.gmail.com>
References: <1405465241-28684-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1405465241-28684-3-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1405465241-28684-3-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Wed, Jul 16, 2014 at 4:30 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> Driver for the Resource Power Manager (RPM) found in Qualcomm 8660, 8960
> and 8064 based devices. The driver exposes resources that child drivers
> can operate on; to implementing regulator, clock and bus frequency
> drivers.
>

[snip]

> +       }
> +
> +       ret = irq_set_irq_wake(irq_ack, 1);

This calls fails and throws error on my ifc6410 with 3.16-rc5.
Does this driver depend on pincntrl. Looks like the DT support for
pincntrl driver is missing in apq8064 dts in mainline.
Is that right?

> +       if (ret)
> +               dev_warn(&pdev->dev, "failed to mark ack irq as wakeup\n");
> +

[snip]

> +               return ret;
> +       }
> +
> +       ret = irq_set_irq_wake(irq_wakeup, 1);

This fails as well.

> +       if (ret)
> +               dev_warn(&pdev->dev, "failed to mark wakeup irq as wakeup\n");
> +
> +       return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);

[snip]


-- 
Thanks and Regards
Pramod
