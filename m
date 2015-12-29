From: zhongkaihua <zhongkaihua@huawei.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIFYyIDEvMl0gZHQtYmluZGluZ3M6IHNwaTogRG9jdW1l?=
 =?gb2312?Q?ntation_for_Hi6220_spi_driver?=
Date: Tue, 29 Dec 2015 08:29:33 +0000
Message-ID: <191FB6491B9FFA40828A83010D6755E92998CF17@SZXEMI501-MBS.china.huawei.com>
References: <1447922229-60552-1-git-send-email-zhongkaihua@huawei.com>
 <20151120153905.GA8476@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20151120153905.GA8476@rob-hp-laptop>
Content-Language: zh-CN
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Wangbintian <bintian.wang@huawei.com>, Xuyiping <xuyiping@hisilicon.com>, "arnd@arndb.de" <arnd@arndb.de>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, Dan zhao <dan.zhao@hisilicon.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "xuwei (O)" <xuwei5@hisilicon.com>, "kongxinwei (A)" <kong.kongxinwei@hisilicon.com>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>, "galak@codeaurora.org" <galak@codeaurora.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, "tyler.baker@linaro.org" <tyler.baker@linaro.org>, "Wangfei (William,
 Euler)" <w.f@huawei.com>, "kkojima@drone.co.jp" <kkojima>
List-Id: devicetree@vger.kernel.org

This block is not modified and the document is removed.

I just send out V3 patch for SPI on hi6220. Are There any other problems? Thanks

On 2015/11/20 23:39, Rob Herring wrote:> On Thu, Nov 19, 2015 at 04:37:08PM +0800, Zhong Kaihua wrote:
>> dt-bindings: spi: Documentation for Hi6220 spi driver
>>
>> Signed-off-by: Zhong Kaihua <zhongkaihua@huawei.com>
>> ---
>>  .../devicetree/bindings/spi/spi-hi6220.txt         | 45 ++++++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/spi/spi-hi6220.txt
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spi-hi6220.txt b/Documentation/devicetree/bindings/spi/spi-hi6220.txt
>> new file mode 100644
>> index 0000000..91aa169
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/spi-hi6220.txt
>> @@ -0,0 +1,45 @@
>> +Hi6220 SPI controller
>> +
>> +Required properties:
>> +- compatible : "arm,pl022", "arm,primecell"
> 
> If this is just a pl022, then you don't need this document as 
> spi_pl022.txt already exists. If HiSilicon has modified this block, then 
> you need an additional HiSi specific compatible string and add it to 
> spi_pl022.txt.
> 
>> +- reg : Offset and length of the register set for the device
>> +- interrupts : Should contain SPI controller interrupt
>> +- num-cs : total number of chipselects
>> +
>> +Required Board Specific Properties:
>> +
>> +- #address-cells: should be 1.
>> +- #size-cells: should be 0.
>> +
>> +Optional properties:
>> +- cs-gpios : should specify GPIOs used for chipselects.
>> +  The gpios will be referred to as reg = <index> in the SPI child nodes.
>> +  If unspecified, a single SPI device without a chip select can be used.
>> +- dmas : Two or more DMA channel specifiers following the convention outlined
>> +         in bindings/dma/dma.txt
>> +- dma-names: Names for the dma channels, if present. There must be at
>> +	     least one channel named "tx" for transmit and named "rx" for
>> +             receive.
>> +
>> +Example:
>> +             spi_0: spi@f7106000 {
>> +			compatible = "arm,pl022", "arm,primecell";
>> +			reg = <0x0 0xf7106000 0x0 0x1000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			interrupts = <0 50 4>;
>> +			bus-id = <0>;
> 
> This should be removed.
> 
> 
> .
>
