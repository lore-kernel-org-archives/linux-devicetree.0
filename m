From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/7] Add Samsung's s5pv310 machine with device tree enabled
Date: Sat, 12 Feb 2011 18:16:58 +0530
Message-ID: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds Samsung's s5pv310 machine with device tree support. This
is based on

git://git.secretlab.ca/git/linux-2.6 devicetree/test

A new machine s5pv310-dt is added along with a dts file for the smdkv310 board.
Some of the features introduced in this patchset are

1. Tested on smdkv310 board and information such as bootargs, memory information
   and console port register defaults are obtained from the device tree.
2. Add basic device tree file for smdkv310 board.
3. Device tree based probe enabled in watchdog timer driver (s3c2410-wdt).
4. UART driver modified to obtain default console register values from
   device tree.

In addition, the first 5 patches have been tested with
git://git.secretlab.ca/git/linux-2.6 devicetree/arm

and (with minor modification [driver/tty/serial -> drivers/serial])
git://git.secretlab.ca/git/linux-2.6 devicetree/arm-linaro-2.6.37

Thomas Abraham (7):
  ARM: s5pv310-dt: Add s5pv310 machine with device tree support
  ARM: s5pv310-dt: Add a basic dts file for SMDKV310 machine
  ARM: s5pv310-dt: Add support for probing platform bus on s5pv310 dt-enabled machine
  watchdog: s3c2410: Add support for device tree based probe
  serial: samsung: Get console register defaults from device tree
  ARM: s5pv310-dt: Enable snooping of platform_device registrations
  serial: samsung: Get default port register settings from device tree

 arch/arm/mach-s5pv310/Kconfig           |    7 +++
 arch/arm/mach-s5pv310/Makefile          |    1 +
 arch/arm/mach-s5pv310/mach-s5pv310-dt.c |   85 +++++++++++++++++++++++++++++++
 arch/arm/mach-s5pv310/mach-smdkv310.dts |   78 ++++++++++++++++++++++++++++
 drivers/tty/serial/samsung.c            |   27 ++++++++++
 drivers/watchdog/s3c2410_wdt.c          |   10 ++++
 6 files changed, 208 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv310/mach-s5pv310-dt.c
 create mode 100755 arch/arm/mach-s5pv310/mach-smdkv310.dts
