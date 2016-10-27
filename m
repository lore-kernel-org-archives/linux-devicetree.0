From: Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v3 0/4] Add DT support for DA8xx
Date: Thu, 27 Oct 2016 11:34:03 +0200
Message-ID: <1477560847-8929-1-git-send-email-abailon@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com, robh+dt@kernel.org, b-liu@ti.com
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alexandre Bailon <abailon@baylibre.com>
List-Id: devicetree@vger.kernel.org

Changes in v2:
* Remove unrelated changes in patch 3
* Rename the device node in patch 4

Changes in v3:
* Fix few mistakes in DT binding sample
* Only build the device table if DT is enabled

Alexandre Bailon (1):
  ARM: dts: da850: Add the usb otg device node

Petr Kulhavy (3):
  dt/bindings: Add binding for the DA8xx MUSB driver
  usb: musb: core: added helper function for parsing DT
  usb: musb: da8xx: Add DT support for the DA8xx driver

 .../devicetree/bindings/usb/da8xx-usb.txt          | 43 ++++++++++++++++++++
 arch/arm/boot/dts/da850-lcdk.dts                   |  8 ++++
 arch/arm/boot/dts/da850.dtsi                       | 15 +++++++
 drivers/usb/musb/da8xx.c                           | 46 ++++++++++++++++++++++
 drivers/usb/musb/musb_core.c                       | 19 +++++++++
 drivers/usb/musb/musb_core.h                       |  5 +++
 6 files changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt

-- 
2.7.3
