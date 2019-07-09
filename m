From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
Subject: [PATCH v2 00/10] net: hisilicon: Add support for HI13X1 to hip04_eth
Date: Tue, 9 Jul 2019 11:31:01 +0800
Message-ID: <1562643071-46811-1-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, yisen.zhuang@huawei.com, salil.mehta@huawei.com, mark.rutland@arm.com, dingtianhong@huawei.com, xiaojiangfeng@huawei.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leeyou.li@huawei.com, nixiaoming@huawei.com, jianping.liu@huawei.com, xiekunxun@huawei.com
List-Id: devicetree@vger.kernel.org

The main purpose of this patch series is to extend the
hip04_eth driver to support HI13X1_GMAC.

The offset and bitmap of some registers of HI13X1_GMAC
are different from hip04_eth common soc. In addition,
the definition of send descriptor and parsing descriptor
are different from hip04_eth common soc. So the macro
of the register offset is redefined to adapt the HI13X1_GMAC.

Clean up the sparse warning by the way.

Change since v1:
* Add a cover letter.

Jiangfeng Xiao (10):
  net: hisilicon: Add support for HI13X1 to hip04_eth
  net: hisilicon: Cleanup for got restricted __be32
  net: hisilicon: Cleanup for cast to restricted __be32
  net: hisilicon: HI13X1_GMAX skip write LOCAL_PAGE_REG
  net: hisilicon: HI13X1_GMAX need dreq reset at first
  net: hisilicon: dt-bindings: Add an field of port-handle
  net: hisilicon: Add group field to adapt HI13X1_GMAC
  net: hisilicon: Offset buf address to adapt HI13X1_GMAC
  net: hisilicon: Add an rx_desc to adapt HI13X1_GMAC
  net: hisilicon: Add an tx_desc to adapt HI13X1_GMAC

 .../bindings/net/hisilicon-hip04-net.txt           |   7 +-
 drivers/net/ethernet/hisilicon/Kconfig             |  10 ++
 drivers/net/ethernet/hisilicon/hip04_eth.c         | 142 ++++++++++++++++++---
 3 files changed, 136 insertions(+), 23 deletions(-)

-- 
1.8.5.6
