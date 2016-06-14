From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RESEND 1/3] dt-bindings: add bindings documentation for
 PDC driver.
Date: Tue, 14 Jun 2016 15:42:15 +0100
Message-ID: <576017C7.50609@arm.com>
References: <1465912965-35500-1-git-send-email-rob.rice@broadcom.com>
 <1465912965-35500-2-git-send-email-rob.rice@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465912965-35500-2-git-send-email-rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Rice <rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Rice <rrice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 14/06/16 15:02, Rob Rice wrote:
> From: Rob Rice <rrice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>
> Add the device tree binding documentation for the PDC hardware
> in Broadcom iProc SoCs.
>
> Signed-off-by: Rob Rice <rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>   .../bindings/mailbox/brcm,iproc-pdc-mbox.txt       | 23 ++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
>
> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
> new file mode 100644
> index 0000000..411ccf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
> @@ -0,0 +1,23 @@
> +The PDC driver manages data transfer to and from various offload engines
> +on some Broadcom SoCs. An SoC may have multiple PDC hardware blocks. There is
> +one device tree entry per block.
> +
> +Required properties:
> +- compatible : Should be "brcm,iproc-pdc-mbox".
> +- reg: Should contain PDC registers location and length.
> +- interrupts: Should contain the IRQ line for the PDC.
> +- #mbox-cells: 1
> +- brcm,rx-status-len: Length of metadata preceding received frames, in bytes.
> +

Ideally the metadata is more associated with the software protocol built
on top of the mailbox controller.

Is this metadata added by the hardware ?

Otherwise it's better to make it part of the protocol rather than the
associating with the controller.

> +Optional properties:
> +- brcm,use-bcm-hdr:  present if a BCM header precedes each frame.
> +

Same here.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
