Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0058.outbound.protection.outlook.com ([104.47.2.58]:23232
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752846AbeBZMEa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:04:30 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 00/12] staging: typec: tcpci: move out of staging
Date: Mon, 26 Feb 2018 19:49:07 +0800
Message-Id: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

This patch set attempts to move the tcpci driver out of staging by fix
some tcpci driver issues and verified on NXP PTN5110, which is a standard
tcpci typec port controller device with power delivery support, tested
power source and sink with drp config.

Main changes for v2:
- Typec properties are based on general usb connector bindings[1] proposed
  by Andrzej Hajda, use the standard unit suffixes as defined in
  property-units.txt.
- Add 2 infra APIs to get power sink and source config from dt.
- Don't change the set_cc api, to keep the uncontacted cc line open,
  set cc1/cc2 to be open in tcpci driver when set polarity.
- Directly enable vbus detect in tcpci driver rather than add a API.
- Details added in each patch.
 
[1] https://patchwork.kernel.org/patch/10231447/

Li Jun (12):
  usb: typec: add API to get port type and preferred role
  usb: typec: add API to get sink and source config
  staging: typec: tcpci: support port config passed via dt
  staging: typec: tcpci: register port before request irq
  staging: typec: tcpci: enable vbus detection
  typec: tcpm: add starting value for drp toggling
  staging: typec: tcpci: correct drp toggling
  staging: typec: tcpci: keep the uncontact cc line open
  staging: typec: tcpci: Only touch target bit when enable vconn
  dt-bindings: connector: add properties for typec power delivery
  dt-bindings: usb: add documentation for typec port controller(TCPCI)
  staging: typec: tcpci: move tcpci driver out of staging

 .../bindings/connector/usb-connector.txt           |  43 +++++++
 .../devicetree/bindings/usb/typec-tcpci.txt        |  35 ++++++
 drivers/staging/Kconfig                            |   2 -
 drivers/staging/Makefile                           |   1 -
 drivers/staging/typec/Kconfig                      |  14 ---
 drivers/staging/typec/Makefile                     |   1 -
 drivers/staging/typec/TODO                         |   5 -
 drivers/usb/typec/Kconfig                          |   7 ++
 drivers/usb/typec/Makefile                         |   1 +
 drivers/{staging => usb}/typec/tcpci.c             | 127 ++++++++++++++++++---
 drivers/{staging => usb}/typec/tcpci.h             |   0
 drivers/usb/typec/tcpm.c                           |  53 ++++++++-
 drivers/usb/typec/typec.c                          |  46 ++++++++
 include/linux/usb/tcpm.h                           |   8 +-
 include/linux/usb/typec.h                          |   2 +
 15 files changed, 295 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/typec-tcpci.txt
 delete mode 100644 drivers/staging/typec/Kconfig
 delete mode 100644 drivers/staging/typec/Makefile
 delete mode 100644 drivers/staging/typec/TODO
 rename drivers/{staging => usb}/typec/tcpci.c (81%)
 rename drivers/{staging => usb}/typec/tcpci.h (100%)

-- 
2.7.4

