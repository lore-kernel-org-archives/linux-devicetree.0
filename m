From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 0/12] Verified boot implementation based on FIT
Date: Thu, 13 Jun 2013 15:09:59 -0700
Message-ID: <1371161411-2834-1-git-send-email-sjg@chromium.org>
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
Cc: Joel A Fernandes <joelagnel-l0cyMroinI0@public.gmane.org>, Will Drewry <wad-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Randall Spangler <rspangler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Vadim Bendebury <vbendeb-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?q?Andreas=20B=C3=A4ck?= <andreas.back778-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series implemented a verified boot system based around FIT images
as discussed on the U-Boot mailing list, including on this thread:

http://permalink.gmane.org/gmane.comp.boot-loaders.u-boot/147830

RSA is used to implement the encryption. Images are signed by mkimage
using private keys created by the user. Public keys are written into
U-Boot control FDT (CONFIG_OF_CONTROL) for access by bootm etc. at
run-time. The control FDT must be stored in a secure place where it
cannot be changed after manufacture. Some notes are provided in the
documentaion on how this can be achieved. The implementation is fairly
efficient and fits nicely into U-Boot. FIT plus RSA adds around 18KB
to SPL size which is manageable on modern SoCs.

When images are loaded, they are verified with the public keys.

It is important to have a test framework for this series. For this, sandbox
is used, and a script is provided which signs images and gets sandbox to
load them using a script, to check that all is well.

Rollback prevention has been added in a separate TPM patch. This ensures
that an attacker cannot boot your system with an old image that has been
compromised. Support for this is not built into bootm, but instead must
be scripted in U-Boot. It is possible that a standard scheme for this could
be devised by adding version number tags to the signing procedure. However
scripts do provide more flexibility. See the 'tpm' command for more
information.

Two patches affect libfdt and have material which is not yet upstream in
that project:

   image: Add support for signing of FIT configurations
   libfdt: Add fdt_find_regions()

If these are not desired, then the rest of the series can stand alone,
just without the configuration-signing feature.

This series requires the 'trace' series since it sits on top of the bootm
refactor there.

This series is available at:

http://git.denx.de/u-boot-x86.git

in the branch 'vboot'.

Changes in v3:
- Fix 'compile' typo
- Rebase to master
- Use new fdt_first/next_subnode()

Changes in v2:
- Add sanity checks on key sizes in RSA (improves security)
- Adjust how signing enable works in image.h
- Adjust mkimage help to separate out signing options
- Avoid using malloc in RSA routines (for smaller SPL code size)
- Build signing support unconditionally in mkimage
- Fix FDT error handling in fit_image_write_sig()
- Fix checkpatch checks about parenthesis alignment
- Fix checkpatch warnings about split strings
- Fix spelling of multiply in rsa-verify.c
- Only build RSA support into mkimage if CONFIG_RSA is defined
- Rebase on previous patches
- Require CONFIG_FIT_SIGNATURE in image.h for mkimage to support signing
- Support RSA library version without ERR_remove_thread_state()
- Tweak tools/Makefile to make image signing optional
- Update README to fix typos
- Update README to fix typos and clarify some points
- Use U-Boot's -c option instead of hard-coding a boot script
- Use stack instead of calloc() within U-Boot's signature verification code
- gd->fdt_blob is now available on all archs (generic board landed)

Simon Glass (12):
  image: Add signing infrastructure
  image: Support signing of images
  image: Add RSA support for image signing
  mkimage: Add -k option to specify key directory
  mkimage: Add -K to write public keys to an FDT blob
  mkimage: Add -F option to modify an existing .fit file
  mkimage: Add -c option to specify a comment for key signing
  mkimage: Add -r option to specify keys that must be verified
  libfdt: Add fdt_find_regions()
  image: Add support for signing of FIT configurations
  sandbox: config: Enable FIT signatures with RSA
  Add verified boot information and test

 Makefile                         |   1 +
 README                           |  15 ++
 common/Makefile                  |   1 +
 common/image-fit.c               |  83 ++++--
 common/image-sig.c               | 422 +++++++++++++++++++++++++++++++
 config.mk                        |   1 +
 doc/mkimage.1                    |  73 +++++-
 doc/uImage.FIT/sign-configs.its  |  45 ++++
 doc/uImage.FIT/sign-images.its   |  42 ++++
 doc/uImage.FIT/signature.txt     | 382 ++++++++++++++++++++++++++++
 doc/uImage.FIT/verified-boot.txt | 104 ++++++++
 include/configs/sandbox.h        |   2 +
 include/image.h                  | 165 +++++++++++-
 include/libfdt.h                 |  64 +++++
 include/rsa.h                    | 108 ++++++++
 lib/libfdt/fdt_wip.c             | 129 ++++++++++
 lib/rsa/Makefile                 |  48 ++++
 lib/rsa/rsa-sign.c               | 460 ++++++++++++++++++++++++++++++++++
 lib/rsa/rsa-verify.c             | 385 ++++++++++++++++++++++++++++
 test/vboot/.gitignore            |   3 +
 test/vboot/sandbox-kernel.dts    |   7 +
 test/vboot/sandbox-u-boot.dts    |   7 +
 test/vboot/sign-configs.its      |  45 ++++
 test/vboot/sign-images.its       |  42 ++++
 test/vboot/vboot_test.sh         | 126 ++++++++++
 tools/Makefile                   |  19 +-
 tools/fit_image.c                |  44 +++-
 tools/image-host.c               | 527 ++++++++++++++++++++++++++++++++++++++-
 tools/mkimage.c                  |  36 ++-
 tools/mkimage.h                  |   4 +
 30 files changed, 3333 insertions(+), 57 deletions(-)
 create mode 100644 common/image-sig.c
 create mode 100644 doc/uImage.FIT/sign-configs.its
 create mode 100644 doc/uImage.FIT/sign-images.its
 create mode 100644 doc/uImage.FIT/signature.txt
 create mode 100644 doc/uImage.FIT/verified-boot.txt
 create mode 100644 include/rsa.h
 create mode 100644 lib/rsa/Makefile
 create mode 100644 lib/rsa/rsa-sign.c
 create mode 100644 lib/rsa/rsa-verify.c
 create mode 100644 test/vboot/.gitignore
 create mode 100644 test/vboot/sandbox-kernel.dts
 create mode 100644 test/vboot/sandbox-u-boot.dts
 create mode 100644 test/vboot/sign-configs.its
 create mode 100644 test/vboot/sign-images.its
 create mode 100755 test/vboot/vboot_test.sh

-- 
1.8.3
