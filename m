From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v5 0/2] arm64: dts: ti: k3: Update the power-domain cells
Date: Mon, 29 Jul 2019 18:00:21 +0530
Message-ID: <20190729123023.32702-1-lokeshvutla@ti.com>
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

Update the power-domains cells on all K3 based devices to reflect
exclusive and shared permissions in each device.

Changes since v4: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=148371
- Split the dts changes into a separate series.
- Added Reviewed-by from Nishanth M
- Rebased on top of v5.3-rc2

Lokesh Vutla (2):
  arm64: dts: ti: k3-am654: Update the power domain cells
  arm64: dts: ti: k3-j721e: Update the power domain cells

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 44 +++++++++----------
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi       | 10 ++---
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    |  6 +--
 arch/arm64/boot/dts/ti/k3-am65.dtsi           |  1 +
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |  1 +
 .../dts/ti/k3-j721e-common-proc-board.dts     |  4 ++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 20 ++++-----
 .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      |  6 +--
 arch/arm64/boot/dts/ti/k3-j721e.dtsi          |  1 +
 9 files changed, 50 insertions(+), 43 deletions(-)

-- 
2.22.0
