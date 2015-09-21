From: Wei Xu <xuwei5@hisilicon.com>
Subject: [GIT PULL]Hisilicon arm64 dt changes for 4.3
Date: Mon, 21 Sep 2015 17:36:35 +0100
Message-ID: <56003213.2050306@hisilicon.com>
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
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Gabriele Paoloni <gabriele.paoloni@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linuxarm <linuxarm@huawei.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>, "arm@kernel.org" <arm@kernel.org>, "Shenhui (Jacky)" <shenhui@huawei.com>, Zhangfei Gao <zhangfei.gao@linaro.org>, devicetree@vger.kernel.org, John Garry <john.garry@huawei.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Kumar Gala <galak@codeaurora.org>, Yanhaifeng <yanhaifeng@hisilicon.com>, Liwenchang <liwenchang@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Anurup m <anurup.m@huawei.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Salil Mehta <salil.mehta@huawei.com>, Guodong Xu <guodong.x>
List-Id: devicetree@vger.kernel.org

Hi Arnd, Hi Olof, Hi Kevin,

Please help to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hip05-dt-for-4.3

for you to fetch changes up to fcab303c015397c307ae4873e02598f89a4a3ef6:

  arm64: dts: add dts files for Hisilicon Hip05-D02 Development Board (2015-09-21 15:50:50 +0100)

----------------------------------------------------------------
ARM64: DT: Hisilicon hip05 soc and D02 board updates for 4.3

- Updated the hisilicon devicetree bindings document to support hip05-D02 board
- Added dts files for hip05 SoC and D02 board

----------------------------------------------------------------
Ding Tianhong (2):
      arm64: hip05-d02: Document devicetree bindings for Hisilicon Hip05-D02 Board
      arm64: dts: add dts files for Hisilicon Hip05-D02 Development Board

 Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt |   4 ++
 arch/arm64/boot/dts/hisilicon/Makefile                        |   2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts                   |  36 ++++++++++++++++++
 arch/arm64/boot/dts/hisilicon/hip05.dtsi                      | 271 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 312 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/hisilicon/hip05-d02.dts
 create mode 100644 arch/arm64/boot/dts/hisilicon/hip05.dtsi
