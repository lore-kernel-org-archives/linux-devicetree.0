From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 0/2] Add support for cros-ec-extcon driver
Date: Wed,  1 Mar 2017 12:19:41 +0100
Message-ID: <20170301111943.12170-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear all,

Now that the drm/rockchip landed it's time to review the extcon cros-ec driver. The
cdn-dp driver uses this extcon driver to get cable status and the presence of display
out.

This driver is based on the one available in chromeos-4.4 kernel but removing
all the USB switch role stuff, as this depends on other infrastructures like 
the dwc3 role switch and the Type-C connector.

Note that these patches depends on the following patches to build.

[1] https://lkml.org/lkml/2017/2/14/655

The above patches have been acked and hopefully merged soon in linux-next.

Changes since v1:

 Requested by Chanwoo Choi
 - Rename files changing _ for -
 - Remove the unneeded blank line on bottom of header.
 - Remove kobject.h and cros_ec_commands.h includes.
 - Remove the debug message as is not necessary.
 - Use the tab for indentation instead of space for if sentence.
 - Define each variable on different lines when the variables should be
   initialized.
 - Remove EXTCON_USB and EXTCON_USB_HOST as are not really used for now.
 - Add one blank line to split out between state and property setting.
 - Add the author information (header and module)

 Requested by Rob Herring
 - Remove the Extcon word in the binding and replace it to describe better the
   h/w.
 - 'google,extcon-cros-ec' renamed to 'google,extcon-usbc-cros-ec' to indicate
   this is USB Type C related.

 Enric Balletbo
 - As Rob suggested to rename the compatible name to something indicating that
   is USB Type C related I also renamed the file names, extcon-cros-ec ->
   extcon-usbc-cros-ec, I think it's more clear.

Benson Leung (2):
  extcon: cros-ec: Add extcon-cros-ec driver to support display out.
  dt-bindings: extcon: Add support for cros-ec device

 .../bindings/extcon/extcon-usbc-cros-ec.txt        |  24 ++
 drivers/extcon/Kconfig                             |   7 +
 drivers/extcon/Makefile                            |   1 +
 drivers/extcon/extcon-usbc-cros-ec.c               | 415 +++++++++++++++++++++
 include/linux/mfd/cros_ec_commands.h               |  75 ++++
 5 files changed, 522 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.txt
 create mode 100644 drivers/extcon/extcon-usbc-cros-ec.c

-- 
2.9.3
