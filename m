From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv3 1/2] dts: Adding docs for Xilinx LogiCORE IP mailbox
 driver.
Date: Fri, 29 May 2015 07:55:49 +0200
Message-ID: <5567FF65.5040208@xilinx.com>
References: <1432849928-25457-1-git-send-email-moritz.fischer@ettus.com>
 <1432849928-25457-2-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432849928-25457-2-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/28/2015 11:52 PM, Moritz Fischer wrote:
> Changes from v2:
> - Addressed Michal's stylistic comments
> - Fixed typo in compatible string
> 
> Changes from v1:
> - Added common clock framework support
> 
> Changes from v0:
> - Fixed example bindings
> 
> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> ---
>  .../bindings/mailbox/xilinx-mailbox.txt         | 44 ++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
> new file mode 100644
> index 0000000..ca76efd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
> @@ -0,0 +1,44 @@
> +Xilinx Mailbox Driver
> +=====================
> +
> +Required properties:
> +- compatible       : "xlnx,mailbox-2.1".
> +- reg              :  physical base address of the mailbox and length of
> +                      memory mapped region.
> +- #mbox-cells      :  common mailbox binding property to identify the number
> +                      of cells required for the mailbox specifier, should be 1
> +- clocks           :  phandle to clock provider
> +- clock-names      :  must be 'mbox'
> +
> +Optional properties:
> +- interrupt-parent : interrupt source phandle
> +- interrupts       : interrupt number, The interrupt specifier format
> +                     depends on the interrupt controller parent.
> +
> +Example:
> +	mbox: mailbox@40400000 {
> +		compatible = "xlnx,mailbox-2.1";
> +		reg = <0x40400000 0x3c>;
> +		interrupt-parent = <&intc>;
> +		interrupts = <5>;
> +		#mbox-cells = <1>;
> +		clocks = <&clkc 15>;
> +		clock-names = "mbox";
> +	};
> +
> +Mailbox client
> +===============
> +"mboxes" and the optional "mbox-names" (please see
> +Documentation/devicetree/bindings/mailbox/mailbox.txt for details). Each value
> +of the mboxes property should contain a phandle to the mailbox controller
> +device node and second argument is the channel index. It must be 0 (hardware
> +support only one channel). The equivalent "mbox-names" property value can be
> +used to give a name to the communication channel to be used by the client user.
> +
> +Example:
> +	mclient0: mclient0@400 {
> +		compatible = "client-1.0";
> +		reg = <0x400 0x10>;
> +		mbox-names = "mbox";
> +		mboxes = <&mbox 0>;
> +	};
> 

I see you still keep there 0x3c but that's minor detail.

Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Thanks,
Michal


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
