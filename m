From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [RFC PATCH 0/3] ARM: use C pre-processor with dtc
Date: Tue, 25 Sep 2012 13:06:35 -0600
Message-ID: <1348599998-2729-1-git-send-email-swarren@wwwdotorg.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This series adds some build rules to run cpp on *.dts-cpp prior to
invoking dtc, and converts Tegra to the new rule as an example. What do
people think?

I assume that you've applied the dtc patches I sent yesterday. They
aren't in this series. See:

https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-September/020182.html
https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-September/020183.html
https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-September/020181.html

Note: those patches are against upstream dtc. If you wish to test this
series, apply the dtc patches to upstream dtc, build it, and copy the
resultant dtc binary over the top of scripts/dtc/dtc.

Stephen Warren (3):
  kbuild: introduce cmd_dtc_cpp
  ARM: use cmd_dtc_cpp for compilation of *.dts-cpp to *.dtb
  ARM: tegra: compile all DT files with cpp

 arch/arm/boot/Makefile                             |    3 ++
 arch/arm/boot/dts/skeleton.dtsi-cpp                |   13 +++++++
 ...tegra20-harmony.dts => tegra20-harmony.dts-cpp} |   10 +++---
 ...medcom-wide.dts => tegra20-medcom-wide.dts-cpp} |    4 +-
 .../{tegra20-paz00.dts => tegra20-paz00.dts-cpp}   |   14 ++++----
 .../{tegra20-plutux.dts => tegra20-plutux.dts-cpp} |    4 +-
 ...gra20-seaboard.dts => tegra20-seaboard.dts-cpp} |   22 ++++++------
 ...a20-tamonten.dtsi => tegra20-tamonten.dtsi-cpp} |    8 ++--
 .../dts/{tegra20-tec.dts => tegra20-tec.dts-cpp}   |    4 +-
 ...a20-trimslice.dts => tegra20-trimslice.dts-cpp} |    2 +-
 ...tegra20-ventana.dts => tegra20-ventana.dts-cpp} |   10 +++---
 ...gra20-whistler.dts => tegra20-whistler.dts-cpp} |    8 ++--
 .../boot/dts/{tegra20.dtsi => tegra20.dtsi-cpp}    |   30 +++++++++---------
 ...0-cardhu-a02.dts => tegra30-cardhu-a02.dts-cpp} |    6 ++--
 ...0-cardhu-a04.dts => tegra30-cardhu-a04.dts-cpp} |    6 ++--
 ...tegra30-cardhu.dtsi => tegra30-cardhu.dtsi-cpp} |   12 +++---
 .../boot/dts/{tegra30.dtsi => tegra30.dtsi-cpp}    |   34 ++++++++++----------
 scripts/Makefile.lib                               |    3 ++
 18 files changed, 106 insertions(+), 87 deletions(-)
 create mode 100644 arch/arm/boot/dts/skeleton.dtsi-cpp
 rename arch/arm/boot/dts/{tegra20-harmony.dts => tegra20-harmony.dts-cpp} (98%)
 rename arch/arm/boot/dts/{tegra20-medcom-wide.dts => tegra20-medcom-wide.dts-cpp} (95%)
 rename arch/arm/boot/dts/{tegra20-paz00.dts => tegra20-paz00.dts-cpp} (98%)
 rename arch/arm/boot/dts/{tegra20-plutux.dts => tegra20-plutux.dts-cpp} (94%)
 rename arch/arm/boot/dts/{tegra20-seaboard.dts => tegra20-seaboard.dts-cpp} (98%)
 rename arch/arm/boot/dts/{tegra20-tamonten.dtsi => tegra20-tamonten.dtsi-cpp} (98%)
 rename arch/arm/boot/dts/{tegra20-tec.dts => tegra20-tec.dts-cpp} (94%)
 rename arch/arm/boot/dts/{tegra20-trimslice.dts => tegra20-trimslice.dts-cpp} (99%)
 rename arch/arm/boot/dts/{tegra20-ventana.dts => tegra20-ventana.dts-cpp} (98%)
 rename arch/arm/boot/dts/{tegra20-whistler.dts => tegra20-whistler.dts-cpp} (99%)
 rename arch/arm/boot/dts/{tegra20.dtsi => tegra20.dtsi-cpp} (93%)
 rename arch/arm/boot/dts/{tegra30-cardhu-a02.dts => tegra30-cardhu-a02.dts-cpp} (96%)
 rename arch/arm/boot/dts/{tegra30-cardhu-a04.dts => tegra30-cardhu-a04.dts-cpp} (96%)
 rename arch/arm/boot/dts/{tegra30-cardhu.dtsi => tegra30-cardhu.dtsi-cpp} (98%)
 rename arch/arm/boot/dts/{tegra30.dtsi => tegra30.dtsi-cpp} (93%)
