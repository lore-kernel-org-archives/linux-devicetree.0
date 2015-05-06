From: Bintian <bintian.wang@huawei.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Wed, 6 May 2015 14:50:52 +0800
Message-ID: <5549B9CC.1040709@huawei.com>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>
 <1430827599-11560-6-git-send-email-bintian.wang@huawei.com>
 <20150505171349.GA30215@leverpostej> <5549877C.10408@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5549877C.10408@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Leo Yan <leo.yan@linaro.org>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>
Cc: "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>, "btw@mail.itp.ac.cn" <btw@mail.itp.ac.cn>, Catalin Marinas <Catalin.Marinas@arm.com>, "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>, Will Deacon <Will.Deacon@arm.com>, "huxinwei@huawei.com" <huxinwei@huawei.com>, "yanhaifeng@gmail.com" <yanhaifeng@gmail.com>, "rob.herring@linaro.org" <rob.herring@linaro.org>, "mturquette@linaro.org" <mturquette@linaro.org>, Pawel Moll <Pawel.Moll@arm.com>, "khilman@kernel.org" <khilman@kernel.org>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>, "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>, "heyunlei@huawei.com" <heyunlei@huawei.com>, "w.f@huawei.com" <w.f@huawei.com>, "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>, "z.liuxinliang@huawei.com" <z.liu>
List-Id: devicetree@vger.kernel.org

Hello Mark,

On 2015/5/6 11:16, Bintian wrote:
> Hello Mark,
>
> On 2015/5/6 1:13, Mark Rutland wrote:
[...]
>>> +        uart0: uart@f8015000 {    /* console */
>>> +            compatible = "arm,pl011", "arm,primecell";
>>> +            reg = <0x0 0xf8015000 0x0 0x1000>;
>>> +            interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>>> +            clocks = <&ao_ctrl HI6220_UART0_PCLK>, <&ao_ctrl
>>> HI6220_UART0_PCLK>;
>>> +            clock-names = "uartclk", "apb_pclk";
>>> +        };
>>
>> In a previous discussion [1] the UART on HI6220 was described as not
>> fully PL011 compliant, with a number of differences (e.g. the FIFO
>> length).
>>
>> Given that, I feel somewhat uncomfortable with the current compatible
>> string list. What exactly are those differences? We may need a more
>> specific compatible string (even if in addition to those existing ones),
>> or perhaps other properties.
> The small system can be booted and the console also works well without
> changing any code of driver amba-pl011.c, so I think the compatible
> string is OK for this patch set.
>
> Hisilicon do some performance enhancements based on PL011, but the
> current driver "amba-pl011.c" also works on hi6220 without those
> enhancements driver code.
Checked with Hisilicon chip designer, the UART0 is used for DEBUG
console and compliant with PL011 fully.

Thanks,

Bintian
>
>>
>> Thanks,
>> Mark.
>>
>> [1]
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/328978.html
>>
>>
>> .
>>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
> .
>
