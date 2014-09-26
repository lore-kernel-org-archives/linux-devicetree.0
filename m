From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v1 2/2] mtd: docg3: add device-tree documentation
Date: Fri, 26 Sep 2014 12:05:47 +0100
Message-ID: <20140926110546.GA7422@leverpostej>
References: <1411684396-12094-1-git-send-email-robert.jarzmik@free.fr>
 <1411684396-12094-2-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411684396-12094-2-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 25, 2014 at 11:33:16PM +0100, Robert Jarzmik wrote:
> Add documentation for the sandisk docg3 chip.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  Documentation/devicetree/bindings/mtd/docg3.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/docg3.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/docg3.txt b/Documentation/devicetree/bindings/mtd/docg3.txt
> new file mode 100644
> index 0000000..3fcc163
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/docg3.txt
> @@ -0,0 +1,14 @@
> +Sandisk docg3 device
> +====================
> +
> +The Sandisk (former MSystems) docg3 is a nand device of 64M to 256MB.

I think that should be: "(formerly M-Systems)".

I'd rather we used the full name (DiskOnChip G3), as "docg3" is a
Linux-specific abbreviation. So I think the compatible string should be
something like "sandisk,diskonchip-g3". Arguably we should have
M-Systems as the vendor.

Are we able to detect the particular variant by reading registers on the
device? Are there any differences that we can probe dynamically (even if
we don't care about those at the moment)?

> +
> +Required properties:
> + - compatible: Should be "sandisk,docg3"
> + - reg: register base and size
> +
> +Example:
> +	docg3 {
> +		compatible = "sandisk,docg3";
> +		reg = <0x0 0x2000>;

There should be a unit-address on the node to match the address in the
first reg entry.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
