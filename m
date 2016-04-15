From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] pinctrl: iproc: Allow certain PINCONF functions to be disabled
Date: Fri, 15 Apr 2016 10:20:47 +0200
Message-ID: <CACRpkdbgpPZrJ-HWF32CEuMT7Ua=Du6KrfZ5ya__Zw-Lf-XM+Q@mail.gmail.com>
References: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
	<1460506523-6249-3-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1460506523-6249-3-git-send-email-ray.jui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pramod Kumar <pramodku@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 13, 2016 at 2:15 AM, Ray Jui <ray.jui@broadcom.com> wrote:

> The iProc GPIO controller is shared among multiple iProc based SoCs. In
> some of these SoCs, certain PINCONF functions are disabled and registers
> associated with these functions are reserved. This patch adds support to
> the iProc GPIO/PINCOF driver to allow these unsupported functions to be

^PINCONF

> disabled through device tree property 'brcm,pinconf-func-off'. Without
> disabling these unsupported PINCONF functions, user can potentially
> access these functions through sysfs debug entries; as a result, these
> reserved registers can be accessed
>
> This patch is developed based on the initial work from Yendapally Reddy
> Dhananjaya <yrdreddy@broadcom.com> who attempted to disable drive
> strength configuration for the iProc based NSP chip. In addition,
> Pramod Kumar <pramodku@broadcom.com> also contributed to make the
> support more generic across all currently supported PINCONF functions in
> the iProc GPIO/PINCONF driver
>
> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Reviewed-by: Jon Mason <jon.mason@broadcom.com>
> Reviewed-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>

OK I see. Hm I think it is better to use a per-soc compatible string
like Rob Herring indicates to determine if we should loose these
pin config parameters. Does it seem reasonable to you?

I'm thinking that it is a property of how the hardware was synthesized
in that SoC so since it is a different version of the hardware it should
have a unique compatible string.

> +/*
> + * Bit position for PINCONF functions to be disabled for a given iProc SoC
> + */
> +#define IPROC_PIN_DRIVE_STRENGTH        0
> +#define IPROC_PIN_BIAS_DISABLE          1
> +#define IPROC_PIN_BIAS_PULL_UP          2
> +#define IPROC_PIN_BIAS_PULL_DOWN        3
> +
> +/*
> + * Bit mask for DT property "brcm,pinconf-func-off"
> + */
> +#define IPROC_PIN_OFF_DRIVE_STRENGTH    (1 << IPROC_PIN_DRIVE_STRENGTH)
> +#define IPROC_PIN_OFF_BIAS_DISABLE      (1 << IPROC_PIN_BIAS_DISABLE)
> +#define IPROC_PIN_OFF_BIAS_PULL_UP      (1 << IPROC_PIN_BIAS_PULL_UP)
> +#define IPROC_PIN_OFF_BIAS_PULL_DOWN    (1 << IPROC_PIN_BIAS_PULL_DOWN)
> +
> +#endif

So this stuff should not be in the device tree, the driver should know,
from the compatible string, what config options that are unavailable.

Then if someone tries to use that in the DT, they should get an
error code -ENOTSUPP, but AFAICT that is what the patch achieves.

Yours,
Linus Walleij
