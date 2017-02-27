From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 03/11] dt-bindings: perf: hisi: Add Devicetree
 bindings for Hisilicon SoC PMU
Date: Mon, 27 Feb 2017 12:58:45 -0600
Message-ID: <20170227185845.f3ge2qijwye5rg2v@rob-hp-laptop>
References: <1487530221-42431-1-git-send-email-anurup.m@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487530221-42431-1-git-send-email-anurup.m@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anurup M <anurupvasu@gmail.com>
Cc: mark.rutland@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, anurup.m@huawei.com, zhangshaokun@hisilicon.com, tanxiaojun@huawei.com, xuwei5@hisilicon.com, sanil.kumar@hisilicon.com, john.garry@huawei.com, gabriele.paoloni@huawei.com, shiju.jose@huawei.com, huangdaode@hisilicon.com, wangkefeng.wang@huawei.com, linuxarm@huawei.com, dikshit.n@huawei.com, shyju.pv@huawei.com
List-Id: devicetree@vger.kernel.org

On Sun, Feb 19, 2017 at 01:50:21PM -0500, Anurup M wrote:
> 1) Device tree bindings for Hisilicon SoC PMU.
> 2) Add example for Hisilicon L3 cache and MN PMU.
> 3) Add child nodes of L3C and MN in djtag bindings example.
> 
> Signed-off-by: Anurup M <anurup.m@huawei.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>  .../devicetree/bindings/arm/hisilicon/djtag.txt    |  25 +++++
>  .../devicetree/bindings/arm/hisilicon/pmu.txt      | 103 +++++++++++++++++++++
>  2 files changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/pmu.txt

Acked-by: Rob Herring <robh@kernel.org>
