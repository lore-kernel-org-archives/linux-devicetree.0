From: Tomas Novotny <tomas.novotny-MzfF5RY65ECbtNqbA8UwFdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 0/5] iio: dac: mcp4725: use regulator framework, add vref and dt support
Date: Tue, 18 Oct 2016 19:43:04 +0200
Message-ID: <1476812589-18333-1-git-send-email-tomas.novotny@tbs-biometrics.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Li <sdliyong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>

Hi all,

here is a third version of a series to use regulator framework, add an
option to set external reference and to add devicetree support for
mcp4725/6.

Third version fixes mainly small bits found in the previous version.

Series is tested on MCP4726 on device tree platform.

Changes since v2:
- whitespace fix of two consecutive lines between patches (it affects
  already applied patch)
- abort probe instead of recovery in case of invalid configuration
- use local variable instead of allocation for platform data
- move unrelated comment fix to the new patch
- add ack from Rob
- fix doubled space in an assignment
- add documentation for the struct mcp4725_platform_data
- move the documentation patch forward because it is referenced in struct
  mcp4725_platform_data now
 
Changes since v1:
- add the first patch
- use regulator framework
- fix printf argument (%u instead of %d)
- add parenthesis to make expression more clear
- fix typo in documentation (Microchpip)
- move vref configuration from probe function to new mcp4726_set_cfg

Tomas Novotny (5):
  iio: dac: mcp4725: use regulator framework
  iio: dac: mcp4725: fix incorrect comment
  Documentation: dt: iio: add mcp4725/6 dac device binding
  iio: dac: mcp4725: support voltage reference selection
  iio: dac: mcp4725: add devicetree support

 .../devicetree/bindings/iio/dac/mcp4725.txt        |  35 ++++
 drivers/iio/dac/mcp4725.c                          | 177 +++++++++++++++++++--
 include/linux/iio/dac/mcp4725.h                    |  12 +-
 3 files changed, 206 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/mcp4725.txt

-- 
2.1.4
