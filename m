From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] Documentation: dt-bindings: add async_irq to
 msm_hsusb
Date: Sat, 21 Nov 2015 01:41:58 +0300
Message-ID: <564FA1B6.5060103@cogentembedded.com>
References: <1448059038-6179-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448059038-6179-1-git-send-email-tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 11/21/2015 01:37 AM, Tim Bird wrote:

> Add optional async_irq to msm_hsusb binding doc.
>
> Signed-off-by: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/usb/msm-hsusb.txt | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> index 8654a3e..7ba1dff 100644
> --- a/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> +++ b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
> @@ -23,7 +23,12 @@ Required properties:
>     "qcom,usb-otg-snps" for chipsets with Synopsys 28nm PHY
>
>   - regs:         Offset and length of the register set in the memory map
> -- interrupts:   interrupt-specifier for the OTG interrupt.
> +- interrupts:   interrupt-specifier for the OTG interrupts
> +
> +- interrupt-names: Should contain the following:
> +  "core_irq"    USB core interrupt
> +  "async_irq"   Asynchronous interrupt to wake up from low power mode

    I think the "_irq" part can be dropped...

[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
