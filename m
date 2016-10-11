From: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Subject: [PATCH v2 0/4] iio: dac: mcp4725: use regulator framework, add vref and dt support
Date: Tue, 11 Oct 2016 15:57:39 +0200
Message-ID: <1476194263-12015-1-git-send-email-tomas@novotny.cz>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Li <sdliyong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

here is a second version of a series to use regulator framework, add an
option to set external reference and to add devicetree support for
mcp4725/6.

I wasn't using the regulator framework in the previous version. That is the
reason why is the second iteration very different. I took ad7303.c as a
reference.

Changes since v1:
- add the first patch
- use regulator framework
- fix printf argument (%u instead of %d)
- add parenthesis to make expression more clear
- fix typo in documentation (Microchpip)
- move vref configuration from probe function to new mcp4726_set_cfg

Tomas Novotny (4):
  iio: dac: mcp4725: use regulator framework
  iio: dac: mcp4725: support voltage reference selection
  Documentation: dt: iio: add mcp4725/6 dac device binding
  iio: dac: mcp4725: add devicetree support

 .../devicetree/bindings/iio/dac/mcp4725.txt        |  35 ++++
 drivers/iio/dac/mcp4725.c                          | 182 +++++++++++++++++++--
 include/linux/iio/dac/mcp4725.h                    |   3 +-
 3 files changed, 202 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/mcp4725.txt

-- 
2.1.4
