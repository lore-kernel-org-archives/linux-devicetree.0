From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 0/19] Allow images to work on sandbox
Date: Tue,  7 May 2013 09:11:44 -0700
Message-ID: <1367943123-16013-1-git-send-email-sjg@chromium.org>
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
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adjusts the image code to work with sandbox and prepares it for
verified boot to come later.

The primary goal here is to get image loading to work on sandbox, which is
mostly a set of fairly minor changes such as using map_sysmem() instead of
just a cast when converting from a U-Boot address to a pointer. Since
common/image.c runs to over 3000 lines and half of it is FIT-related code
behind an #ifdef, this code is moved into a new image-fit.c file.

Changes in v4:
- Bring in upstream version of fdt_first/next_subnode()
- Use new upstream fdt_first/next_subnode()

Changes in v3:
- Split out image improvements into a separate series
- Update notes to note that generic board support has now landed

Changes in v2:
- Add IMAGE_ENABLE_IGNORE to avoid #ifdef around ignore property handling
- Change hash_block() to use an unsigned int len
- Clarify use of output_size parameter to hash_block()
- Fix checkpatch checks about parenthesis alignment
- Fix line continuation problem
- Put err_msgp strings on a single line
- Put params before description in fit_conf_get_prop_node() comment
- Rebase on previous patches
- Rename commit message to say "function" instead of "function"

Simon Glass (19):
  env: Fix minor comment typos in cmd_nvedit
  Add minor updates to README.fdt-control
  hash: Add a way to calculate a hash for any algortihm
  bootstage: Don't build for HOSTCC
  mkimage: Move ARRAY_SIZE to header file
  libfdt: Add fdt_next_subnode() to permit easy subnode iteration
  image: Move timestamp #ifdefs to header file
  image: Export fit_check_ramdisk()
  image: Split FIT code into new image-fit.c
  image: Move HOSTCC image code to tools/
  image: Split hash node processing into its own function
  image: Convert fit_image_hash_set_value() to static, and rename
  image: Rename fit_image_check_hashes() to fit_image_verify()
  image: Move hash checking into its own function
  image: Move error! string to common place
  image: Export fit_conf_get_prop_node()
  image: Rename fit_add_hashes() to fit_add_verification_data()
  image: Rename hash printing to fit_image_print_verification_data()
  sandbox: image: Add support for booting images in sandbox

 common/Makefile        |    1 +
 common/cmd_bootm.c     |   25 +-
 common/cmd_fpga.c      |    2 +-
 common/cmd_nvedit.c    |    4 +-
 common/cmd_source.c    |    2 +-
 common/cmd_ximg.c      |    2 +-
 common/hash.c          |   23 +
 common/image-fit.c     | 1495 ++++++++++++++++++++++++++++++++++++++++++
 common/image.c         | 1679 ++----------------------------------------------
 common/update.c        |    2 +-
 doc/README.fdt-control |    9 +-
 include/bootstage.h    |    5 +-
 include/hash.h         |   22 +
 include/image.h        |   55 +-
 include/libfdt.h       |   22 +
 lib/libfdt/fdt.c       |   28 +
 tools/Makefile         |    4 +
 tools/aisimage.c       |    1 -
 tools/fit_image.c      |    2 +-
 tools/image-host.c     |  208 ++++++
 tools/mkimage.h        |    2 +
 21 files changed, 1917 insertions(+), 1676 deletions(-)
 create mode 100644 common/image-fit.c
 create mode 100644 tools/image-host.c

-- 
1.8.2.1
