From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v9 5/6] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Tue, 9 Jun 2015 08:55:21 +0800
Message-ID: <20150609005521.GA21682@tiger>
References: <1432950661-23060-1-git-send-email-bintian.wang@huawei.com>
 <1432950661-23060-6-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432950661-23060-6-git-send-email-bintian.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bintian Wang <bintian.wang@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, mturquette@linaro.org, rob.herring@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, xuwei5@hisilicon.com, jh80.chung@samsung.com, olof@lixom.net, yanhaifeng@gmail.com, sboyd@codeaurora.org, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, tomeu.vizoso@collabora.com, linux@arm.linux.org.uk, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, tyler.baker@linaro.org, khilman@kernel.org, pebolle@tiscali.nl, arnd@arndb.de, marc.zyngier@arm.com, dan.zhao@hisilicon.com, huxinwei@huawei.com, xuyiping@hisilicon.com, wangbintian@gmail.com, victor.lixin@hisilicon.com, puck.chen@hisilicon.
List-Id: devicetree@vger.kernel.org

A minor random comment below.

On Sat, May 30, 2015 at 09:51:00AM +0800, Bintian Wang wrote:
> +		ao_ctrl: ao_ctrl {
> +			compatible = "hisilicon,hi6220-aoctrl", "syscon";
> +			reg = <0x0 0xf7800000 0x0 0x2000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		sys_ctrl: sys_ctrl {
> +			compatible = "hisilicon,hi6220-sysctrl", "syscon";
> +			reg = <0x0 0xf7030000 0x0 0x2000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		media_ctrl: media_ctrl {
> +			compatible = "hisilicon,hi6220-mediactrl", "syscon";
> +			reg = <0x0 0xf4410000 0x0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		pm_ctrl: pm_ctrl {

An unit-address should be coded in the node name, when it has a 'reg'
property.

Shawn

> +			compatible = "hisilicon,hi6220-pmctrl", "syscon";
> +			reg = <0x0 0xf7032000 0x0 0x1000>;
> +			#clock-cells = <1>;
> +		};
