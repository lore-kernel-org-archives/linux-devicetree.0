From: Tan Xiaojun <tanxiaojun@huawei.com>
Subject: [RFC PATCH v1 0/2] Add Hisilicon Djtag driver
Date: Fri, 22 Jul 2016 16:48:50 +0800
Message-ID: <1469177332-72156-1-git-send-email-tanxiaojun@huawei.com>
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
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, xuwei5@hisilicon.com, devicetree@vger.kernel.org, khilman@linaro.org, k.kozlowski@samsung.com, amitdanielk@gmail.com, heiko@sntech.de, wxt@rock-chips.com, alex.aring@gmail.com, qiang.zhao@freescale.com, treding@nvidia.com, rmk+kernel@arm.linux.org.uk, gregory.clement@free-electrons.com, f.fainelli@gmail.com, geert+renesas@glider.be
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Tan Xiaojun (2):
  Documentation: arm64: Add Hisilicon HiP05/06/07 Sysctrl and Djtag dts
    bindings
  drivers: soc: Add support for Hisilicon Djtag driver

 .../bindings/arm/hisilicon/hisilicon.txt           |   98 +++++
 drivers/soc/Kconfig                                |    1 +
 drivers/soc/Makefile                               |    1 +
 drivers/soc/hisilicon/Kconfig                      |   12 +
 drivers/soc/hisilicon/Makefile                     |    1 +
 drivers/soc/hisilicon/djtag.c                      |  373 ++++++++++++++++++++
 include/linux/soc/hisilicon/djtag.h                |   18 +
 7 files changed, 504 insertions(+)
 create mode 100644 drivers/soc/hisilicon/Kconfig
 create mode 100644 drivers/soc/hisilicon/Makefile
 create mode 100644 drivers/soc/hisilicon/djtag.c
 create mode 100644 include/linux/soc/hisilicon/djtag.h

-- 
1.7.9.5
