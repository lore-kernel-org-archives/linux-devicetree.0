From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 3/3] dtc: Document the dynamic plugin internals
Date: Tue, 03 Mar 2015 14:42:52 +0100
Message-ID: <1425390172.3668.196.camel@pengutronix.de>
References: <1425063346-14554-1-git-send-email-pantelis.antoniou@konsulko.com>
	 <1425063346-14554-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425063346-14554-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On Fr, 2015-02-27 at 20:55 +0200, Pantelis Antoniou wrote:
> +3.b) The Device Tree fragments must be compiled with the same option but they
> +must also have a tag (/plugin/) that allows undefined references to labels
> +that are not present at compilation time to be recorded so that the runtime
> +loader can fix them.
> +
> +So the bar peripheral's DTS format would be of the form:
> +
> +/plugin/;	/* allow undefined label references and record them */
> +/ {
> +	....	/* various properties for loader use; i.e. part id etc. */
> +	fragment@0 {
> +		target = <&ocp>;
> +		__overlay__ {
> +			/* bar peripheral */
> +			bar {
> +				compatible = "corp,bar";
> +				... /* various properties and child nodes */
> +			}
> +		};
> +	};
> +};
> +
> +Note that there's a target property that specifies the location where the
> +contents of the overlay node will be placed, and it references the label
> +in the foo.dts file.

The kernel overlay code also supports using 'target-path="/path";'
instead of 'target=<phandle>;' to work with base DTBs which have no
__symbols__ node. Shouldn't this be mentioned here as well?

Thanks,
Jan
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
