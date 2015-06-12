From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] NFC: nfcmrvl: add UART driver
Date: Thu, 11 Jun 2015 23:06:54 -0500
Message-ID: <CAL_JsqKtCT9wLS5xqHoJ9K_2Y+Tw8g7mP=MSkDBXO9TexHd9pg@mail.gmail.com>
References: <1434024020-17048-1-git-send-email-cuissard@marvell.com> <1434024020-17048-3-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434024020-17048-3-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neil Brown <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding Neil Brown who has been doing a UART slave binding[1].

On Thu, Jun 11, 2015 at 7:00 AM, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> wrote:
> Add support of Marvell NFC chip controlled over UART
>
> Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/net/nfc/nfcmrvl.txt        |  29 +++
>  drivers/nfc/nfcmrvl/Kconfig                        |  11 +
>  drivers/nfc/nfcmrvl/Makefile                       |   3 +
>  drivers/nfc/nfcmrvl/nfcmrvl.h                      |   7 +
>  drivers/nfc/nfcmrvl/uart.c                         | 225 +++++++++++++++++++++
>  include/linux/platform_data/nfcmrvl.h              |   9 +
>  net/nfc/nci/uart.c                                 |   1 -
>  7 files changed, 284 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
>  create mode 100644 drivers/nfc/nfcmrvl/uart.c
>
> diff --git a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
> new file mode 100644
> index 0000000..7c4a0cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
> @@ -0,0 +1,29 @@
> +* Marvell International Ltd. NCI NFC Controller
> +
> +Required properties:
> +- compatible: Should be "mrvl,nfc-uart".

This should describe the chip, not the connection.

marvell is the preferred vendor prefix. mrvl is deprecated.


> +Optional SoC specific properties:
> +- pinctrl-names: Contains only one value - "default".
> +- pintctrl-0: Specifies the pin control groups used for this controller.

What pins are you controlling exactly? The UART signals on the host?

> +- reset-n-io: Output GPIO pin used to reset the chip (active low).

Should be suffixed with "-gpio". Is this reset for the chip or only NFC?

> +- hci-muxed: Specifies that the chip is muxing NCI over HCI frames.
> +
> +Optional UART-based chip specific properties:
> +- flow-control: Specifies that the chip is using RTS/CTS.

Is this a setting in the NFC chip or just how the UART is configured.
If the latter, we already have standard UART property to enable
flow-control on a UART.

> +- break-control: Specifies that the chip needs specific break management.

Can you be more specific?

> +
> +Example (for ARM-based BeagleBoard Black with 88W8887 on UART5):
> +
> +&uart5 {
> +       status = "okay";
> +
> +       nfcmrvluart: nfcmrvluart@5 {

Unit addresses should have a corresponding reg property. You don't
need a reg property here, so drop the unit address. Names should allow
be generic, so just "nfc" is probably sufficient here. Or maybe
"uart-slave".

How are you doing the binding for the rest of the 8887 chip which has
also has BT and WiFi. We need to figure out how to do the whole chip
which is a bit more complicated, but quite common. We could split up
each function, but then I worry that there may be some
interdependencies between functions on the chip.

> +               compatible = "mrvl,nfc-uart";
> +
> +               reset-n-io = <&gpio3 16 0>;
> +
> +               hci-muxed;
> +               flow-control;
> +        }
> +};

Rob

[1] https://lwn.net/Articles/643878/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
