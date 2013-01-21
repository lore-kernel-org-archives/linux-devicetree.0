From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/8] Introduce fdtgrep for subsetting and hashing FDTs
Date: Mon, 21 Jan 2013 12:59:14 -0800
Message-ID: <1358801962-21707-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds a new function, fdt_find_regions() which maps FDT parts
such as nodes and properties to their regions in the FDT binary. The
function is then used to implement a grep utility for FDTs.

The function itself is quite simple and small, but this series adds tests
and a grep utility, so quite a bit of code is built on it.

The use for this function is twofold. Firstly it provides a convenient
way of performing a structure-aware grep of the tree. For example it is
possible to grep for a node and get all the properties associated with
that node. Trees can be subsetted easily, by specifying the nodes that
are required, and then writing out the regions returned by this function.
This is useful for small resource-constrained systems, such as boot
loaders, which want to use an FDT but do not need to know about all of
it. The full FDT can be grepped to pull out the few things that are
needed - this can be automatic and does not require the FDT source code.

This first use makes it easy to implement an FDT grep. Options are
provided to search for matching nodes (by name or compatible string),
properties and also for any of the above. It is possible to search for
non-matches also (useful for excluding a particular property from the
FDT, for example). The output is like fdtdump, but only with the regions
selected by the grep. Options are also provided to print the string table,
memory reservation table, etc. The fdtgrep utility can output valid
source, which can be used by dtc, but it can also directly output a new
.dtb binary.

Secondly it makes it easy to hash parts of the tree and detect changes.
The intent is to get a list of regions which will be invariant provided
those parts are invariant. For example, if you request a list of regions
for all nodes but exclude the property "data", then you will get the
same region contents regardless of any change to "data" properties.

This second use is the subject of a recent series sent to the U-Boot
mailing list, to enhance FIT images to support verified boot. Briefly,
this works by signing configurations (consisting of particular kernel
and FDT combinations) so that the boot loader can verify that these
combinations are valid and permitted. Since a FIT image is in fact an
FDT, we need to be able to hash particular regions of the FDT for the
signing and verification process. This is done by using fdt_find_regions()
to select the data that needs to be hashed for a particular configuration.

The fdtgrep utility can fairly easily replace all of the functions of
fdtdump, so this series turns fdtdump into a symlink.


Simon Glass (8):
  Adjust util_is_printable_string() comment and fix test
  Move property-printing into util
  .gitignore: Add rule for *.patch
  Export fdt_stringlist_contains()
  libfdt: Add function to find regions in an FDT
  Add fdtgrep to grep and subset FDTs
  Remove fdtdump and use fdtgrep instead
  RFC: Check offset in fdt_string()

 .gitignore           |    2 +
 Makefile             |    9 +-
 Makefile.utils       |    7 +
 fdtdump.c            |  172 -----------
 fdtgrep.c            |  789 ++++++++++++++++++++++++++++++++++++++++++++++++++
 libfdt/fdt_ro.c      |    7 +-
 libfdt/fdt_wip.c     |  311 ++++++++++++++++++++
 libfdt/libfdt.h      |  156 ++++++++++
 tests/.gitignore     |    1 +
 tests/Makefile.tests |    3 +-
 tests/grep.dts       |   23 ++
 tests/region_tree.c  |  324 +++++++++++++++++++++
 tests/run_tests.sh   |  357 ++++++++++++++++++++++-
 tests/tests.sh       |    1 +
 util.c               |   37 +++
 util.h               |   22 ++-
 16 files changed, 2036 insertions(+), 185 deletions(-)
 delete mode 100644 fdtdump.c
 create mode 100644 fdtgrep.c
 create mode 100644 tests/grep.dts
 create mode 100644 tests/region_tree.c

-- 
1.7.7.3
