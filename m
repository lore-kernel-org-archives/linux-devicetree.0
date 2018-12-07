From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 0/2] AM654: Add ECAP PWM support
Date: Fri, 7 Dec 2018 15:05:33 +0530
Message-ID: <20181207093535.5497-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

Couple of patches to add ECAP PWM support for AM654 SoC. Based on top of
git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux.git 4.20-rc1-am65x-queue

Vignesh R (2):
  arm64: dts: ti: k3-am65-main: Add ECAP PWM node
  arm64: dts: ti: k3-am654-base-board: Enable ECAP PWM

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi       |  9 +++++++++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 11 +++++++++++
 2 files changed, 20 insertions(+)

-- 
2.19.2
