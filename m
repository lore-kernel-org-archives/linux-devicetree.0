From: Jagan Teki <jagan@openedev.com>
Subject: [PATCH v4 0/7] arm: dts: imx6q-icore: Add LVDS display nodes
Date: Wed,  8 Mar 2017 12:45:13 +0530
Message-ID: <1488957320-5552-1-git-send-email-jagan@openedev.com>
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
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Matteo Lisi <matteo.lisi@engicam.com>
List-Id: devicetree@vger.kernel.org

From: root <root@b1eb17b01b40.(none)>

This series adds support for lvds display, touchscreen nodes on dts for
Engicam i.CoreM6 Quad boards along with selecting few touchscreen driver
configs to imx_v6_v7_defconfig so-that select by default.

Jagan Teki (7):
  arm: dts: imx6qdl-icore: Add backlight support for lvds
  arm: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual OpenFrame Cap 10.1
    initial support
  arm: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual OpenFrame Cap 12.3
    initial support
  arm: dts: imx6q-icore: Add LVDS support
  arm: dts: imx6q-icore: Add touchscreen node
  arm: imx_v6_v7_defconfig: Select max11801_ts touchscreen driver
  arm: imx_v6_v7_defconfig: Select hid-multitouchdriver

 arch/arm/boot/dts/Makefile                |  2 +
 arch/arm/boot/dts/imx6q-icore-ofcap10.dts | 76 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-icore-ofcap12.dts | 76 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-icore.dts         | 34 ++++++++++++++
 arch/arm/boot/dts/imx6qdl-icore.dtsi      | 20 ++++++++
 arch/arm/configs/imx_v6_v7_defconfig      |  2 +
 6 files changed, 210 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-icore-ofcap10.dts
 create mode 100644 arch/arm/boot/dts/imx6q-icore-ofcap12.dts

-- 
1.9.1
