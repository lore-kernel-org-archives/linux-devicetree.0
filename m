From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC 2/4] libnvdimm: Add a device-tree interface
Date: Tue, 27 Jun 2017 11:43:28 +0100
Message-ID: <20170627104328.GD30002@leverpostej>
References: <20170627102851.15484-1-oohall@gmail.com>
 <20170627102851.15484-2-oohall@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170627102851.15484-2-oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jun 27, 2017 at 08:28:49PM +1000, Oliver O'Halloran wrote:
> A fairly bare-bones set of device-tree bindings so libnvdimm can be used
> on powerpc and other, less cool, device-tree based platforms.

;)

> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> The current bindings are essentially this:
> 
> nonvolatile-memory {
> 	compatible = "nonvolatile-memory", "special-memory";
> 	ranges;
> 
> 	region@0 {
> 		compatible = "nvdimm,byte-addressable";
> 		reg = <0x0 0x1000>;
> 	};
> 
> 	region@1000 {
> 		compatible = "nvdimm,byte-addressable";
> 		reg = <0x1000 0x1000>;
> 	};
> };

This needs to have a proper binding document under
Documentation/devicetree/bindings/. Something like the reserved-memory
bdings would be a good template.

If we want thet "nvdimm" vendor-prefix, that'll have to be reserved,
too (see Documentation/devicetree/bindings/vendor-prefixes.txt).

What is "special-memory"? What other memory types would be described
here?

What exacctly does "nvdimm,byte-addressable" imply? I suspect that you
also expect such memory to be compatible with mappings using (some)
cacheable attributes?

Perhaps the byte-addressable property should be a boolean property on
the region, rather than part of the compatible string.

> To handle interleave sets, etc the plan was the add an extra property with the
> interleave stride and a "mapping" property with <&DIMM, dimm-start-offset>
> tuples for each dimm in the interleave set. Block MMIO regions can be added
> with a different compatible type, but I'm not too concerned with them for
> now.

Sorry, I'm not too familiar with nonvolatile memory. What are interleave
sets?

What are block MMIO regions?

Is there any documentation one can refer to for any of this?

[...]

> +static const struct of_device_id of_nvdimm_bus_match[] = {
> +	{ .compatible = "nonvolatile-memory" },
> +	{ .compatible = "special-memory" },
> +	{ },
> +};

Why both? Is the driver handling other "special-memory"?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
