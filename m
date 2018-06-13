From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH] ARM64: dts: rockchip: add some pins to rk3399
Date: Wed, 13 Jun 2018 22:44:08 +0800
Message-ID: <e9584bfe-a098-1b90-2660-c27f82ed513c@rock-chips.com>
References: <20180612152544.3812-1-ayaka@soulik.info>
 <B649911B-28E0-4466-B3F0-15875FFB9D43@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <B649911B-28E0-4466-B3F0-15875FFB9D43@theobroma-systems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: klaus.goger@theobroma-systems.com, Randy Li <ayaka@soulik.info>
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 2018/6/13 2:21, klaus.goger@theobroma-systems.com wrote:
> Hi Randy,

-----8<-------------

>> 		pcie {
>> +			pcie_clkreqn: pci-clkreqn {
>> +				rockchip,pins =
>> +					<2 26 RK_FUNC_2 &pcfg_pull_none>;
>> +			};
>> +
>> +			pcie_clkreqnb: pci-clkreqnb {
>> +				rockchip,pins =
>> +					<4 24 RK_FUNC_1 &pcfg_pull_none>;
>> +			};
>> +
> 
> I’m not sure if pci-clkreqn is functional at all. If not I’m not sure if we should add it to the dtsi.
> Shawn may know more about it.

Please refer to commit 461a00bb9d539e
("arm64: dts: rockchip: kill pcie_clkreqn and pcie_clkreqnb for rk3399")

CLKREQ# is used for PCI-PM L1.x, but it's not functional for rk3399, so
we have to support CPM(clock power management), thus I kill them last
year.

> 
>> 			pcie_clkreqn_cpm: pci-clkreqn-cpm {
>> 				rockchip,pins =
>> -					<2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
>> +					<2 26 RK_FUNC_GPIO &pcfg_pull_none>;
>> 			};
>>
>> 			pcie_clkreqnb_cpm: pci-clkreqnb-cpm {
>> 				rockchip,pins =
>> -					<4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
>> +					<4 24 RK_FUNC_GPIO &pcfg_pull_none>;
>> 			};
>> 		};
>>
>> -- 
>> 2.14.4
> 
> 
> Could we actually use RK_Pxx for all new pin definitions? Would increase readability a lot.
> 
> Thanks,
> Klaus
> 
> 


-- 
Best Regards
Shawn Lin
