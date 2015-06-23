From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/2] mfd: add Marvell 88pm88x description
Date: Tue, 23 Jun 2015 09:31:00 -0500
Message-ID: <CAL_JsqKjNdtp1A7LqqnjAnGPmCu-fwum6D9EPOoaVF0C=DacTw@mail.gmail.com>
References: <1434098601-3498-1-git-send-email-yizhang@marvell.com> <1434098601-3498-2-git-send-email-yizhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434098601-3498-2-git-send-email-yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Qiao Zhou <zhouqiao-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, zhenzh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 12, 2015 at 3:43 AM, Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> wrote:
> 88pm880 and 88pm886 are two combo PMIC chips, most of the function and the
> register mapping are the same

How do they compare to 80x/822/860 PMICs?

>
> Signed-off-by: Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/88pm88x.txt | 33 +++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/88pm88x.txt
>
> diff --git a/Documentation/devicetree/bindings/mfd/88pm88x.txt b/Documentation/devicetree/bindings/mfd/88pm88x.txt
> new file mode 100644
> index 0000000..72e741c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/88pm88x.txt
> @@ -0,0 +1,33 @@
> +Marvell 88pm88x combo PMIC chip
> +
> +This series of chip integrates regulator, rtc, onkey, switch charger,
> +fuelgauge, gpadc and a range of I/O pins.
> +
> +88pm886 and 88pm880 are two very similar chips, most of the registers mapping
> +and functions are the same, the main difference is the latter has a separate
> +i2c slave address to cover BUCK related setting
> +
> +Required properties:
> +- compatible: one of the strings for a specific chip:
> +  "marvell,88pm886"
> +  "marvell,88pm880"
> +- reg: the i2c address
> +- interrupt-controller: it works as an interrupt controller managing its irqs
> +- interrupt-cells: this value is 1
> +
> +Optional properties:
> +- marvell,88pm88x-irq-write-clear: the interrupt ack method

The 80x/860 binding needs the same property. Please coordinate this
with Vaibhav.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
