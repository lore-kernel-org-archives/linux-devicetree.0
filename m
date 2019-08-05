From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCHv2] drivers/amba: add reset control to primecell probe
Date: Mon, 5 Aug 2019 09:54:34 -0600
Message-ID: <CAL_JsqKUK+AQiy8jZ_aWuSsHMb5nSFJpiDMUAYbmK6pvc0p1_w@mail.gmail.com>
References: <20190805145211.23161-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190805145211.23161-1-dinguyen@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 5, 2019 at 8:52 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
>
> The primecell controller on some SoCs, i.e. SoCFPGA, is held in reset by
> default. Until recently, the DMA controller was brought out of reset by the
> bootloader(i.e. U-Boot). But a recent change in U-Boot, the peripherals that
> are not used are held in reset and are left to Linux to bring them out of
> reset.
>
> Add a mechanism for getting the reset property and de-assert the primecell
> module from reset if found. This is a not a hard fail if the reset property
> is not present in the device tree node, so the driver will continue to probe.
>
> Because there are different variants of the controller that may have multiple
> reset signals, the code will find all reset(s) specified and de-assert them.
>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v2: move reset control to bus code
>     find all reset properties and de-assert them
> ---
>  drivers/amba/bus.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
> index 100e798a5c82..75e18b9e4808 100644
> --- a/drivers/amba/bus.c
> +++ b/drivers/amba/bus.c
> @@ -18,6 +18,7 @@
>  #include <linux/limits.h>
>  #include <linux/clk/clk-conf.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>
>  #include <asm/irq.h>
>
> @@ -401,6 +402,18 @@ static int amba_device_try_add(struct amba_device *dev, struct resource *parent)
>         ret = amba_get_enable_pclk(dev);
>         if (ret == 0) {
>                 u32 pid, cid;
> +               int count;
> +               struct reset_control *rstc;
> +
> +               /*
> +                * Find reset control(s) of the amba bus and de-assert them.
> +                */
> +               count = reset_control_get_count(&dev->dev);
> +               while (count > 0) {
> +                       rstc = of_reset_control_get_shared_by_index(dev->dev.of_node, count - 1);
> +                       reset_control_deassert(rstc);
> +                       count--;
> +               }

Aren't you going to need a put somewhere?

And then there's the fun possibility of deferred probe which could
happen on any of the resets.

Rob
