From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH linux 4/4] drivers/fsi/occ: Add in-kernel API
Date: Mon, 26 Jun 2017 13:35:45 -0500
Message-ID: <20170626183545.lalthvn4xufa52ww@rob-hp-laptop>
References: <1498073881-3207-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1498073881-3207-5-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498073881-3207-5-git-send-email-eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 21, 2017 at 02:38:01PM -0500, Eddie James wrote:
> From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> 
> Add an in-kernel read/write API with exported functions. This is
> necessary for other drivers which want to directly interact with the
> OCC. Also parse the OCC device tree node for child nodes and create
> child platform devices accordingly.
> 
> Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/fsi/ibm,p9-occ.txt         |   8 ++
>  drivers/fsi/occ.c                                  | 140 +++++++++++++++++----
>  include/linux/occ.h                                |  27 ++++
>  3 files changed, 154 insertions(+), 21 deletions(-)
>  create mode 100644 include/linux/occ.h
> 
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> index 88002b9..71afba3 100644
> --- a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> @@ -6,10 +6,18 @@ Required properties:
>  
>  Optional properties:
>   - reg = <processor index>;	: index for the processor this OCC device is on
> + - <child nodes>		: Drivers for devices which communicate with
> +				  this OCC. Child nodes have no required or
> +				  optional properties that the OCC driver will
> +				  use.

Please put all the binding in a single, separate patch.

>  
>  Examples:
>  
>      occ@1 {
>          compatible = "ibm,p9-occ";
>          reg = <1>;
> +
> +	occ-hwmon@1 {
> +		compatible = "ibm,p9-occ-hwmon";
> +	};

This looks like you are creating a node just to instantiate a driver as 
hwmon is a Linuxism. Just have the parent OCC driver instantiate a hwmon 
driver.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
