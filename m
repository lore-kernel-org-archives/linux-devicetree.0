From: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 00/22] usb gadget update for OTG 2.0
Date: Tue, 16 Jun 2015 14:51:50 +0800
Message-ID: <1434437532-23678-1-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Changes for v3:
- For simple, add one more otg descriptor structure: usb_otg20_descriptor for OTG 2.0
  and later release as Alan suggested. 
- Use disable flags for OTG features property.
- Move out memory allocation from usb_otg_descriptor_init() to its caller. 

Changes for v2:
- Use zero-length array as Peter Chen suggested to support usb_otg_descriptors
  with different size.
- Add a new property otg-rev to specify the OTG release number with which the
  device is compliant.
- Add a new interfate usb_otg_descriptor_add() to allocate and init usb_otg_descriptor
  according to gadget otg options, for those do not use new otg options, keep
  the usb_otg_descriptor setting unchanged.
- Remove static usb_otg_descriptor definitions in all legacy gadget driver, but
  use usb_otg_descriptor_add to handle it while build usb configurations.
- Handle usb_otg_descriptor through usb_otg_descriptor_add and add it in each usb
  configurations for configfs driver.

This is a follow-up of Macpaul Lin's previous patchset to resolve usb gadget driver
working with OTG 2.0, and set otg features by not only usb driver config but also usb
hardware property in DT, main changes:
1. keep one usb_otg_descriptor definition, add bcdOTG by zero-length array, which
   can be passed via device tree.
2. OTG features(SRP/HNP/ADP) can be decided by combination of usb HW properties and
   USB driver config.
3. Change the chipidea usb driver to use the updated mechanism.
4. Init usb_otg_descriptor according to otg options in each gadget driver.

Li Jun (18):
  doc: dt-binding: usb: add otg related properties
  usb: common: add API to get usb otg features from device tree
  usb: chipidea: set usb gadeget's otg config
  usb: chipidea: update ci_otg_is_fsm_mode conditions
  usb: gadget: add usb_otg_descriptor_add interface to init
    usb_otg_descriptor
  usb: gadget: configfs: init and add usb_otg_descriptor for usb
    configurations
  usb: gadget: ether: init usb_otg_descriptor via usb_otg_descriptor_add
  usb: gadget: acm_ms: init usb_otg_descriptor via
    usb_otg_descriptor_add
  usb: gadget: audio: init usb_otg_descriptor via usb_otg_descriptor_add
  usb: gadget: cdc2: init usb_otg_descriptor via usb_otg_descriptor_add
  usb: gadget: g_ffs: init usb_otg_descriptor via usb_otg_descriptor_add
  usb: gadget: hid: init usb_otg_descriptor via usb_otg_descriptor_add
  usb: gadget: mass_storage: init usb_otg_descriptor via
    usb_otg_descriptor_add
  usb: gadget: multi: init usb_otg_descriptor via usb_otg_descriptor_add
  usb: gadget: ncm: init usb_otg_descriptor via usb_otg_descriptor_add
  usb: gadget: printer: init usb_otg_descriptor via
    usb_otg_descriptor_add
  usb: gadget: serial: init usb_otg_descriptor via
    usb_otg_descriptor_add
  usb: gadget: zero: init usb_otg_descriptor via usb_otg_descriptor_add

Macpaul Lin (4):
  usb: add usb_otg20_descriptor for OTG 2.0 and above
  usb: add USB_OTG_ADP definition
  usb: add OTG feature options to gadget structure.
  usb: gadget: composite: add USB_DT_OTG request handling

 Documentation/devicetree/bindings/usb/generic.txt | 18 +++++++
 drivers/usb/chipidea/ci.h                         |  3 +-
 drivers/usb/chipidea/core.c                       | 18 +++++++
 drivers/usb/chipidea/debug.c                      |  1 +
 drivers/usb/chipidea/udc.c                        | 20 ++++++-
 drivers/usb/common/common.c                       | 64 +++++++++++++++++++++++
 drivers/usb/gadget/composite.c                    | 25 +++++++++
 drivers/usb/gadget/config.c                       | 39 ++++++++++++++
 drivers/usb/gadget/configfs.c                     | 34 ++++++++----
 drivers/usb/gadget/legacy/acm_ms.c                | 34 ++++++------
 drivers/usb/gadget/legacy/audio.c                 | 33 +++++++-----
 drivers/usb/gadget/legacy/cdc2.c                  | 34 ++++++------
 drivers/usb/gadget/legacy/ether.c                 | 48 ++++++++++++-----
 drivers/usb/gadget/legacy/g_ffs.c                 | 34 ++++++------
 drivers/usb/gadget/legacy/hid.c                   | 35 +++++++------
 drivers/usb/gadget/legacy/mass_storage.c          | 34 ++++++------
 drivers/usb/gadget/legacy/multi.c                 | 49 +++++++++++------
 drivers/usb/gadget/legacy/ncm.c                   | 33 +++++++-----
 drivers/usb/gadget/legacy/printer.c               | 30 +++++++----
 drivers/usb/gadget/legacy/serial.c                | 34 +++++++-----
 drivers/usb/gadget/legacy/zero.c                  | 37 ++++++-------
 include/linux/usb/chipidea.h                      |  4 ++
 include/linux/usb/gadget.h                        | 13 +++++
 include/linux/usb/of.h                            | 20 +++++++
 include/uapi/linux/usb/ch9.h                      | 12 +++++
 25 files changed, 520 insertions(+), 186 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
