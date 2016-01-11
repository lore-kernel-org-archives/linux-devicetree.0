From: xuejiancheng <xuejiancheng@huawei.com>
Subject: Re: [PATCH v2] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Mon, 11 Jan 2016 09:20:41 +0800
Message-ID: <56930369.1050000@huawei.com>
References: <1452216405-10826-1-git-send-email-xuejiancheng@huawei.com>
 <20160109154249.GA28102@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160109154249.GA28102@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, dwmw2@infradead.org, computersforpeace@gmail.com, shijie.huang@intel.com, pengbinquan@huawei.com, han.xu@freescale.com, ezequiel@vanguardiasur.com.ar, fabio.estevam@freescale.com, manabian@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 2016/1/9 23:42, Rob Herring wrote:
> On Fri, Jan 08, 2016 at 09:26:45AM +0800, Jiancheng Xue wrote:
>> add hisilicon spi-nor flash controller driver
>>
>> Signed-off-by: Binquan Peng <pengbinquan@huawei.com>
>> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
>> ---
> 
> Next time, please include changes in v2 here.
> 

OK. I will remember it. Thank you.

In v2, I mainly fixed some compile warnings.

>>  .../devicetree/bindings/spi/spi-hisi-sfc.txt       |  24 +
>>  drivers/mtd/spi-nor/Kconfig                        |   6 +
>>  drivers/mtd/spi-nor/Makefile                       |   1 +
>>  drivers/mtd/spi-nor/hisi-sfc.c                     | 498 +++++++++++++++++++++
>>  4 files changed, 529 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
>>  create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
>> new file mode 100644
>> index 0000000..a0d1e04
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
>> @@ -0,0 +1,24 @@
>> +HiSilicon SPI-NOR Flash Controller
>> +
>> +Required properties:
>> +- compatible : Should be "hisilicon,hisi-sfc".
> 
> I missed this last time, but you also need a more specific compatible 
> string with the SOC name in it.
> 

This IP block is used in many SOCs. Do I need to add a specific compatible
string for every SOC? Thank you.

>> +- address-cells : number of cells required to define a chip select
>> +        address on the SPI bus. Should be set to 1. See spi-bus.txt.
>> +- size-cells : Should be 0.
>> +- reg : Offset and length of the register set for the controller device.
>> +- reg-names : Must include the following two entries: "control", "memory".
>> +- clocks : handle to spi-nor flash controller clock.
>> +
>> +Example:
>> +spi-nor-controller@10000000 {
>> +	compatible = "hisilicon,hisi-sfc";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	reg = <0x10000000 0x1000>, <0x14000000 0x1000000>;
>> +	reg-names = "control", "memory";
>> +	clocks = <&clock HI3519_FMC_CLK>;
>> +	spi-nor@0 {
>> +		compatible = "jedec,spi-nor";
>> +		reg = <0>;
>> +	};
>> +};
> 
> .
> 
