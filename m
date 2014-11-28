From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [kernel PATCH] devicetree: document ARM bindings for QEMU's
 Firmware Config interface
Date: Fri, 28 Nov 2014 13:17:43 +0000
Message-ID: <20141128131743.GF25883@leverpostej>
References: <1417177604-21194-1-git-send-email-lersek@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417177604-21194-1-git-send-email-lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org" <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Nov 28, 2014 at 12:26:44PM +0000, Laszlo Ersek wrote:
> Peter Maydell suggested that we describe new devices / DTB nodes in the
> kernel Documentation tree that we expose to arm "virt" guests in QEMU.
> 
> Although the kernel is not required to access the fw_cfg interface,
> "Documentation/devicetree/bindings/arm" is probably the best central spot
> to keep the fw_cfg description in.
> 
> Suggested-by: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/fw-cfg.txt | 47 ++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/fw-cfg.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/fw-cfg.txt b/Documentation/devicetree/bindings/arm/fw-cfg.txt
> new file mode 100644
> index 0000000..d131453
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/fw-cfg.txt
> @@ -0,0 +1,47 @@
> +* QEMU Firmware Configuration bindings for ARM
> +
> +QEMU's arm-softmmu and aarch64-softmmu emulation / virtualization targets
> +provide the following Firmware Configuration interface on the "virt" machine
> +type:
> +
> +- A write-only, 16-bit wide selector (or control) register,
> +- a read-write, 8-bit wide data register.
> +
> +The guest writes a selector value (a key) to the selector register, and then
> +can read the corresponding data (produced by QEMU) via the data port. If the
> +selected entry is writable, the guest can rewrite it through the data port. The
> +authoritative registry of the valid selector values and their meanings is the
> +QEMU source code.
> +
> +QEMU exposes the control and data register to x86 guests at fixed IO ports. ARM
> +guests can access them as memory mapped registers, and their location is
> +communicated to the guest's UEFI firmware in the DTB that QEMU places at the
> +bottom of the guest's DRAM.

What exactly is this interface used for? And what's the protocol that
goes over the read/write sequences descrbied above? Is there any
documentation of that we can refer to here?

Is version information probeable from this, or does that need to be
described?

> +The guest kernel is not expected to use these registers (although it is
> +certainly allowed to); the device tree bindings are documented here because
> +this is where device tree bindings reside in general.
> +
> +The addresses and sizes of the Firmware Configuration registers are given by
> +the /fw-cfg node. The "virt" board invariably uses <2> as #size-cells and
> +#address-cells in the context of this node.

This paragraph can go -- #address-cells and #size-cells are
well-understood common properties.

> +
> +The "reg" property is therefore an array of four uint64_t elements (eight
> +uint32_t cells in total), the first uint64_t pair describing the address and
> +size of the control register, the second uint64_t pair describing the address
> +and size of the data register. (See
> +<http://devicetree.org/Device_Tree_Usage#How_Addressing_Works>.)

The reg property is a list of <address size> tuples. The size of the
entiries depends on #address-cells and #size-cells in the parent node,
but they are certainly not guaranteed to be uint64_t values (if nothing
else, they're encoded big-endian in the DTB). We just need to describe
what the entries are w.r.t. the device, not the particulars of the DTB
format.

Are these registers always contiguous? I assume so, and vif so you can
cover them with a single reg entry (read it as 'region' rather than
'register').

> +
> +The first string in the "compatible" property is "fw-cfg,mmio".

"fw-cfg" is not a vendor prefix. I guess we need a "qemu" vendor prefix?
Then we'd have something like "qemu,fw-cfg-mmio" as the compatible
string.

Also, the string should not be required to be the first entry in the
list, as that breaks the fallback semantics of the compatible list. The
string should just need to be present in the list.

Please try to format the binding something like:

---->8----
Required properties:

- compatible: should contain "qemu,fw-cfg-mmio".

- reg: The MMIO regions used by the device:
  * The first entry describes the control register.
  * The second entry describes the data register.
---->8----

Though I hope we can just use a single reg entry to cover all the
registers the device has.

> +
> +Example:
> +
> +/ {
> +	#size-cells = <0x2>;
> +	#address-cells = <0x2>;
> +
> +	fw-cfg@9020000 {
> +		reg = <0x0 0x9020000 0x0 0x2 0x0 0x9020002 0x0 0x1>;

Please bracket list entries individually, e.g.

	reg = <0x0 0x9020000 0x0 0x2>,
	      <0x0 0x9020002 0x0 0x1>;

> +		compatible = "fw-cfg,mmio";

And please place the compatible property before the reg (it makes things
easier to read).

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
