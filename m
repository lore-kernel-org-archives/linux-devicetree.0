From: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH v3 0/2] add reset-hi3660
Date: Tue,  6 Dec 2016 09:51:30 +0800
Message-ID: <1480989092-31847-1-git-send-email-zhangfei.gao@linaro.org>
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
To: Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, haojian.zhuang@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: devicetree@vger.kernel.org

v3:
change dts usage suggested by Arnd
from
resets = <&iomcu_rst 0>;
to
resets = <&iomcu_rst 0x20 3>; /* offset: 0x20; bit: 3 */

v2:
Considering Arnd and Philipp suggestions, 
move reset register to dts as table instead of dts header in case of ABI issue

Zhangfei Gao (2):
  dt-bindings: Document the hi3660 reset bindings
  reset: hisilicon: add reset-hi3660

 .../bindings/reset/hisilicon,hi3660-reset.txt      |  36 ++++++
 drivers/reset/hisilicon/Kconfig                    |   7 ++
 drivers/reset/hisilicon/Makefile                   |   1 +
 drivers/reset/hisilicon/reset-hi3660.c             | 126 +++++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
 create mode 100644 drivers/reset/hisilicon/reset-hi3660.c

-- 
2.7.4
