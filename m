From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/3] EDAC support for Calxeda Highbank
Date: Mon, 11 Jun 2012 21:32:11 -0500
Message-ID: <1339468334-9927-1-git-send-email-robherring2@gmail.com>
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
To: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

This series adds EDAC support for Calxeda Highbank platform L2 and
memory ECC hardware.

This version is rebased current edac next tree for 3.6. Changes in
this version are the addition of a common edac debugfs directory and
coverting the highbank error injection to use debugfs.

Rob

Rob Herring (3):
  edac: create top-level debugfs directory
  edac: add support for Calxeda highbank memory controller
  edac: add support for Calxeda highbank L2 cache ecc

 .../devicetree/bindings/arm/calxeda/l2ecc.txt      |   17 ++
 .../devicetree/bindings/arm/calxeda/mem-ctrlr.txt  |   17 ++
 arch/arm/boot/dts/highbank.dts                     |   12 +
 drivers/edac/Kconfig                               |   16 +-
 drivers/edac/Makefile                              |    4 +
 drivers/edac/edac_mc_sysfs.c                       |   23 +-
 drivers/edac/edac_module.c                         |    3 +
 drivers/edac/edac_module.h                         |   14 ++
 drivers/edac/highbank_l2_edac.c                    |  149 ++++++++++++
 drivers/edac/highbank_mc_edac.c                    |  256 ++++++++++++++++++++
 10 files changed, 509 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/calxeda/l2ecc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/calxeda/mem-ctrlr.txt
 create mode 100644 drivers/edac/highbank_l2_edac.c
 create mode 100644 drivers/edac/highbank_mc_edac.c

-- 
1.7.9.5
