From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: Hi3660: Add binding for stub clock
Date: Fri, 2 Mar 2018 15:54:35 +0000
Message-ID: <5A9973BB.7030907@hisilicon.com>
References: <1510910852-2175-1-git-send-email-xuyiping@hisilicon.com>
 <1510910852-2175-4-git-send-email-xuyiping@hisilicon.com>
 <20180228050639.GA20745@leoy-ThinkPad-T440>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228050639.GA20745@leoy-ThinkPad-T440>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>, Xu YiPing <xuyiping@hisilicon.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, xuejiancheng@hisilicon.com, wenpan@hisilicon.com, zhangfei.gao@linaro.org, guodong.xu@linaro.org, zhongkaihua@huawei.com, chenjun14@huawei.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, suzhuangluan@hisilicon.com, xuezhiliang@hisilicon.com, kevin.wangtao@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Leo, YiPing,

On 2018/2/28 5:06, Leo Yan wrote:
> Hi Wei,
> 
> On Fri, Nov 17, 2017 at 05:27:32PM +0800, Xu YiPing wrote:
>> From: Kaihua Zhong <zhongkaihua@huawei.com>
>>
>> Add DT binding for Hi3660 stub clock driver.
>>
>> Reviewed-by: Leo Yan <leo.yan@linaro.org>
>> Signed-off-by: Kai Zhao <zhaokai1@hisilicon.com>
>> Signed-off-by: Tao Wang <kevin.wangtao@hisilicon.com>
>> Signed-off-by: Ruyi Wang <wangruyi@huawei.com>
>> Signed-off-by: Kaihua Zhong <zhongkaihua@huawei.com>
> 
> Could you help to pick up this patch? Thanks!

It failed to merge because of the mailbox part.
Once the mailbox driver is accepted, I will pick up this.
Thanks!

Best Regards,
Wei

> 
>> ---
>>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
>> index 451b6bf..cbbc7f1 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
>> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
>> @@ -293,6 +293,13 @@
>>  			#mbox-cells = <3>;
>>  		};
>>  
>> +		stub_clock: stub_clock@e896b500 {
>> +			compatible = "hisilicon,hi3660-stub-clk";
>> +			reg = <0x0 0xe896b500 0x0 0x0100>;
>> +			#clock-cells = <1>;
>> +			mboxes = <&mailbox 13 3 0>;
>> +		};
>> +
>>  		dual_timer0: timer@fff14000 {
>>  			compatible = "arm,sp804", "arm,primecell";
>>  			reg = <0x0 0xfff14000 0x0 0x1000>;
>> -- 
>> 1.9.1
>>
> 
> .
> 
