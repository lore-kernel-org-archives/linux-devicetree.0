From: Faiz Abbas <faiz_abbas@ti.com>
Subject: [PATCH v2 0/2] Support for eMMC in AM65x-evm
Date: Thu, 10 Jan 2019 13:03:53 +0530
Message-ID: <20190110073355.3382-1-faiz_abbas@ti.com>
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
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, nm@ti.com, robh+dt@kernel.org, t-kristo@ti.com, faiz_abbas@ti.com
List-Id: devicetree@vger.kernel.org

The following patches add eMMC support on TI's AM65x-evm.

v2:
 1. The SD card node is under debug for some usecases.
    Only upstreaming eMMC support for now.
 2. Rebased to latest mainline.
 3. Removed status = "disabled" from dtsi patch
 4. Fixed node name to not include '_'s

Faiz Abbas (2):
  arm64: dts: ti: k3-am654: Add Support for MMC/SD
  arm64: dts: ti: k3-am654-base-board: Add MMC/SD support

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 13 ++++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 25 +++++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
2.19.2
