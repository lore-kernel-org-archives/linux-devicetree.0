From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/9] Add dtget and dtput for access to fdt from build system
Date: Tue,  5 Jul 2011 12:02:48 -0700
Message-ID: <1309892577-23828-1-git-send-email-sjg@chromium.org>
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

This patch set adds two new utilities:

   dtget for reading properties from a device tree binary file
   dtput for updating the device tree binary file

These are useful in scripts where configuration or other information must be
passed to the running system from the build system or vice versa. For example,
dtget can be used to obtain the LCD screen width/height for use with preparing
custom bitmap images for display on the screen. Going the other way, dtput can
be used to set configuration parameters known only to the build or
manufacturing test system, for example a hardware ID or the particular type
of boot EEPROM used on this PCB.

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

Some effort has been made to add tests and to use a sensible parameter format,
but comments are welcome on these and any other part of this patch set.


Simon Glass (9):
  Split out is_printable_string() into util.c
  Add dtget utility to read property values from device tree
  Add basic tests for dtget
  Add missing tests to .gitignore
  Add utilfdt for common functions, adjust dtget
  Add new dtput utility to write values to fdt
  Add some tests for dtput
  Add dtput to .gitignore
  dtput: Support adding strings with spaces

 .gitignore             |    2 +
 Makefile               |   14 ++++
 Makefile.dtget         |   14 ++++
 Makefile.dtput         |   14 ++++
 Makefile.ftdump        |    3 +-
 dtget.c                |  166 +++++++++++++++++++++++++++++++++++++++
 dtput.c                |  204 ++++++++++++++++++++++++++++++++++++++++++++++++
 ftdump.c               |   28 +------
 tests/.gitignore       |    2 +
 tests/dtget-runtest.sh |   30 +++++++
 tests/dtget-test.dts   |   63 +++++++++++++++
 tests/dtput-runtest.sh |   50 ++++++++++++
 tests/run_tests.sh     |   73 +++++++++++++++++-
 tests/tests.sh         |    2 +
 util.c                 |   28 +++++++
 util.h                 |   11 +++
 utilfdt.c              |  113 ++++++++++++++++++++++++++
 utilfdt.h              |   58 ++++++++++++++
 18 files changed, 848 insertions(+), 27 deletions(-)
 create mode 100644 Makefile.dtget
 create mode 100644 Makefile.dtput
 create mode 100644 dtget.c
 create mode 100644 dtput.c
 create mode 100755 tests/dtget-runtest.sh
 create mode 100644 tests/dtget-test.dts
 create mode 100644 tests/dtput-runtest.sh
 create mode 100644 utilfdt.c
 create mode 100644 utilfdt.h

-- 
1.7.3.1
