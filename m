From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
Date: Sat, 5 Dec 2015 12:39:41 +0100
Message-ID: <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com> <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449292763-129421-4-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The platform description (such as the type of partition formats used on
> a given flash) should be done independently of the flash driver in use.
> However, we can't reasonably have *all* partition parsers run on all
> flash (until they find a match), so let's overload the 'partitions'
> subnode to support specifying which format(s) to try in the device tree.
>
> Start by supporting Google's (Chrome OS) FMAP structure.
>
> There have been others interested in extending devicetree support to
> other parsers, like the bcm47xxpart parser:
>
>   http://patchwork.ozlabs.org/patch/475986/
>
> and the AFS (ARM Flash Structure?) parser:
>
>   http://patchwork.ozlabs.org/patch/537827/
>
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/partition.txt          | 75 ++++++++++++++++++++--
>  1 file changed, 69 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
> index 28ae56f5c972..1bf9a7243993 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -1,29 +1,56 @@
> -Representing flash partitions in devicetree
> +Flash partitions in device tree
> +===============================
>
> -Partitions can be represented by sub-nodes of an mtd device. This can be used
> +Flash devices can be partitioned into one or more functional ranges (e.g.,
> +"boot code", "nvram", and "kernel") in at least two distinct ways:
> +
> + (A) a fixed flash layout at production time or
> + (B) with an on-flash partition table, such as RedBoot, that describes the
> +     geometry and naming/purpose of each functional region
> +
> +The former typically requires an operating system to learn about the
> +partitioning from some kind of metadata provided by the bootloader/firmware.
> +Such partitions can be described using the method in "Section A: Fixed Partitions".
> +
> +The latter is somewhat analogous to partition tables used on block devices
> +(e.g., MBR or GPT), except that there is less standardization for flash
> +devices, and it is not always safe or efficient to attempt to search for all of
> +them on every flash device in the system, particularly since many of them allow
> +their data structures to be placed anywhere on the flash, and so require
> +scanning the entire flash device to find them.
> +
> +To assist system software in locating these partition tables, we provide a
> +binding to describe which partition format(s) may be used on a given flash,
> +found below in "Section B: On-Flash Partition Tables".
> +
> +
> +Section A: Fixed Partitions
> +---------------------------
> +
> +Partitions can be represented by sub-nodes of a flash device. This can be used
>  on platforms which have strong conventions about which portions of a flash are
>  used for what purposes, but which don't use an on-flash partition table such
>  as RedBoot.
>
> -The partition table should be a subnode of the mtd node and should be named
> +The partition table should be a subnode of the flash node and should be named
>  'partitions'. This node should have the following property:
>  - compatible : (required) must be "partitions"
>  Partitions are then defined in subnodes of the partitions node.
>
> -For backwards compatibility partitions as direct subnodes of the mtd device are
> +For backwards compatibility partitions as direct subnodes of the flash device are
>  supported. This use is discouraged.
>  NOTE: also for backwards compatibility, direct subnodes that have a compatible
>  string are not considered partitions, as they may be used for other bindings.
>
>  #address-cells & #size-cells must both be present in the partitions subnode of the
> -mtd device. There are two valid values for both:
> +flash device. There are two valid values for both:
>  <1>: for partitions that require a single 32-bit cell to represent their
>       size/address (aka the value is below 4 GiB)
>  <2>: for partitions that require two 32-bit cells to represent their
>       size/address (aka the value is 4 GiB or greater).
>
>  Required properties:
> -- reg : The partition's offset and size within the mtd bank.
> +- reg : The partition's offset and size within the flash
>
>  Optional properties:
>  - label : The label / name for this partition.  If omitted, the label is taken
> @@ -89,3 +116,39 @@ flash@2 {
>                 };
>         };
>  };
> +
> +
> +Section B: On-Flash Partition Tables
> +------------------------------------
> +
> +System designers use a variety of on-flash data structures to describe the
> +layout of the flash. Because it's not always optimal for system software to
> +scan for every sort of data structure that might be used, one can specify which
> +structure(s) might be used on a given flash using the 'partitions' subnode of
> +the flash node.
> +
> +Node name: partitions
> +Properties:
> + - compatible: (required) used to define which partition format(s) may be in
> +   use on this flash may contain one or more of the strings defined in the
> +   following subsections
> +
> +
> +Google's FMAP (Flash MAP)
> +#########################
> +
> +Often used to describe the boot flash on Chrome OS devices. Specified here:
> +
> +  https://github.com/dhendrix/flashmap/blob/wiki/FmapSpec.md
> +
> +Properties:
> +- compatible: (required) must include "google,fmap"
> +
> +
> +Examples:
> +
> +flash@0 {
> +       partitions {
> +               compatible = "google,fmap";
> +       };
> +};

I wonder if this wouldn't be better served in a separate binding doc
with its compatible name as the filename, like we do with
driver^Whardware blocks, especially if we want to add more parsers.


Jonas
