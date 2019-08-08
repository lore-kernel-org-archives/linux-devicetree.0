From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] K3 dts minor typo fixes
Date: Thu, 8 Aug 2019 09:39:27 -0500
Message-ID: <20190808143929.11148-1-s-anna@ti.com>
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

The following 2 patches are minor typo fixes in git-its nodes
on both AM65x and J721E SoCs. Patches done on top of the latest
master.

regards
Suman

Suman Anna (2):
  arm64: dts: ti: k3-am65-main: Fix gic-its node unit-address
  arm64: dts: ti: k3-j721e-main: Fix gic-its node unit-address

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi  | 2 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.22.0
