From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: Add document of Rockchip mailbox
Date: Tue, 6 Oct 2015 09:50:16 -0500
Message-ID: <CAL_Jsq+36CqbUnccU_LKgmeswoPgr0vBzh4PLM4nOtsCAYE0SA@mail.gmail.com>
References: <1442228798-15191-1-git-send-email-wxt@rock-chips.com> <1442228798-15191-2-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442228798-15191-2-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jaswinder Singh <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 14, 2015 at 6:06 AM, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> This add the necessary binding documentation for mailbox
> found on RK3368 SoC.
>
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>
>  .../bindings/mailbox/rockchip-mailbox.txt          | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt
>
> diff --git a/Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt b/Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt
> new file mode 100644
> index 0000000..b9b4768
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt
> @@ -0,0 +1,33 @@
> +Rockchip mailbox
> +
> +The Rockchip mailbox is used by the Rockchip CPU cores to communicate
> +requests to MCU processor.
> +
> +Refer to ./mailbox.txt for generic information about mailbox device-tree
> +bindings.
> +
> +Required properties:
> +
> + - compatible: should be one of the following.
> +   - "rockchip,rk3368-mbox" for rk3368
> + - reg: physical base address of the controller and length of memory mapped
> +       region.
> +       physical base address of the share buffer and length of memory mapped

s/share/shared/

> +       region.
> + - interrupts: The interrupt number to the cpu. The interrupt specifier format
> +       depends on the interrupt controller.

Need to specify the value of #mbox-cells.

> +
> +Example:
> +--------
> +
> +/* RK3368 */
> +mbox: mbox@ff6b0000 {
> +       compatible = "rockchip,rk3368-mailbox";
> +       reg = <0x0 0xff6b0000 0x0 0x1000>,
> +             <0x0 0xff8cf000 0x0 0x1000>; /* the end 4k of sram */

If this is just onchip SRAM usable for anything, then use the SRAM
binding (misc/sram.txt). It has provisions for defining the use.

> +       interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +                    <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +                    <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +                    <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> +       #mbox-cells = <1>;
> +};
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
