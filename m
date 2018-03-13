From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 3/3] Bluetooth: hci_qca: Add serdev support
Date: Tue, 13 Mar 2018 18:50:39 +0200
Message-ID: <CAHp75Vc0hgh89JABVPHJO+RaNqkY_RpsytkDWf=F+Dh=XtZprg@mail.gmail.com>
References: <20180313164444.19881-1-thierry.escande@linaro.org> <20180313164444.19881-4-thierry.escande@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313164444.19881-4-thierry.escande@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Escande <thierry.escande@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2018 at 6:44 PM, Thierry Escande
<thierry.escande@linaro.org> wrote:
> Add support for Qualcomm serial slave devices. Probe the serial device,
> retrieve its maximum speed and register a new hci uart device.

> +#include <linux/of.h>

What exactly this is used for?

> +       qcadev->bt_en = devm_gpiod_get(&serdev->dev, "bt-disable-n",
> +                                      GPIOD_OUT_LOW);
> +       if (IS_ERR(qcadev->bt_en)) {
> +               dev_err(&serdev->dev, "failed to acquire bt-disable-n gpio\n");
> +               return PTR_ERR(qcadev->bt_en);
> +       }

> +       gpiod_set_value(qcadev->bt_en, 0);

Redundant.

> +       clk_set_rate(qcadev->divclk4, DIVCLK4_RATE_32KHZ);

> +       clk_prepare_enable(qcadev->divclk4);

This may fail.

> +       return hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
> +}

> +       clk_disable(qcadev->divclk4);
> +       clk_unprepare(qcadev->divclk4);

One call.

> +}

> +static const struct of_device_id qca_bluetooth_of_match[] = {
> +       { .compatible = "qcom,qca6174-bt" },

> +       { },

No comma.

> +};

-- 
With Best Regards,
Andy Shevchenko
