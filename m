From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Introduce fdtgrep for subsetting and hashing FDTs
Date: Sat, 30 Nov 2013 17:27:58 -0700
Message-ID: <CAPnjgZ2RnWkReEC2bGsdcS21ujtypdHT-HZhFQqgXFzgAd74fA@mail.gmail.com>
References: <1383164153-14379-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383164153-14379-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 30 October 2013 14:15, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> This series adds two new functions, fdt_first_region() and
> fdt_next_regions() which map FDT parts such as nodes and properties to
> their regions in the FDT binary. The function is then used to implement
> a grep utility for FDTs.
>
> The core core is quite simple and small, but it grew a little due
> to the need to make it iterative (first/next/next). Also this series adds
> tests and a grep utility, so quite a bit of code is built on it.
>
> The use for this feature is twofold. Firstly it provides a convenient
> way of performing a structure-aware grep of the tree. For example it is
> possible to grep for a node and get all the properties associated with
> that node. Trees can be subsetted easily, by specifying the nodes that
> are required, and then writing out the regions returned by this function.
> This is useful for small resource-constrained systems, such as boot
> loaders, which want to use an FDT but do not need to know about all of
> it. The full FDT can be grepped to pull out the few things that are
> needed - this can be automatic and does not require the FDT source code.
>
> This first use makes it easy to implement an FDT grep. Options are
> provided to search for matching nodes (by name or compatible string),
> properties and also for any of the above. It is possible to search for
> non-matches also (useful for excluding a particular property from the
> FDT, for example). The output is like fdtdump, but only with the regions
> selected by the grep. Options are also provided to print the string table,
> memory reservation table, etc. The fdtgrep utility can output valid
> source, which can be used by dtc, but it can also directly output a new
> .dtb binary.
>
> Secondly it makes it easy to hash parts of the tree and detect changes.
> The intent is to get a list of regions which will be invariant provided
> those parts are invariant. For example, if you request a list of regions
> for all nodes but exclude the property "data", then you will get the
> same region contents regardless of any change to "data" properties.
> An assumption is made here that the tree ordering remains the same.
>
> This second use is the subject of a recent series sent to the U-Boot
> mailing list, to enhance FIT images to support verified boot. Briefly,
> this works by signing configurations (consisting of particular kernel
> and FDT combinations) so that the boot loader can verify that these
> combinations are valid and permitted. Since a FIT image is in fact an
> FDT, we need to be able to hash particular regions of the FDT for the
> signing and verification process. This is done by using the region functions
> to select the data that needs to be hashed for a particular configuration.
>
> The fdtgrep utility could be used to replace all of the functions of
> fdtdump. However fdtdump is intended as a separate, simple way of
> dumping the tree (for verifying against dtc output for example). So
> fdtdump remains a separate program and this series leaves it alone.
>
> Note: a somewhat unfortunately feature of this implementation is that
> a state structure needs to be kept around between calls of
> fdt_next_region(). This is declared in libfdt.h but really should be
> opaque.

Any comments on this please, or should I resend?

Regards,
Simon

>
> Changes in v3:
> - Add a feature to include all subnodes
> - Adjust help and command line processing to follow new approach
> - Rename -V to -I to avoid using -V for a different purpose to other tools
> - Rename -s to -e since it only 'enters' the node and does not include it all
> - Add -s option to include all subnodes
> - Add -f option to display offset; make -a display an absolute file address
> - Add documentation on fdtgrep
>
> Changes in v2:
> - Move region code to separate fdt_region.c file
> - Fix info->count <= info->max_regions in fdt_add_region() merge case
> - Add new FDT_ERR_TOODEEP error type and use it
> - Change returned error from BADLAYOUT to BADSTRUCTURE
> - Return FDT_ERR_BADLAYOUT error if strings block is before structure block
> - Add note that changes in node/property order can cause false hash misses
> - Add more comments about the -1 return value from h_include
> - Drop FDT_IS_COMPAT and pass node offset to h_include function
> - Drop stale comment about names / wildcards
> - Move to a model with fdt_first_region()/fdt_next_region()
> - Add long comment explaining theory of operation
> - Add local fdt_find_regions() function since libfdt no longer has it
>
> Simon Glass (3):
>   libfdt: Add function to find regions in an FDT
>   Add documentation for fdtget/put
>   Add fdtgrep to grep and subset FDTs
>
>  .gitignore               |   1 +
>  Documentation/manual.txt | 125 +++++++
>  Makefile                 |   4 +
>  Makefile.utils           |   7 +
>  fdtgrep.c                | 873 +++++++++++++++++++++++++++++++++++++++++++++++
>  libfdt/Makefile.libfdt   |   3 +-
>  libfdt/fdt_region.c      | 457 +++++++++++++++++++++++++
>  libfdt/libfdt.h          | 217 +++++++++++-
>  tests/.gitignore         |   1 +
>  tests/Makefile.tests     |   3 +-
>  tests/grep.dts           |  23 ++
>  tests/region_tree.c      | 352 +++++++++++++++++++
>  tests/run_tests.sh       | 361 +++++++++++++++++++-
>  tests/tests.sh           |   1 +
>  14 files changed, 2424 insertions(+), 4 deletions(-)
>  create mode 100644 fdtgrep.c
>  create mode 100644 libfdt/fdt_region.c
>  create mode 100644 tests/grep.dts
>  create mode 100644 tests/region_tree.c
>
> --
> 1.8.4.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
