From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] Add basic device tree support for Samsung's SMDKV310
	machine.
Date: Sun, 06 Feb 2011 18:47:26 +0530
Message-ID: <1296998250-21856-1-git-send-email-thomas.abraham@linaro.org>
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

This patchset adds Samsung's SMDKV310 machine with device tree support. The
bootargs and memory information is obtained from the device tree. The
watchdog driver is also modified such that it is probed based on the information
from the device tree.

Thomas Abraham (4):
 ARM: DT: Add SMDKV310 machine with device tree support.
 ARM: DT: Add a basic dts file for SMDKV310 machine
 ARM: DT: Add support for probing platform bus on SMDKV310 machine
 watchdog: s3c2410: Add support for device tree based probe

 arch/arm/mach-s5pv310/Kconfig            |    7 ++
 arch/arm/mach-s5pv310/Makefile           |    1 +
 arch/arm/mach-s5pv310/mach-smdkv310-dt.c |  107 ++++++++++++++++++++++++++++++
 arch/arm/mach-s5pv310/mach-smdkv310.dts  |   38 +++++++++++
 drivers/watchdog/s3c2410_wdt.c           |   10 +++
 5 files changed, 163 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv310/mach-smdkv310-dt.c
 create mode 100755 arch/arm/mach-s5pv310/mach-smdkv310.dts
