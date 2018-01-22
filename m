From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Mon, 22 Jan 2018 12:08:53 -0800
Message-ID: <bc44f051-835d-1c8d-a928-be0fd4ef80b5@gmail.com>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b96829f9-2e8b-fdc5-5090-58591e2260cf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+ Alan Tull
+ Michael Ellerman

On 01/22/18 00:09, Frank Rowand wrote:
> Hi All,
> 
> I've tried to create a decent distribution list, but I'm sure I've missed
> someone or some important list.  Please share this with anyone you think
> will be affected.
> 
> I have been playing around with some thoughts for some additions to
> the devicetree FDT aka blob format.
> 
> I would like to get the affected parties thinking about how additions to
> the format could improve whichever pieces of FDT related technology you
> work on or care about.  In my opinion, the FDT format should change
> very infrequently because of the impact on so many projects that have
> to work together to create a final solution, plus the many many users
> of those projects.
> 
> So I would like you guys to consider what I send out in a day or so,
> but I don't want to preempt your creativity by laying out the details
> of my proposal right now.
> 
> I have not looked at how this would impact the devicetree compilers,
> but I have hacked together a tool to convert existing blobs to the
> new format.  The new format is backward compatible, but transforms
> the overlay related metadata into separate blocks and removes the
> metadata from nodes and properties.  My current proposal leaves
> the fragment subtrees intact - it only transforms __symbols__,
> __fixups__, and __local_fixups__.
> 
> Some Advantages and disadvantages of my proposal are:
> 
> Con:
>   - New blob version.
> 
> Pro:
>   - Backward compatible.  Bootloaders and kernels that can process v17 blobs
>     will continue to work in the same manner with a v18 blob.  They will not
>     be able to use the new v18 features.
> 
> Pro:
>   - If a bootloader passes a blob unmodified to a kernel, then the kernel will
>     be able to use the new v18 features.
> 
> Pro:
>   - If a bootloader modifies a blob before passing it to a kernel _and_
>     downrevs the version to v17, then the kernel will continue to work in the
>     same manner as it works with a v17 blob.
> 
> Con:
>   - If a bootloader modifies a blob before passing it to a kernel _and_ fails
>     to downrev the version to v17, then the kernel will most likely detect an
>     error and may choose to not boot.
> 
> Pro:
>   - A trailing magic field allows detection of a partially composed blob,
>     where the blob is created by a multi-pass tool.
> 
> Pro:
>   - Validation tools can annotate the blob to indicate validation fail or
>     validation warning.  The bootloader and kernel can choose what to do
>     with the information.  For example, a Linux kernel might choose to
>     taint itself if the blob is not validated or has a validation error.
> 
> Pro:
>   - A significant file size reduction for a blob that contains the symbol
>     information needed by overlays.
> 
> Pro:
>   - A significant memory size reduction for a blob that contains the symbol
>     information needed by overlays.
> 
> Con:
>   - All blobs will have a small file size increase when the symbol information
>     needed by overlays is not included:  125 - 140 bytes or 44 bytes less
>     than that if checksums not added.
> 
> Pro:
>   - Simplifies implementation of Linux kernel overlay application very early
>     in the boot, mostly before unflattening the blob.  Early boot overlay
>     application will be complete when the unflattenning is complete.
> 
>     This feature _might_ _eventually_ reduce of remove the need for the
>     bootloader to apply overlays.
> 
> Pro:
>   - Simplifies implementation of the Linux kernel overlay application to
>     the live tree, post-boot.
> 
> 
> Some data would be useful, so here it is.  I compiled all of the .dts files
> in the Linux kernel source tree at arch/arm/boot/dts/.  The following data
> is the size of the blob (and for Linux the amount of memory that the
> flattened tree consumes and never frees after boot).  This is for v4.15-rc7.
> The following sizes are in bytes.
> 
> 'dtb no symbols' is the existing blob as currently built in the kernel tree.
> 
> 'delta no_sym' is the extra overhead from convering 'dtb no symbols' to the
> new format.  Again, this could be reduced by 44 bytes if the checksums
> portion of the proposal is not implemented.
> 
> 'delta symbols' is the existing format build in the kernel tree, but with
> the "-@" flag provided to dtc, so that the __symbols__ node is populated.
> 
> 'delta new fmt' is the 'delta symbols' blobs converted to the proposed
> format.
> 
> 'saved' is the number of bytes saved by converting to the new format,
> when symbols metadata is included in the blob.
> 
> The following table is sorted from most bytes saved, to least, with
> one entry at approximately every 16 percentile:
> 
> 
> row   dtb no   delta    delta    delta    saved
>       symbols  no_sym   symbols  new fmt
> ----  -------  -------  -------  -------  -------
>  99%    90531      134    42721    15766    26955  am57xx-beagle-x15-revb1.dtb
>  83%    44302      139    14582     5163     9419  imx6dl-tx6dl-comtft.dtb
>  66%    26277      132    11662     4628     7034  sun6i-a31s-sinovoip-bpi-m2.dtb
>  49%    21047      130     7328     2754     4574  imx53-qsb.dtb
>  33%    12864      137     4305     1705     2600  kirkwood-netgear_readynas_nv+_v2.dtb
>  16%    12009      128     2929     1520     1409  bcm911360k.dtb
>   0%     1220      133       68      149      -81  xenvm-4.2.dtb
> 
> Note that there are a few blobs with so little symbol metadata that the
> proposed format increases the size of the blob.  This can be seen in the
> tail of the distribution:
> 
>    2537      128      593      384      209  mt6589-aquaris5.dtb
>    2966      131      537      355      182  mt8127-moose.dtb
>    5173      132      552      372      180  spear300-evb.dtb
>    2473      128      485      368      117  mt6592-evb.dtb
>    2370      135      454      343      111  cx92755_equinox.dtb
>    2105      128      377      304       73  mt6580-evbp1.dtb
>    2357      132      346      292       54  hip01-ca9x2.dtb
>    1232      137      208      201        7  alphascale-asm9260-devkit.dtb
>    2571      126      201      222      -21  alpine-db.dtb
>    1220      133       68      149      -81  xenvm-4.2.dtb
> 
> I will reply to this message with the complete table of all arm blobs.
> 
> Please discuss.  :-)
> 
> -Frank
> 
