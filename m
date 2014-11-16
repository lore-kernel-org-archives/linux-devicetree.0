From: Anup Patel <anup-aa5cPYPs4nSSZfiimGR9Ow@public.gmane.org>
Subject: Re: [PATCH v4 5/6] Documentation: dt-bindings: Add binding info for
 X-Gene QMTM UIO driver
Date: Sun, 16 Nov 2014 09:56:07 +0530
Message-ID: <CAAhSdy2L5fPdk97wTVy++B4LcJP_s-r-BF18hg6J9Shfg_t1XQ@mail.gmail.com>
References: <1415864722-2800-1-git-send-email-ankit.jindal@linaro.org>
	<1415864722-2800-6-git-send-email-ankit.jindal@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415864722-2800-6-git-send-email-ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org List" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 13, 2014 at 1:15 PM, Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patch adds device tree binding documentation for
> X-Gene QMTM UIO driver.
>
> Signed-off-by: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/uio/uio_xgene_qmtm.txt     |   51 ++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/uio/uio_xgene_qmtm.txt
>
> diff --git a/Documentation/devicetree/bindings/uio/uio_xgene_qmtm.txt b/Documentation/devicetree/bindings/uio/uio_xgene_qmtm.txt
> new file mode 100644
> index 0000000..ed85bc6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/uio/uio_xgene_qmtm.txt
> @@ -0,0 +1,51 @@
> +APM X-Gene QMTM nodes
> +
> +The Applied Micro X-Gene SOC has on-chip QMTM (Queue manager
> +and Traffic manager). It is a device for managing hardware queues.
> +It also implements QoS among hardware queues hence term "traffic"
> +manager is present in its name.
> +
> +Required properties:
> +- compatible: Should be "apm,xgene-qmtm"
> +- reg: Address and length of the register set for the device. It contains the
> +  information of registers in the same order as described by reg-names.
> +- reg-names: Should contain the register set names
> +  - "csr": QMTM control and status register address space.
> +  - "fabric": QMTM memory mapped access to queue states.
> +- qpool-memory: Points to the phandle of the node defining memory location for
> +        creating QMTM queues. This must point to the reserved-memory node
> +        (as-per reserved memory bindings). It is expected that size and
> +        location of qpool memory will be configurable via bootloader.
> +- clocks: Reference to the clock entry.
> +- num-queues: Number of queues under this QMTM device.
> +- devid: QMTM identification number for the system having multiple QMTM devices.
> +        This is used to form a unique id (a tuple of queue number and
> +        device id) for the queues belonging to this device.
> +
> +Example:
> +       qmtm1_uio_qpool: qmtm1_uio_qpool {
> +               reg = <0x0 0x0 0x0 0x0>
> +       };
> +
> +       qmtm1clk: qmtmclk@1f20c000 {
> +               compatible = "apm,xgene-device-clock";
> +               clock-output-names = "qmtm1clk";
> +               status = "ok";
> +       };
> +
> +       qmtm1_uio: qmtm_uio@1f200000 {
> +               compatible = "apm,xgene-qmtm";
> +               status = "disabled";
> +               reg = <0x0 0x1f200000 0x0 0x10000>,
> +                     <0x0 0x1b000000 0x0 0x400000>;
> +               reg-names = "csr", "fabric";
> +               qpool = <&qmtm1_uio_qpool>;

Small typo, this should be qpool-memory = <...>;

> +               clocks = <&qmtm1clk 0>;
> +               num-queues = <0x400>;
> +               devid = <1>;
> +       };
> +
> +       /* Board-specific peripheral configurations */
> +       &qmtm1_uio {
> +               status = "ok";
> +       };
> --
> 1.7.9.5
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
