From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 0/5] arm64: dts: hisi: add NIC, RoCE and SAS support for
 hip07
Date: Sat, 8 Apr 2017 14:51:48 +0800
Message-ID: <58E88884.2090702@hisilicon.com>
References: <1491530876-109791-1-git-send-email-xuwei5@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1491530876-109791-1-git-send-email-xuwei5@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: wangkefeng.wang@huawei.com, gabriele.paoloni@huawei.com, charles.chenxin@huawei.com, linuxarm@huawei.com, guohanjun@huawei.com, yankejian@huawei.com, yimin@huawei.com, huangdaode@hisilicon.com, liudongdong3@huawei.com, yisen.zhuang@huawei.com, devicetree@vger.kernel.org, john.garry@huawei.com, tanxiaofei@huawei.com, lipeng321@huawei.com, linux-arm-kernel@lists.infradead.org, salil.mehta@huawei.com, chenxiang66@hisilicon.com, linux-kernel@vger.kernel.org, shameerali.kolothum.thodi@huawei.com, wangzhou1@hisilicon.com, liguozhu@hisilicon.com, majun258@huawei.com
List-Id: devicetree@vger.kernel.org

Hi All,

On 2017/4/7 10:07, Wei.Xu wrote:
> This patch series adds Mbigen, NIC, RoCE and SAS nodes for the hip07
> SoC and enables the NIC, RoCE and SAS on the hip07 d05 board.
>
> Wei Xu (5):
>    arm64: dts: hisi: add mbigen nodes for the hip07 SoC
>    arm64: dts: hisi: add network related nodes for the hip07 SoC
>    arm64: dts: hisi: add RoCE nodes for the hip07 SoC
>    arm64: dts: hisi: add SAS nodes for the hip07 SoC
>    arm64: dts: hisi: enalbe the NIC and SAS for the hip07-d05 board
>
>   arch/arm64/boot/dts/hisilicon/hip07-d05.dts |  24 ++
>   arch/arm64/boot/dts/hisilicon/hip07.dtsi    | 479 ++++++++++++++++++++++++++++
>   2 files changed, 503 insertions(+)
>
After removed the PCIe node in the patch 5, the series has been applied 
to the hisilicon arm64
dt tree since this series patches just to add the nodes and the binding 
has been reviewed before.

Best Regards,
Wei
