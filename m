From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] Documentation: devicetree: add bindings to support
 ARM MHU subchannels
Date: Mon, 8 May 2017 11:10:26 -0500
Message-ID: <20170508161026.5vdqnv52ub7hurwf@rob-hp-laptop>
References: <1493733353-25812-1-git-send-email-sudeep.holla@arm.com>
 <1493733353-25812-3-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1493733353-25812-3-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+Bjorn

On Tue, May 02, 2017 at 02:55:49PM +0100, Sudeep Holla wrote:
> The ARM MHU has mechanism to assert interrupt signals to facilitate
> inter-processor message based communication. It drives the signal using
> a 32-bit register, with all 32-bits logically ORed together. It also
> enables software to set, clear and check the status of each of the bits
> of this register independently. Each bit of the register can be
> associated with a type of event that can contribute to raising the
> interrupt thereby allowing it to be used as independent subchannels.
> 
> Since the first version of this binding can't support sub-channels,
> this patch extends the existing binding to support them.
> 
> Cc: Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
> Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  .../devicetree/bindings/mailbox/arm-mhu.txt        | 44 ++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> index 4971f03f0b33..86a66f7918e2 100644
> --- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> +++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> @@ -10,21 +10,40 @@ STAT register and the remote clears it after having read the data.
>  The last channel is specified to be a 'Secure' resource, hence can't be
>  used by Linux running NS.
>  
> +The MHU drives the interrupt signal using a 32-bit register, with all
> +32-bits logically ORed together. It provides a set of registers to
> +enable software to set, clear and check the status of each of the bits
> +of this register independently. The use of 32 bits per interrupt line
> +enables software to provide more information about the source of the
> +interrupt. For example, each bit of the register can be associated with
> +a type of event that can contribute to raising the interrupt.

Sounds like a doorbell? (i.e. a single bit mailbox). Bjorn is doing 
something similar for QCom h/w. I guess the difference here is you have 
32 sources and 1 output. It seems to me these should be described 
similarly.

> +
>  Mailbox Device Node:
>  ====================
>  
>  Required properties:
>  --------------------
> -- compatible:		Shall be "arm,mhu" & "arm,primecell"
> +- compatible:		Shall be "arm,primecell" and one of the below:
> +			"arm,mhu" - if the controller doesn't support
> +				    subchannels
> +			"arm,mhu-v2" - if the controller supports subchannels

How do I know if I have v2? This correlates to an IP version or 
IP configuration or ?

>  - reg:			Contains the mailbox register address range (base
>  			address and length)
> -- #mbox-cells		Shall be 1 - the index of the channel needed.
> +- #mbox-cells		Shall be 1 - the index of the channel needed when
> +			compatible is "arm,mhu"
> +			Shall be 2 - the index of the channel needed, and
> +			the index of the subchannel with the channel when
> +			compatible is "arm,mhu-v2"
>  - interrupts:		Contains the interrupt information corresponding to
> -			each of the 3 links of MHU.
> +			each of the 3 physical channels of MHU namely low
> +			priority non-secure, high priority non-secure and
> +			secure channels.
>  
>  Example:
>  --------
>  
> +1. Controller which doesn't support subchannels
> +
>  	mhu: mailbox@2b1f0000 {
>  		#mbox-cells = <1>;
>  		compatible = "arm,mhu", "arm,primecell";
> @@ -41,3 +60,22 @@ used by Linux running NS.
>  		reg = <0 0x2e000000 0x4000>;
>  		mboxes = <&mhu 1>; /* HP-NonSecure */
>  	};
> +
> +2. Controller which supports subchannels
> +
> +	mhu: mailbox@2b1f0000 {
> +		#mbox-cells = <2>;
> +		compatible = "arm,mhu-v2", "arm,primecell";
> +		reg = <0 0x2b1f0000 0x1000>;
> +		interrupts = <0 36 4>, /* LP-NonSecure */
> +			     <0 35 4>, /* HP-NonSecure */
> +			     <0 37 4>; /* Secure */
> +		clocks = <&clock 0 2 1>;
> +		clock-names = "apb_pclk";
> +	};
> +
> +	mhu_client: scb@2e000000 {
> +		compatible = "arm,scpi";
> +		reg = <0 0x2e000000 0x200>;
> +		mboxes = <&mhu 1 4>; /* HP-NonSecure 5th sub-channel */
> +	};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
