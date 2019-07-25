From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 0/4] Add Mailbox nodes for TI K3 AM65x & J721E SoCs
Date: Wed, 24 Jul 2019 19:10:16 -0500
Message-ID: <20190725001020.23781-1-s-anna@ti.com>
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
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Tero, Nishanth,

The following series is a revised version of the series [1] that adds
the Mailbox DT nodes and the sub-mailboxes used to communicate between
the main MPU processor running Linux and the various R5F and DSP remote
processors present on the TI K3 AM65x and J721E SoC families. Patches
are based on v5.3-rc1 + the HwSpinlock DT node series [2], and are
intended for the 5.4 merge window. Functionality is verified using a
out-of-tree unit-test module and some additional loopback test nodes
available here [3] for reference.

Changes in v2:
 - All clusters are enabled by default in base dtsi files
 - The sub-mailboxes are moved to the actual board dts files
 - Unused clusters disabled in the board dts files

regards
Suman

[1] https://patchwork.kernel.org/cover/11053401/
[2] https://patchwork.kernel.org/cover/11053311/
[3] https://github.com/sumananna/mailbox/commits/mbox/test/5.3-rc1-k3-v2

Suman Anna (4):
  arm64: dts: ti: k3-am65-main: Add mailbox cluster nodes
  arm64: dts: ti: k3-am65-base-board: Add IPC sub-mailbox nodes for R5Fs
  arm64: dts: ti: k3-j721e-main: Add mailbox cluster nodes
  arm64: dts: ti: k3-j721e-common-proc-board: Add IPC sub-mailbox nodes

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 108 ++++++++++++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |  58 ++++++++++
 .../dts/ti/k3-j721e-common-proc-board.dts     |  93 +++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 108 ++++++++++++++++++
 4 files changed, 367 insertions(+)

-- 
2.22.0
