From: Alexis Ballier <aballier@gentoo.org>
Subject: [PATCH 0/3] Small improvements/bugfixes to the rk3399-opi dt
Date: Fri, 15 Mar 2019 15:58:15 +0100
Message-ID: <20190315145818.23610-1-aballier@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Alexis Ballier <aballier@gentoo.org>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series is based on the rockchip/v5.2-armsoc/dts64 branch and
fixes a few mistakes in the rk3399-orangepi.dts I sent a couple weeks ago.

Alexis Ballier (3):
  arm64: dts: rockchip: rk3399-orangepi: Fix clock names and add missing
    supplies for bluetooth
  arm64: dts: rockchip: rk3399-orangepi: Specify vid supply for the
    compass (AK09911)
  arm64: dts: rockchip: rk3399-orangepi: Add the fusb typec manager

 .../boot/dts/rockchip/rk3399-orangepi.dts     | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

Cc: devicetree@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

-- 
2.21.0
