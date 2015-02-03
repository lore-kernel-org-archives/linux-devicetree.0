From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH_V4 1/3] dt: usb: jz4740: Add DT binding document for OHCI
Date: Tue, 03 Feb 2015 14:54:58 +0300
Message-ID: <54D0B712.5020309@cogentembedded.com>
References: <1422958640-25723-1-git-send-email-Zubair.Kakakhel@imgtec.com> <1422958640-25723-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422958640-25723-2-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 2/3/2015 1:17 PM, Zubair Lutfullah Kakakhel wrote:

> From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

> Add the binding documentation for the JZ4740 OHCI controller.

> Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

[...]

> diff --git a/Documentation/devicetree/bindings/usb/ingenic,jz4740-ohci.txt b/Documentation/devicetree/bindings/usb/ingenic,jz4740-ohci.txt
> new file mode 100644
> index 0000000..29c1934
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ingenic,jz4740-ohci.txt
> @@ -0,0 +1,21 @@
> +Ingenic JZ4740 SoC OHCI controller binding
> +
> +The Ingenic JZ4740 SoC includes an OHCI compliant USB host controller
> +interface for use with USB 1.1 devices.
> +
> +Required properties:
> + - compatible: Should be "ingenic,jz4740-ohci"
> + - reg: Should contain the address & size of the OHCI controller registers.
> + - interrupts: Should specify the interrupt line number
> +
> +Example for jz4740:
> +
> +/ {
> +	ohci: jz4780-ohci@0x134a0000 {

    The name should be "usb@134a0000", according to the ePAPR standard.

[...]

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
