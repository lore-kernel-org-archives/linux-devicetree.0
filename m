From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 04/12] dt-bindings: fsi: Add P9 OCC hwmon device
 documentation
Date: Tue, 21 Nov 2017 12:36:05 -0600
Message-ID: <20171121183605.eialwrmbu2hzcaix@rob-hp-laptop>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1511222021-562-5-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1511222021-562-5-git-send-email-eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 20, 2017 at 05:53:33PM -0600, Eddie James wrote:
> From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> 
> Document the bindings for the FSI-based OCC hwmon device.
> 
> Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> 
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> new file mode 100644
> index 0000000..086b1eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ-hwmon.txt
> @@ -0,0 +1,16 @@
> +Device-tree bindings for FSI-based On-Chip Controller hwmon device
> +------------------------------------------------------------------
> +
> +Required properties:
> + - compatible = "ibm,p9-occ-hwmon";
> +
> +Examples:
> +
> +    occ@1 {
> +        compatible = "ibm,p9-occ";
> +        reg = <1>;
> +
> +        occ-hwmon@1 {

Missing reg property or need to drop the unit-address.

> +            compatible = "ibm,p9-occ-hmwon";
> +        }

Missing ;

> +    };
> -- 
> 1.8.3.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
