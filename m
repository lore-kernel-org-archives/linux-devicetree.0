From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 0/6] Add fdtget and fdtput for access to fdt from build
	system
Date: Wed,  7 Sep 2011 12:54:14 -0700
Message-ID: <1315425260-2711-1-git-send-email-sjg@chromium.org>
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
- Adjust tests for new fdtput arguments
- Add test for multiple strings
- Add test for exhausting fdt space
- Separate arguments for node and property
- Remove limits on data size of property writting to fdt
- Remove use of getopt_long()
- Adjust tests for new fdtget arguments
- Merge two related commits into this one
- Use structure for storing display options
- Remove util_decode_key
- Add utilfdt_decode_type to be used by fdtget/put
- Remove limits on device tree binary size

Simon Glass (6):
  Add utilfdt for common functions
  ftdump: use util_read_fdt
  Add fdtget utility to read property values from device tree
  fdtget: Add basic tests
  Add new fdtput utility to write values to fdt
  fdtput: Add basic tests

 .gitignore              |    2 +
 Makefile                |   12 +++-
 Makefile.fdtget         |   12 +++
 Makefile.fdtput         |   12 +++
 Makefile.ftdump         |    3 +-
 fdtget.c                |  200 +++++++++++++++++++++++++++++++++++++++++++
 fdtput.c                |  217 +++++++++++++++++++++++++++++++++++++++++++++++
 ftdump.c                |   33 +------
 tests/fdtget-runtest.sh |   35 ++++++++
 tests/fdtput-runtest.sh |   55 ++++++++++++
 tests/run_tests.sh      |  105 ++++++++++++++++++++++-
 tests/tests.sh          |    2 +
 utilfdt.c               |  120 ++++++++++++++++++++++++++
 utilfdt.h               |   58 +++++++++++++
 14 files changed, 835 insertions(+), 31 deletions(-)
 create mode 100644 Makefile.fdtget
 create mode 100644 Makefile.fdtput
 create mode 100644 fdtget.c
 create mode 100644 fdtput.c
 create mode 100755 tests/fdtget-runtest.sh
 create mode 100644 tests/fdtput-runtest.sh
 create mode 100644 utilfdt.c
 create mode 100644 utilfdt.h

-- 
1.7.3.1
