From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCHv4 1/1] drivers/amba: add reset control to amba bus probe
Date: Fri, 23 Aug 2019 11:19:42 +0200
Message-ID: <CACRpkdasbXuqUkO3NjMGBU_ePEBT23BS1eP-bigB0_g494LgvQ@mail.gmail.com>
References: <20190820145834.7301-1-dinguyen@kernel.org> <20190820145834.7301-2-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820145834.7301-2-dinguyen@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Frank Rowand <frowand.list@gmail.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Daniel Thompson <daniel.thompson@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 4:58 PM Dinh Nguyen <dinguyen@kernel.org> wrote:

> @@ -401,6 +402,26 @@ static int amba_device_try_add(struct amba_device *dev, struct resource *parent)
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
> +                       if (IS_ERR(rstc)) {
> +                               if (PTR_ERR(rstc) == -EPROBE_DEFER)
> +                                       ret = -EPROBE_DEFER;
> +                               else
> +                                       dev_err(&dev->dev, "Can't get amba reset!\n");
> +                               break;
> +                       }
> +                       reset_control_deassert(rstc);
> +                       reset_control_put(rstc);
> +                       count--;
> +               }

I'm not normally a footprint person, but the looks of the stubs in
<linux/reset.h> makes me suspicious whether this will have zero impact
in size on platforms without reset controllers.

Can you just ls -al on the kernel without CONFIG_RESET_CONTROLLER
before and after this patch and ascertain that it has zero footprint effect?

If it doesn't I'd sure like to break this into its own function and
stick a if (!IS_ENABLED(CONFIG_RESET_CONTROLLER)) return 0;
in there to make sure the compiler drops it.

Also it'd be nice to get Philipp's ACK on the semantics, though they
look correct to me.

Yours,
Linus Walleij
