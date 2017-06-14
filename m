From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of: document /sys/firmware/fdt
Date: Wed, 14 Jun 2017 10:55:20 +0100
Message-ID: <20170614095519.GA6085@leverpostej>
References: <1497414007-8380-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497414007-8380-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[Adding Ard, as he added /sys/firmware/fdt]

On Tue, Jun 13, 2017 at 09:20:07PM -0700, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>
> Add ABI documentation for /sys/firmware/fdt
>
> Update contact for /sys/firmware/devicetree/* to include mail list
>
> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

FWIW:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Mark.

> ---
>  Documentation/ABI/testing/sysfs-firmware-ofw | 27 ++++++++++++++++++++++=
++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-firmware-ofw b/Documentation=
/ABI/testing/sysfs-firmware-ofw
> index f562b188e71d..8e700db6c295 100644
> --- a/Documentation/ABI/testing/sysfs-firmware-ofw
> +++ b/Documentation/ABI/testing/sysfs-firmware-ofw
> @@ -1,6 +1,6 @@
>  What:                /sys/firmware/devicetree/*
>  Date:                November 2013
> -Contact:     Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> +Contact:     Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY@public.gmane.org=
nel.org
>  Description:
>               When using OpenFirmware or a Flattened Device Tree to enume=
rate
>               hardware, the device tree structure will be exposed in this
> @@ -26,3 +26,28 @@ Description:
>               name plus address). Properties are represented as files
>               in the directory. The contents of each file is the exact
>               binary data from the device tree.
> +
> +What:                /sys/firmware/fdt
> +Date:                February 2015
> +KernelVersion:       3.19
> +Contact:     Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>, devicetree-u79uwXL29TZNg+MwTxZMZA@public.gmane.org=
l.org
> +Description:
> +             Exports the FDT blob that was passed to the kernel by
> +             the bootloader. This allows userland applications such
> +             as kexec to access the raw binary. This blob is also
> +             useful when debugging since it contains any changes
> +             made to the blob by the bootloader.
> +
> +             The fact that this node does not reside under
> +             /sys/firmware/device-tree is deliberate: FDT is also used
> +             on arm64 UEFI/ACPI systems to communicate just the UEFI
> +             and ACPI entry points, but the FDT is never unflattened
> +             and used to configure the system.
> +
> +             A CRC32 checksum is calculated over the entire FDT
> +             blob, and verified at late_initcall time. The sysfs
> +             entry is instantiated only if the checksum is valid,
> +             i.e., if the FDT blob has not been modified in the mean
> +             time. Otherwise, a warning is printed.
> +Users:               kexec, debugging
> +
> --
> Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
