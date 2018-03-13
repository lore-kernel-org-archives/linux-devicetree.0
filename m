From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 3/3] Bluetooth: hci_qca: Add serdev support
Date: Tue, 13 Mar 2018 22:57:57 +0200
Message-ID: <CAHp75Vc0oka68fZv6tm6zrtZEH+5hRmD+PmmG5bc0EgPQHGuTQ@mail.gmail.com>
References: <20180313183807.6701-1-thierry.escande@linaro.org> <20180313183807.6701-4-thierry.escande@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313183807.6701-4-thierry.escande@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Escande <thierry.escande@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2018 at 8:38 PM, Thierry Escande
<thierry.escande@linaro.org> wrote:
> Add support for Qualcomm serial slave devices. Probe the serial device,
> retrieve its maximum speed and register a new hci uart device.

>  config BT_HCIUART_QCA
>         bool "Qualcomm Atheros protocol support"
> -       depends on BT_HCIUART
> +       depends on BT_HCIUART_SERDEV

Consider to address Loic's comments.

> +#include <linux/of.h>

This is still here. Why?

-- 
With Best Regards,
Andy Shevchenko
