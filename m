From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 07/36] devicetree: document ingenic,jz4740-intc binding
Date: Mon, 19 Jan 2015 14:54:10 +0300
Message-ID: <54BCF062.1010009@cogentembedded.com>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com> <1421620067-23933-8-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421620067-23933-8-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 1/19/2015 1:27 AM, Paul Burton wrote:

> Add binding documentation for the Ingenic jz4740 interrupt controller.

> Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>   .../interrupt-controller/ingenic,jz4740-intc.txt   | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4740-intc.txt

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4740-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4740-intc.txt
> new file mode 100644
> index 0000000..3c06ef1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,jz4740-intc.txt
> @@ -0,0 +1,24 @@
> +Ingenic jz4740 SoC Interrupt Controller
> +
> +Required properties:
> +
> +- compatible : should be "ingenic,jz4740-intc"
> +- reg : Specifies base physical address and size of the registers.
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 1.
> +- interrupt-parent: phandle of the CPU interrupt controller.
> +- interrupts - Specifies the CPU interrupt the controller is connected to.
> +
> +Example:
> +
> +intc: intc@10001000 {

    The node name should be "interrupt-controller@10001000", according to the 
ePAPR standard.

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
