Return-Path: <SRS0=YHXO=GN=google.com=dianders@kernel.org>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1521836461-6515-4-git-send-email-kramasub@codeaurora.org>
References: <1521836461-6515-1-git-send-email-kramasub@codeaurora.org> <1521836461-6515-4-git-send-email-kramasub@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Mar 2018 16:34:22 -0700
Message-ID: <CAD=FV=VGcttQ6H1-Hnqj+Jrk+eaE52bOna6NojG5DoQ--A5aEg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] i2c: i2c-qcom-geni: Add bus driver for the
 Qualcomm GENI I2C controller
Content-Type: text/plain; charset="UTF-8"
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

On Fri, Mar 23, 2018 at 1:20 PM, Karthikeyan Ramasubramanian
<kramasub@codeaurora.org> wrote:
> This bus driver supports the GENI based i2c hardware controller in the
> Qualcomm SOCs. The Qualcomm Generic Interface (GENI) is a programmable
> module supporting a wide range of serial interfaces including I2C. The
> driver supports FIFO mode and DMA mode of transfer and switches modes
> dynamically depending on the size of the transfer.
>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> ---
>  drivers/i2c/busses/Kconfig         |  13 +
>  drivers/i2c/busses/Makefile        |   1 +
>  drivers/i2c/busses/i2c-qcom-geni.c | 650 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 664 insertions(+)

[...]

> +/*
> + * Hardware uses the underlying formula to calculate time periods of
> + * SCL clock cycle. Firmware uses some additional cycles excluded from the
> + * below formula and it is confirmed that the time periods are within
> + * specification limits.

I was hoping for more than just "oh, and there's a fudge factor", but
I guess this is the best I'm going to get?


> +static int geni_i2c_probe(struct platform_device *pdev)
> +{
> +       struct geni_i2c_dev *gi2c;
> +       struct resource *res;
> +       u32 proto, tx_depth;
> +       int ret;
> +
> +       gi2c = devm_kzalloc(&pdev->dev, sizeof(*gi2c), GFP_KERNEL);
> +       if (!gi2c)
> +               return -ENOMEM;
> +
> +       gi2c->se.dev = &pdev->dev;
> +       gi2c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       gi2c->se.base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(gi2c->se.base))
> +               return PTR_ERR(gi2c->se.base);
> +
> +       gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
> +       if (IS_ERR(gi2c->se.clk)) {
> +               ret = PTR_ERR(gi2c->se.clk);
> +               dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret = device_property_read_u32(&pdev->dev, "clock-frequency",
> +                                                       &gi2c->clk_freq_out);
> +       if (ret) {
> +               /* Clock frequency not specified, so default to 100kHz. */
> +               dev_info(&pdev->dev,
> +                       "Bus frequency not specified, default to 100kHz.\n");

If you happen to spin again, can you remove the comment since it's
obvious from the string in the print?  It looks a lot like this code:

/* Print hello, world */
printf("hello, world\n");


In any case, that's a pretty minor nit, so I'll add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...assuming that the bindings and "geni" code get Acked / landed
somewhere.  Ideally let's not land this before the geni code lands
since if the geni API changes for some reason it'll cause us grief.


-Doug
