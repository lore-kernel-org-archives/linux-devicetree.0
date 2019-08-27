From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCHv6] drivers/amba: add reset control to amba bus probe
Date: Tue, 27 Aug 2019 16:20:32 +0200
Message-ID: <1566915632.4102.19.camel@pengutronix.de>
References: <20190827141153.20254-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827141153.20254-1-dinguyen@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux@armlinux.org.uk, frowand.list@gmail.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com, daniel.thompson@linaro.org, linus.walleij@linaro.org, manivannan.sadhasivam@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-08-27 at 09:11 -0500, Dinh Nguyen wrote:
> The primecell controller on some SoCs, i.e. SoCFPGA, is held in reset by
> default. Until recently, the DMA controller was brought out of reset by the
> bootloader(i.e. U-Boot). But a recent change in U-Boot, the peripherals
> that are not used are held in reset and are left to Linux to bring them
> out of reset.
> 
> Add a mechanism for getting the reset property and de-assert the primecell
> module from reset if found. This is a not a hard fail if the reset properti
> is not present in the device tree node, so the driver will continue to
> probe.
> 
> Because there are different variants of the controller that may have
> multiple reset signals, the code will find all reset(s) specified and
> de-assert them.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v6: remove the need to reset_control_get_count as
>     of_reset_control_array_get_optional_shared is already doing that
> v5: use of_reset_control_array_get_optional_shared()
> v4: cleaned up indentation in loop
>     fix up a few checkpatch warnings
>     add Reviewed-by:
> v3: add a reset_control_put()
>     add error handling
> v2: move reset control to bus code
>     find all reset properties and de-assert them
> ---
>  drivers/amba/bus.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
> index 100e798a5c82..f39f075abff9 100644
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
> @@ -401,6 +402,19 @@ static int amba_device_try_add(struct amba_device *dev, struct resource *parent)
>  	ret = amba_get_enable_pclk(dev);
>  	if (ret == 0) {
>  		u32 pid, cid;
> +		struct reset_control *rstc;
> +
> +		/*
> +		 * Find reset control(s) of the amba bus and de-assert them.
> +		 */
> +		rstc = of_reset_control_array_get_optional_shared(dev->dev.of_node);
> +		if (IS_ERR(rstc)) {
> +			if (PTR_ERR(rstc) != -EPROBE_DEFER)
> +				dev_err(&dev->dev, "Can't get amba reset!\n");
> +			return PTR_ERR(rstc);
> +		}
> +		reset_control_deassert(rstc);
> +		reset_control_put(rstc);
>  
>  		/*
>  		 * Read pid and cid based on size of resource

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
