From: sundeep subbaraya <sundeep.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] usb: doc: udc-xilinx: Add devicetree bindings
Date: Tue, 24 Jun 2014 12:14:10 +0530
Message-ID: <CALHRZup3_eFiw8iSJJmxy0dHDeHLnb2fAfRtKPTW1UQ2U+cEig@mail.gmail.com>
References: <b0dfcba4-7319-4687-a455-bfcddf61b7d1@BN1AFFO11FD028.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b0dfcba4-7319-4687-a455-bfcddf61b7d1-reflc3kr++MpSWDJVTaHWOhlVc3/7hDbVaz/vdPVXQ4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ping

Thanks,
Sundeep.B.S.

On Tue, Jun 10, 2014 at 5:34 PM,  <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> From: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>
> Add devicetree bindings for Xilinx axi udc driver.
>
> Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes for v3:
>         - None
> Changes for v2:
>         - replaced xlnx,include-dma with xlnx,has-builtin-dma
>
>  .../devicetree/bindings/usb/udc-xilinx.txt         |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/udc-xilinx.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/udc-xilinx.txt b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
> new file mode 100644
> index 0000000..7c24fac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
> @@ -0,0 +1,20 @@
> +Xilinx AXI USB2 device controller
> +
> +Required properties:
> +- compatible           : Should be "xlnx,axi-usb2-device-4.00.a"
> +- reg                  : Physical base address and size of the Axi USB2
> +                         device registers map.
> +- interrupts           : Property with a value describing the interrupt
> +                         number.
> +- interrupt-parent     : Must be core interrupt controller
> +- xlnx,include-dma     : if DMA is included
> +
> +Example:
> +               axi-usb2-device@42e00000 {
> +                        compatible = "xlnx,axi-usb2-device-4.00.a";
> +                        interrupt-parent = <0x1>;
> +                        interrupts = <0x0 0x39 0x1>;
> +                        reg = <0x42e00000 0x10000>;
> +                        xlnx,has-builtin-dma;
> +                };
> +
> --
> 1.7.4
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
