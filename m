From: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [RFC V2:PATCH 0/2] add reset-hi3660
Date: Wed, 23 Nov 2016 16:07:54 +0800
Message-ID: <1479888476-13138-1-git-send-email-zhangfei.gao@linaro.org>
References: <Arnd Bergmann <arnd@arndb.de>,>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <Arnd Bergmann <arnd@arndb.de>,>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: devicetree@vger.kernel.org

Considering Arnd and Philipp suggestions, 
move reset register to dts as table instead of dts header in case of ABI issue

Zhangfei Gao (2):
  dt-bindings: Document the hi3660 reset bindings
  reset: hisilicon: add reset-hi3660

 .../bindings/reset/hisilicon,hi3660-reset.txt      |  51 ++++++++
 drivers/reset/hisilicon/Kconfig                    |   7 +
 drivers/reset/hisilicon/Makefile                   |   1 +
 drivers/reset/hisilicon/reset-hi3660.c             | 144 +++++++++++++++++++++
 4 files changed, 203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
 create mode 100644 drivers/reset/hisilicon/reset-hi3660.c

-- 
2.7.4
