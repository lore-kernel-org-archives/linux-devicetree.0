From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] firmware: Add device tree binding for coreboot
Date: Fri, 13 Jun 2014 16:11:30 -0500
Message-ID: <CAL_JsqL-K4i54ysugCKSw-aO-9pvnYgZfJ=NdBAot=mwffxmyA@mail.gmail.com>
References: <1402689965-19397-1-git-send-email-jwerner@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402689965-19397-1-git-send-email-jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <stephen.r.warren-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stefan Reinauer <stefan.reinauer-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 13, 2014 at 3:06 PM, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> This patch adds documentation describing a device tree binding for the
> coreboot firmware project (www.coreboot.org). It is meant to be
> dynamically added during boot and contains address definitions for the
> coreboot table (a list of variable-sized descriptors providing
> information about various compile- and run-time generated firmware
> parameters) and the CBMEM area (the structure containing most run-time
> resident memory regions set up by coreboot).
>
> These definitions allow kernel drivers to easily access data contained
> in and pointed to by these regions (such as coreboot's in-memory log).
> (An example implementation can be seen at http://crosreview.com/203371,
> which will be submitted at a later point.)

This is just to export a fixed log to userspace (like a DMI table) or
the kernel will actually use the data in some way? Based on the link,
it looks like the former to me.

> Signed-off-by: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  .../devicetree/bindings/firmware/coreboot.txt      | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/coreboot.txt
>
> diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/Documentation/devicetree/bindings/firmware/coreboot.txt
> new file mode 100644
> index 0000000..89d7bf3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/coreboot.txt
> @@ -0,0 +1,28 @@
> +COREBOOT firmware information
> +
> +The device tree node to communicate the location of coreboot's memory-resident
> +bookkeeping structures to the kernel. Since coreboot itself cannot boot a
> +device-tree-based kernel (yet), this node needs to be inserted by a
> +second-stage bootloader (a coreboot "payload").
> +
> +Required properties:
> + - compatible: Should be "coreboot"
> + - reg: Address and length of the following two memory regions, in order:
> +       1.) The coreboot table. This is a list of variable-sized descriptors
> +       that contain various compile- and run-time generated firmware
> +       parameters. It is identified by the magic string "LBIO" in its first
> +       four bytes. See coreboot's src/include/boot/coreboot_tables.h for
> +       details.
> +       2.) The CBMEM area. This is a downward-growing memory region used by
> +       coreboot to dynamically allocate data structures that remain resident.
> +       It may or may not include the coreboot table as one of its members. It
> +       is identified by a root node descriptor with the magic number
> +       0xc0389479 that resides in the topmost 8 bytes of the area. See
> +       coreboot's src/lib/dynamic_cbmem.c for details.

Don't you need need to keep the kernel from allocating this memory by
using one of the reserved memory mechanisms? The recently added one
should be able to specific what the memory is reserved for IIRC.

> +
> +Example:
> +       firmware {

/firmware is already used IIRC. What if you have other firmware such
as Trustzone?

> +               compatible = "coreboot";
> +               reg = <0xfdfea000 0x264>,
> +                     <0xfdfea000 0x16000>;
> +       };
> --
> 1.8.3.2
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
