From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 0/5] soc: ti: k3-am654: Allow for exclsive request of
 devices
Date: Sat, 23 Feb 2019 15:02:27 +0530
Message-ID: <20190223093232.29003-1-lokeshvutla@ti.com>
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
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Sysfw provides an option for requesting exclusive access for a
device using the flags MSG_FLAG_DEVICE_EXCLUSIVE. Once a device
is requested from a host with this flag set, any request to this
device from a different host will be nacked by sysfw. Current tisci
driver enables this flag for every device requests. But this may not
be true for all the devices. This series adds support for providing
an option to enable or disable exclusive permissions.

v1: https://patchwork.kernel.org/cover/10817307/

Changes since v1:
- Split the dt-bindings doc to a separate patch

Lokesh Vutla (5):
  firmware: ti_sci: (Dis)Allow for device exclusive permissions
  dt-bindings: ti_sci_pm_domains: Add support for exclusive access
  soc: ti: ti_sci_pm_domains: Add support for exclusive access
  soc: ti: ti_sci_pm_domains: Switch to SPDX Licensing
  arm64: dts: ti: k3-am654: Update the power domain cells

 .../bindings/soc/ti/sci-pm-domain.txt         |  7 ++-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 26 +++++------
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi       | 10 ++---
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    |  6 +--
 drivers/firmware/ti_sci.c                     | 45 ++++++++++++++++++-
 drivers/soc/ti/ti_sci_pm_domains.c            | 32 ++++++++-----
 include/linux/soc/ti/ti_sci_protocol.h        |  3 ++
 7 files changed, 93 insertions(+), 36 deletions(-)

-- 
2.19.2
