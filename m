From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v5 0/3] soc: ti: k3: Allow for exclusive and shared device
 requests
Date: Mon, 29 Jul 2019 17:54:50 +0530
Message-ID: <20190729122453.32252-1-lokeshvutla@ti.com>
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
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Sysfw provides an option for requesting exclusive access for a
device using the flags MSG_FLAG_DEVICE_EXCLUSIVE. If this flag is
not used, the device is meant to be shared across hosts. Once a device
is requested from a host with this flag set, any request to this
device from a different host will be nacked by sysfw.

Current tisci firmware and pm drivers always requests for device with
exclusive permissions set. But this is not be true for certain devices
that are expcted to be shared across different host contexts.
So add support for getting the shared or exclusive permissions from DT
and request firmware accordingly.

Changes since v4: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=148371
- Split the driver and arch changes into a separate series.
- Added Reviewed-by from Nishanth M
- Rebased on top of v5.3-rc2

Lokesh Vutla (3):
  firmware: ti_sci: Allow for device shared and exclusive requests
  dt-bindings: ti_sci_pm_domains: Add support for exclusive and shared
    access
  soc: ti: ti_sci_pm_domains: Add support for exclusive and shared
    access

 .../bindings/soc/ti/sci-pm-domain.txt         | 11 ++++-
 MAINTAINERS                                   |  1 +
 drivers/firmware/ti_sci.c                     | 45 ++++++++++++++++++-
 drivers/soc/ti/ti_sci_pm_domains.c            | 23 +++++++++-
 include/dt-bindings/soc/ti,sci_pm_domain.h    |  9 ++++
 include/linux/soc/ti/ti_sci_protocol.h        |  3 ++
 6 files changed, 86 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/soc/ti,sci_pm_domain.h

-- 
2.21.0
