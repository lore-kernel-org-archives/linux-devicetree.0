From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] usb: chipidea: zynq: Add device tree binding information
Date: Fri, 27 Jun 2014 16:23:55 +0400
Message-ID: <53AD625B.1080002@cogentembedded.com>
References: <6233f866-678d-4a90-a307-debcb848ae76@BN1AFFO11FD023.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6233f866-678d-4a90-a307-debcb848ae76-reflc3kr++Mk2TTsEbHRquhlVc3/7hDbVaz/vdPVXQ4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 06/27/2014 03:23 PM, Punnaiah Choudary Kalluri wrote:

> Document device tree binding information as required by
> the ZYNQ USB controller.

> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
[...]

> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-zynq.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-zynq.txt
> new file mode 100644
> index 0000000..54bb3b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-zynq.txt
> @@ -0,0 +1,23 @@
> +Xilinx Zynq usb controller based on synopsys usb IP(v2.20a)

    s/usb/USB/.

> +
> +Required properties:
> +- compatible:   should contain "xlnx,zynq-usb-2.20a"
> +- clocks:       clock provider specifier
> +- reg:          offset and length of the register set in the memory map
> +- interrupt-parent: the phandle for the interrupt controller that services
> +                    interrupts for this device.

    This property has never been required -- it can be inherited from the 
upper level node.

WBR, Sergei


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
