From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Wed, 18 Feb 2015 15:41:06 +0000
Message-ID: <20150218154106.GC29429@leverpostej>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424271576-1952-3-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On Wed, Feb 18, 2015 at 02:59:34PM +0000, Pantelis Antoniou wrote:
> Implement a method of applying DT quirks early in the boot sequence.
>
> A DT quirk is a subtree of the boot DT that can be applied to
> a target in the base DT resulting in a modification of the live
> tree. The format of the quirk nodes is that of a device tree overlay.
>
> For details please refer to Documentation/devicetree/quirks.txt
>
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/quirks.txt | 101 ++++++++++
>  drivers/of/dynamic.c                | 358 ++++++++++++++++++++++++++++++++++++
>  include/linux/of.h                  |  16 ++
>  3 files changed, 475 insertions(+)
>  create mode 100644 Documentation/devicetree/quirks.txt
>
> diff --git a/Documentation/devicetree/quirks.txt b/Documentation/devicetree/quirks.txt
> new file mode 100644
> index 0000000..789319a
> --- /dev/null
> +++ b/Documentation/devicetree/quirks.txt
> @@ -0,0 +1,101 @@
> +A Device Tree quirk is the way which allows modification of the
> +boot device tree under the control of a per-platform specific method.
> +
> +Take for instance the case of a board family that comprises of a
> +number of different board revisions, all being incremental changes
> +after an initial release.
> +
> +Since all board revisions must be supported via a single software image
> +the only way to support this scheme is by having a different DTB for each
> +revision with the bootloader selecting which one to use at boot time.

Not necessarily at boot time. The boards don't have to run the exact
same FW/bootloader binary, so the relevant DTB could be programmed onto
each board.

> +While this may in theory work, in practice it is very cumbersome
> +for the following reasons:
> +
> +1. The act of selecting a different boot device tree blob requires
> +a reasonably advanced bootloader with some kind of configuration or
> +scripting capabilities. Sadly this is not the case many times, the
> +bootloader is extremely dumb and can only use a single dt blob.

You can have several bootloader builds, or even a single build with
something like appended DTB to get an appropriate DTB if the same binary
will otherwise work across all variants of a board.

So it's not necessarily true that you need a complex bootloader.

> +2. On many instances boot time is extremely critical; in some cases
> +there are hard requirements like having working video feeds in under
> +2 seconds from power-up. This leaves an extremely small time budget for
> +boot-up, as low as 500ms to kernel entry. The sanest way to get there
> +is by removing the standard bootloader from the normal boot sequence
> +altogether by having a very small boot shim that loads the kernel and
> +immediately jumps to kernel, like falcon-boot mode in u-boot does.

Given my previous comments above I don't see why this is relevant.
You're already passing _some_ DTB here, so if you can organise for the
board to statically provide a sane DTB that's fine, or you can resort to
appended DTB if it's not possible to update the board configuration.

> +3. Having different DTBs/DTSs for different board revisions easily leads to
> +drift between versions. Since no developer is expected to have every single
> +board revision at hand, things are easy to get out of sync, with board versions
> +failing to boot even though the kernel is up to date.

I'm not sure I follow. Surely if you don't have every board revision at
hand you can't test quirks exhaustively either?

Additionally you face the problem that two boards of the same variant
could have different base DTBs that you would need to test that each
board's quirks worked for a range of base DTBs.

> +4. One final problem is the static way that device tree works.
> +For example it might be desirable for various boards to have a way to
> +selectively configure the boot device tree, possibly by the use of command
> +line options.  For instance a device might be disabled if a given command line
> +option is present, different configuration to various devices for debugging
> +purposes can be selected and so on. Currently the only way to do so is by
> +recompiling the DTS and installing, which is an chore for developers and
> +a completely unreasonable expectation from end-users.

I'm not sure I follow here.

Which devices do you envisage this being the case for?

Outside of debug scenarios when would you envisage we do this?

For the debug case it seems reasonable to have command line parameters
to get the kernel to do what we want. Just because there's a device in
the DTB that's useful in a debug scenario doesn't mean we have to use it
by default.

> +Device Tree quirks solve all those problems by having an in-kernel interface
> +which per-board/platform method can use to selectively modify the device tree
> +right after unflattening.
> +
> +A DT quirk is a subtree of the boot DT that can be applied to
> +a target in the base DT resulting in a modification of the live
> +tree. The format of the quirk nodes is that of a device tree overlay.
> +
> +As an example the following DTS contains a quirk.
> +
> +/ {
> +       foo: foo-node {
> +               bar = <10>;
> +       };
> +
> +       select-quirk = <&quirk>;
> +
> +       quirk: quirk {
> +               fragment@0 {
> +                       target = <&foo>;
> +                       __overlay {
> +                               bar = <0xf00>;
> +                               baz = <11>;
> +                       };
> +               };
> +       };
> +};
> +
> +The quirk when applied would result at the following tree:
> +
> +/ {
> +       foo: foo-node {
> +               bar = <0xf00>;
> +               baz = <11>;
> +       };
> +
> +       select-quirk = <&quirk>;
> +
> +       quirk: quirk {
> +               fragment@0 {
> +                       target = <&foo>;
> +                       __overlay {
> +                               bar = <0xf00>;
> +                               baz = <11>;
> +                       };
> +               };
> +       };
> +
> +};
> +
> +The two public method used to accomplish this are of_quirk_apply_by_node()
> +and of_quirk_apply_by_phandle();
> +
> +To apply the quirk, a per-platform method can retrieve the phandle from the
> +select-quirk property and pass it to the of_quirk_apply_by_phandle() node.
> +
> +The method which the per-platform method is using to select the quirk to apply
> +is out of the scope of the DT quirk definition, but possible methods include
> +and are not limited to: revision encoding in a GPIO input range, board id
> +located in external or internal EEPROM or flash, DMI board ids, etc.

It seems rather unfortunate that to get a useful device tree we have to
resort to board-specific mechanisms. That means yet more platform code,
which is rather unfortunate. This would also require any other DT users
to understand and potentially have to sanitize any quirks (e.g. in the
case of Xen).

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
