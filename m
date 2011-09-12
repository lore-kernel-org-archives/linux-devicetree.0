From: y@google.com
Subject: [PATCH v3 0/7] Add fdtget and fdtput for access to fdt from build
	system
Date: Mon, 12 Sep 2011 13:03:02 -0700
Message-ID: <38737.9548083574$1316624818@news.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This patch set adds two new utilities:

   fdtget for reading properties from a device tree binary file
   fdtput for updating the device tree binary file

These are useful in scripts where configuration or other information must be
passed to the running system from the build system or vice versa. For
example, fdtget can be used to obtain the LCD screen width/height for use
with preparing custom bitmap images for display on the screen. Going the
other way, fdtput can be used to set configuration parameters known only to
the build or manufacturing test system, for example a hardware ID or the
particular type of boot EEPROM used on this PCB.

It is desirable to use these utilities rather than parsing or updating the
device tree source file, since this parsing is already implemented in dtc and
it makes no sense to reimplement it in a script. It also means that the build
system and the run-time environment see the same device tree values, so that
parsing or updating bugs do not creap in.

I believe that these utilities belong with dtc rather than libfdt since they
are more useful in the build system context rather than at run-time. At
run-time it is easier and better to use the provided library rather than
these utiltiies. But for build scripts and production automation, these
uitilites are better.

Some effort has been made to add tests and the parameter format has been
revised after previous feedback.

Changes in v2:
- Separate arguments for node and property
- Remove limits on data size of property writting to fdt
- Remove use of getopt_long()
- Adjust tests for new fdtput arguments
- Add test for multiple strings
- Add test for exhausting fdt space
- Merge two related commits into this one
- Use structure for storing display options
- Adjust tests for new fdtget arguments
- Remove util_decode_key
- Add utilfdt_decode_type to be used by fdtget/put
- Remove limits on device tree binary size

Changes in v3:
- Squash fdtput tests into fdtput commit
- Squash fdtget test commit into fdtget
- Add a few more tests for 1- and 2-byte formats
- Change format of -t argument to be more like printf
- Change help string and make part of it common
- Add error checking for the property not being a multiple of value size
- Make testutils.c use utilfdt for load/save blobs
- Add tests for utilfdt
- Move utilfdt into its own directory and make it a library
- Use code closer to testutils.c implementation
- Use open/close instead of fopen/fclose
- Use Makefile.utils instead of separate Makefiles

Simon Glass (7):
  Create Makefile.utils and move ftdump into it
  Add utilfdt for common functions
  Add utilfdt tests
  Make testutils use utilfdt
  ftdump: use utilfdt to read blob
  Add fdtget utility to read property values from a device tree
  Add fdtput utility to write property values to a device tree

 .gitignore               |    2 +
 Makefile                 |   43 ++++++++-
 Makefile.ftdump          |   13 ---
 Makefile.utils           |   24 +++++
 fdtget.c                 |  227 ++++++++++++++++++++++++++++++++++++++++++++
 fdtput.c                 |  236 ++++++++++++++++++++++++++++++++++++++++++++++
 ftdump.c                 |   33 +------
 tests/Makefile.tests     |    9 +-
 tests/fdtget-runtest.sh  |   35 +++++++
 tests/fdtput-runtest.sh  |   55 +++++++++++
 tests/run_tests.sh       |  121 +++++++++++++++++++++++-
 tests/tests.sh           |    2 +
 tests/testutils.c        |   60 +++----------
 tests/utilfdt_test.c     |  128 +++++++++++++++++++++++++
 utilfdt/Makefile.utilfdt |    9 ++
 utilfdt/utilfdt.c        |  167 ++++++++++++++++++++++++++++++++
 utilfdt/utilfdt.h        |  101 ++++++++++++++++++++
 17 files changed, 1168 insertions(+), 97 deletions(-)
 delete mode 100644 Makefile.ftdump
 create mode 100644 Makefile.utils
 create mode 100644 fdtget.c
 create mode 100644 fdtput.c
 create mode 100755 tests/fdtget-runtest.sh
 create mode 100644 tests/fdtput-runtest.sh
 create mode 100644 tests/utilfdt_test.c
 create mode 100644 utilfdt/Makefile.utilfdt
 create mode 100644 utilfdt/utilfdt.c
 create mode 100644 utilfdt/utilfdt.h

-- 
1.7.3.1
