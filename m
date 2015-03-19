From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 2/7] dt: dtb version: document chosen/dtb-info node binding
Date: Thu, 19 Mar 2015 10:37:08 -0700
Message-ID: <550B0944.6080203@gmail.com>
References: <550A42AC.8060104@gmail.com> <550A4382.4030209@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550A4382.4030209-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3/18/2015 8:33 PM, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
> Add /chosen/dtb-node binding.
> 
> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/chosen.txt |   37 +++++++++++
> 
> Index: b/Documentation/devicetree/bindings/chosen.txt
> ===================================================================
> --- a/Documentation/devicetree/bindings/chosen.txt
> +++ b/Documentation/devicetree/bindings/chosen.txt
> @@ -46,6 +46,43 @@ on PowerPC "stdout" if "stdout-path" is
>  should only use the "stdout-path" property.
>  
>  
> +dtb-info node
> +----------------
> +
> +Information that describes where the device tree blob (DTB) came from and the
> +environment it was created in.

I left out optional vs required.  The next version will state that the dtb-info
node and each separate property within it are optional.

> +
> +This node is normally created by including arch/arm/boot/dts/skeleton.dtsi,
> +which includes include/dt-bindings/version.dtsi.
> +
> +Properties:
> +
> +version
> +	The version of the DTB.  This is analagous to the linux kernel version.
> +
> +	This is a format free field intended for human consumption.  User space
> +	programs should not have any expections about this property.
> +
> +	The DTB number in this property is incremented each time a make that
> +	creates one or more DTBs is invoked.  If the make creates multiple
> +	DTBs then this number is only incremented once.
> +
> +	The DTB number is stored in file .version_dtb.
> +
> +version-linux
> +	The version of the linux kernel most recently built in the source
> +	control system that contains the source used to build the DTB.
> +
> +	The linux kernel version number is not incremented for a make that
> +	creates a DTB.
> +
> +dtb-path
> +	The build directory relative path of the DTB.
> +
> +dts-path
> +	The absolute path of the .dts file compiled to create the DTB.
> +
> +
>  Properties documented in other bindings
>  ---------------------------------------
>  #address-cells                          video/simple-framebuffer-sunxi.txt
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
