From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 0/3] ARM: dts: k2g: Add support for USB instances on 66AK2G
Date: Wed, 2 Aug 2017 15:17:21 -0500
Message-ID: <20170802201724.11439-1-fcooper@ti.com>
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
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, ssantosh@kernel.org, linux@armlinux.org.uk, balbi@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
List-Id: devicetree@vger.kernel.org

Add support for 66AK2G usb instances. However, the driver needs to be updated
to support PM_RUNTIME. This update has been validated to work on K2L and boot
tested on K2HK and K2E.

Franklin S Cooper Jr (2):
  usb: dwc3: keystone: Add PM_RUNTIME Support to DWC3 Keystone USB
    driver
  dt-bindings: usb: keystone-usb: Update bindings pm and clocks
    properties

Vitaly Andrianov (1):
  ARM: dts: k2g: Add USB instances

 .../devicetree/bindings/usb/keystone-usb.txt       | 18 ++++++-
 arch/arm/boot/dts/keystone-k2g.dtsi                | 56 ++++++++++++++++++++++
 drivers/usb/dwc3/dwc3-keystone.c                   | 22 ++++-----
 3 files changed, 82 insertions(+), 14 deletions(-)

-- 
2.9.4.dirty
