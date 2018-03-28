From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 00/13] staging: typec: tcpci: move out of staging
Date: Thu, 29 Mar 2018 00:06:05 +0800
Message-ID: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, peter.chen@nxp.com, linux-usb@vger.kernel.org, a.hajda@samsung.com, linux-imx@nxp.com, jun.li@nxp.com, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

This patch set attempts to move the tcpci driver out of staging by fix
some tcpci driver issues and define typec and power delivery device
properties, the changes are verified on NXP PTN5110, which is a standard
tcpci typec port controller device with power delivery support, tested
power source and sink with drp config.

Changes for v4:
- Remove max-sink-* properties as we will purge max_snk_* in tcpm,
  see patch set[4].
- Get typec power and data type value via name string(patch 5).
- Move finding typec and pd properties code from tcpci to tcpm(patch 6)
- Add a compatible string for nxp ptn5110 typec controller in tcpci driver.
  (patch 3)
- Add set cc for drp toggling without try.src/snk in tcpm(patch 10), then
  patch 11 can only update CCx bits for keep disconnect cc line open.
- Update op-sink-microwatt-hours example value to be the right value in
  micorwatts, and accordingly divide 1000 to get its miliwatts value
  in patch 6.
- Add Guenter's Reviewed-by for patch(8/9/12)

[4] https://www.spinics.net/lists/linux-usb/msg167261.html

Changes for v3:
- Use 2 properties to separate power and data capability of typec port:
  "power-type" and "data-type", this is based on Heikki's typec class code
  change[2]. use "try-power-role" to present if the typec port can support
  Try.SNK or Try.SRC.
- 4 sink properties(max_sink_mv/ma/mw and op_sink_mw) are kept because the
  counterpart code is back, see revert patch[3], meanwhile I post a patch
  to fix the reported problem of current source pdo select machinism(which
  completely ignored those 4 sink settings), to see if we can keep current
  code, once it was discussed and have conclusion I can update this
  accordingly.
- Use fwnode to get the connector node for dt setting parse.

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
[2] https://patchwork.kernel.org/patch/10276483/
[3] https://www.spinics.net/lists/linux-usb/msg166366.html

Li Jun (13):
  dt-bindings: connector: add properties for typec
  dt-bindings: usb: add documentation for typec port controller(TCPCI)
  staging: typec: tcpci: add compatible string for nxp ptn5110
  usb: typec: add fwnode to tcpc
  usb: typec: add API to get typec basic port power and data config
  usb: typec: tcpm: support get typec and pd config from device
    properties
  staging: typec: tcpci: register port before request irq
  staging: typec: tcpci: enable vbus detection
  typec: tcpm: add starting value for drp toggling
  usb: typec: tcpm: set cc for drp toggling attach
  staging: typec: tcpci: keep the not connecting cc line open
  staging: typec: tcpci: Only touch target bit when enable vconn
  staging: typec: tcpci: move tcpci driver out of staging

 .../bindings/connector/usb-connector.txt           |  39 ++
 .../devicetree/bindings/usb/typec-tcpci.txt        |  33 ++
 drivers/staging/Kconfig                            |   2 -
 drivers/staging/Makefile                           |   1 -
 drivers/staging/typec/Kconfig                      |  14 -
 drivers/staging/typec/Makefile                     |   1 -
 drivers/staging/typec/TODO                         |   5 -
 drivers/staging/typec/tcpci.c                      | 596 --------------------
 drivers/staging/typec/tcpci.h                      | 138 -----
 drivers/usb/typec/Kconfig                          |   7 +
 drivers/usb/typec/Makefile                         |   1 +
 drivers/usb/typec/class.c                          |  52 ++
 drivers/usb/typec/tcpci.c                          | 611 +++++++++++++++++++++
 drivers/usb/typec/tcpci.h                          | 138 +++++
 drivers/usb/typec/tcpm.c                           | 156 +++++-
 include/linux/usb/tcpm.h                           |   2 +
 include/linux/usb/typec.h                          |   3 +
 17 files changed, 1012 insertions(+), 787 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/typec-tcpci.txt
 delete mode 100644 drivers/staging/typec/Kconfig
 delete mode 100644 drivers/staging/typec/Makefile
 delete mode 100644 drivers/staging/typec/TODO
 delete mode 100644 drivers/staging/typec/tcpci.c
 delete mode 100644 drivers/staging/typec/tcpci.h
 create mode 100644 drivers/usb/typec/tcpci.c
 create mode 100644 drivers/usb/typec/tcpci.h

-- 
2.7.4
