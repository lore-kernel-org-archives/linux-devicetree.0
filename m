From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 03/12] devicetree: Add bindings for the ATH79 DDR controllers
Date: Sun, 31 May 2015 15:23:53 +0300
Message-ID: <556AFD59.4080009@cogentembedded.com>
References: <1433029955-7346-1-git-send-email-albeu@free.fr> <1433029955-7346-4-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433029955-7346-4-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 5/31/2015 2:52 AM, Alban Bedel wrote:

> The DDR controller of the ARxxx and AR9xxx families provides an
> interface to flush the FIFO between various devices and the DDR.
> This is mainly used by the IRQ controller to flush the FIFO before
> running the interrupt handler of such devices.

> Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> ---
> v2: * Fix the node names to respect ePAPR
> v3: * Fix some typos
>      * Really fix the node names this time
> ---
>   .../memory-controllers/ath79-ddr-controller.txt    | 35 ++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt

> diff --git a/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt b/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt
> new file mode 100644
> index 0000000..efe35a06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt
> @@ -0,0 +1,35 @@
> +Binding for Qualcomm  Atheros AR7xxx/AR9xxx DDR controller
> +
> +The DDR controller of the ARxxx and AR9xxx families provides an interface

    s/ARxxx/AR7xxx/.

> +to flush the FIFO between various devices and the DDR. This is mainly used
> +by the IRQ controller to flush the FIFO before running the interrupt handler
> +of such devices.
> +
> +Required properties:
> +
> +- compatible: has to be "qca,<soc-type>-ddr-controller",
> +  "qca,[ar7100|ar7240]-ddr-controller" as fallback.
> +  On SoC with PCI support "qca,ar7100-ddr-controller" should be used as
> +  fallback, otherwise "qca,ar7240-ddr-controller" should be used.
> +- reg: Base address and size of the controllers memory area

    Controller's.

> +- #qca,ddr-wb-channel-cells: has to be 1, the index of the write buffer
> +  channel

    Hm, index? The expectation for such props is the # of cells.

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
