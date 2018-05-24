From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/4] pinctrl: msm: fix gpio-hog related boot issues
Date: Thu, 24 May 2018 10:04:14 +0200
Message-ID: <CACRpkdZ_HODTLc65kpE011=VWRkC9g5W04=NXWczozenobUcGA@mail.gmail.com>
References: <910e5a85a6a8020069996e2ff397c93e9c5fe18c.1526935804.git.chunkeey@gmail.com>
 <270904bcbf03a6b6ac3150f4a7daa15aa7e97586.1526935804.git.chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <270904bcbf03a6b6ac3150f4a7daa15aa7e97586.1526935804.git.chunkeey@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Brown <david.brown@linaro.org>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Andy Gross <andy.gross@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 21, 2018 at 10:57 PM, Christian Lamparter
<chunkeey@gmail.com> wrote:

> Sven Eckelmann reported an issue with the current IPQ4019 pinctrl.
> Setting up any gpio-hog in the device-tree for his device would
> "kill the bootup completely":
>
> | [    0.477838] msm_serial 78af000.serial: could not find pctldev for node /soc/pinctrl@1000000/serial_pinmux, deferring probe
> | [    0.499828] spi_qup 78b5000.spi: could not find pctldev for node /soc/pinctrl@1000000/spi_0_pinmux, deferring probe
> | [    1.298883] requesting hog GPIO enable USB2 power (chip 1000000.pinctrl, offset 58) failed, -517
> | [    1.299609] gpiochip_add_data: GPIOs 0..99 (1000000.pinctrl) failed to register
> | [    1.308589] ipq4019-pinctrl 1000000.pinctrl: Failed register gpiochip
> | [    1.316586] msm_serial 78af000.serial: could not find pctldev for node /soc/pinctrl@1000000/serial_pinmux, deferring probe
> | [    1.322415] spi_qup 78b5000.spi: could not find pctldev for node /soc/pinctrl@1000000/spi_0_pinmux, deferri
>
> This was also verified on a RT-AC58U (IPQ4018) which would
> no longer boot, if a gpio-hog was specified. (Tried forcing
> the USB LED PIN (GPIO0) to high.).
>
> The problem is that Pinctrl+GPIO registration is currently
> peformed in the following order in pinctrl-msm.c:
>         1. pinctrl_register()
>         2. gpiochip_add()
>         3. gpiochip_add_pin_range()
>
> The actual error code -517 == -EPROBE_DEFER is coming from
> pinctrl_get_device_gpio_range(), which is called through:
>         gpiochip_add
>             of_gpiochip_add
>                 of_gpiochip_scan_gpios
>                     gpiod_hog
>                         gpiochip_request_own_desc
>                             __gpiod_request
>                                 chip->request
>                                     gpiochip_generic_request
>                                        pinctrl_gpio_request
>                                           pinctrl_get_device_gpio_range
>
> pinctrl_get_device_gpio_range() is unable to find any valid
> pin ranges, since nothing has been added to the pinctrldev_list yet.
> so the range can't be found, and the operation fails with -EPROBE_DEFER.
>
> This patch fixes the issue by adding the "gpio-ranges" property to
> the pinctrl device node of all upstream Qcom SoC. The pin ranges are
> then added by the gpio core.
>
> In order to remain compatible with older, existing DTs (and ACPI)
> a check for the "gpio-ranges" property has been added to
> msm_gpio_init(). This prevents the driver of adding the same entry
> to the pinctrldev_list twice.
>
> Reported-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> Tested-by: Sven Eckelmann <sven.eckelmann@openmesh.com> [ipq4019]
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

Patch applied.

Yours,
Linus Walleij
