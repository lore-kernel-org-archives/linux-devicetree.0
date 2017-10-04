From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: fsi: Add SBEFIFO documentation
Date: Wed, 4 Oct 2017 15:58:08 -0500
Message-ID: <20171004205808.c66hjl6il463q4ka@rob-hp-laptop>
References: <1506114362-492-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506114362-492-2-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506114362-492-2-git-send-email-eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 04:05:57PM -0500, Eddie James wrote:
> From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> 
> Document the bindings for the SBE CFAM device. SBE devices are
> located on a CFAM off an FSI bus.
> 
> Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/fsi/ibm,p9-sbefifo.txt       | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
> 
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
> new file mode 100644
> index 0000000..07fbf29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
> @@ -0,0 +1,20 @@
> +Device-tree bindings for P9 SBEFIFO CFAM device
> +-----------------------------------------------
> +
> +Required properties:
> + - reg = < address size >		: FSI CFAM address for the SBE engine
> +					  and address space size.

compatible? 

> +
> +Optional properties:
> + - <child nodes>			: Devices that are accessible through
> +					  the SBEFIFO.

You need some sort of definition what's in the child nodes.

> +
> +Examples:
> +
> +    sbefifo@2400 {
> +        reg = < 0x2400 0x400 >;

Need #{address,size}-cells here.

> +
> +        occ@1 {

Need a reg property here and you need to define what reg represents.

> +            ...
> +        };
> +    };
> -- 
> 1.8.3.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
