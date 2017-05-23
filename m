From: zhangfei <zhangfei.gao@linaro.org>
Subject: Re: [PATCH 05/12] arm64: dts: Add I2C nodes for Hi3660
Date: Tue, 23 May 2017 13:55:53 +0800
Message-ID: <94d06900-d871-7bc6-e1f3-d2b22ba20aaf@linaro.org>
References: <20170517083745.24479-1-guodong.xu@linaro.org>
 <20170517083745.24479-6-guodong.xu@linaro.org>
 <20170523003908.ztuh4oohdk3g34pm@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170523003908.ztuh4oohdk3g34pm@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Guodong Xu <guodong.xu@linaro.org>
Cc: xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, wangkefeng.wang@huawei.com, puck.chen@hisilicon.com, xuejiancheng@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Rob


Thanks for the review.

On 2017年05月23日 08:39, Rob Herring wrote:
> On Wed, May 17, 2017 at 04:37:38PM +0800, Guodong Xu wrote:
>> From: Zhangfei Gao <zhangfei.gao@linaro.org>
>>
>> Add I2C nodes for Hi3660-hikey960.
>>
>> On HiKey960,
>> I2C0, I2C7 is connected to Low Speed Expansion Connector.
>> I2C1 is connected to ADV7535.
>> I2C3 is connected to USB5734.
>>
>> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
>> Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
>> ---
>>   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 18 ++++++++
>>   arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 56 +++++++++++++++++++++++
>>   2 files changed, 74 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> index 64875a5..f685b1e 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> @@ -29,6 +29,24 @@
>>   	};
>>   };
>>   
>> +&i2c0 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c1 {
>> +	status = "okay";
>> +
>> +	adv7533: adv7533@39 {
>> +		status = "ok";
>> +		compatible = "adi,adv7533";
>> +		reg = <0x39>;
>> +	};
>> +};
>> +
>> +&i2c7 {
>> +	status = "okay";
>> +};
> labels for the LS connector?
Any examples?
There is compile error if only change dts like
ls-connector {
         &i2c7 {
                 status = "okay";
         };
};

>
>> +
>>   &uart5 {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
>> index f55710a..f217c9d 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
>> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
>> @@ -186,6 +186,62 @@
>>   			#reset-cells = <2>;
>>   		};
>>   
>> +		i2c0: i2c@FFD71000 {
> lowercase hex please.
Yes, will change
>
>> +			compatible = "snps,designware-i2c";
> These should have an SoC specific compatible.
We directly use drivers/i2c/busses/i2c-designware-platdrv.c,
do we still an soc specific compatible?
Checked arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi, and other examples,

compatible = "snps,designware-i2c" is used.


Thanks
