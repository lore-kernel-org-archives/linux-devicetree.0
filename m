From: xuejiancheng <xuejiancheng@huawei.com>
Subject: Re: [PATCH v5 6/6] ARM: dts: add dts files for Hi3519
Date: Mon, 11 Jan 2016 10:05:57 +0800
Message-ID: <56930E05.1050009@huawei.com>
References: <1452219400-32478-1-git-send-email-xuejiancheng@huawei.com>
 <1452219400-32478-7-git-send-email-xuejiancheng@huawei.com>
 <20160108151058.GN19062@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160108151058.GN19062@n2100.arm.linux.org.uk>
Sender: linux-clk-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, p.zabel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hello Russell,

On 2016/1/8 23:10, Russell King - ARM Linux wrote:
> On Fri, Jan 08, 2016 at 10:16:40AM +0800, Jiancheng Xue wrote:
>> +		uart0: serial@12100000 {
>> +			compatible = "arm,pl011", "arm,primecell";
>> +			reg = <0x12100000 0x1000>;
>> +			interrupts = <0 4 4>;
> 
> Should the last digit there be IRQ_TYPE_LEVEL_HIGH (and same for the
> other interrupts= after this?)
> 
> Thanks.
> 

I'll include <dt-bindings/interrupt-controller/arm-gic.h> and use
IRQ_TYPE_LEVEL_HIGH instead. The interrupts specifier will be wrote
like this "interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;".

Thank you.

Jiancheng

