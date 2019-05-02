From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 0/3] arm64: dts: ti: k3-am654: Add interrupt controller nodes
Date: Thu, 2 May 2019 15:11:16 +0530
Message-ID: <20190502094119.16350-1-lokeshvutla@ti.com>
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
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This series adds dt nodes for interrupt controllers available in
AM654 SoC.

Lokesh Vutla (3):
  arm64: dts: ti: k3-am654: Update compatible for dmsc
  arm64: dts: ti: k3-am654: Add interrupt controllers in main domain
  arm64: dts: ti: k3-am654: Add interrupt controllers in wakeup domain

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi   | 41 ++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi | 13 ++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

-- 
2.21.0
