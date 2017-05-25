From: Rob Herring <robh@kernel.org>
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BhdGNoIHYzIDEvM10gYXJtNjQ6IGR0czogaGkzNjYwOiBhZGQgcA==?=
        =?UTF-8?B?Y2llIG5vZGU=?=
Date: Thu, 25 May 2017 07:38:38 -0500
Message-ID: <CAL_JsqJV5TA2ADo35tqGXC61NWK9PDqw8Dq5m5fYHg59yaoEUA@mail.gmail.com>
References: <20170518074946.21362-1-songxiaowei@hisilicon.com>
 <20170523141641.kbb4falhs574dfpu@rob-hp-laptop> <99B4C6BADD9E3241B25E52B02BA737C54116D35D@DGGEMA505-MBX.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <99B4C6BADD9E3241B25E52B02BA737C54116D35D@DGGEMA505-MBX.china.huawei.com>
Sender: linux-pci-owner@vger.kernel.org
To: songxiaowei <songxiaowei@hisilicon.com>
Cc: "Wangzhou (B)" <wangzhou1@hisilicon.com>, Gabriele Paoloni <gabriele.paoloni@huawei.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "xuwei (O)" <xuwei5@hisilicon.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chenfeng (puck)" <puck.chen@hisilicon.com>, "guodong.xu@linaro.org" <guodong.xu@linaro.org>, Wangbinghui <wangbinghui@hisilicon.com>, Suzhuangluan <suzhuangluan@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 8:39 PM, songxiaowei <songxiaowei@hisilicon.com> wrote:
> -----邮件原件-----
> 发件人: Rob Herring [mailto:robh@kernel.org]
> 发送时间: 2017年5月23日 22:17
> 收件人: songxiaowei
> 抄送: Wangzhou (B); Gabriele Paoloni; bhelgaas@google.com; mark.rutland@arm.com; xuwei (O); catalin.marinas@arm.com; will.deacon@arm.com; linux-pci@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Chenfeng (puck); guodong.xu@linaro.org; Wangbinghui; Suzhuangluan
> 主题: Re: [Patch v3 1/3] arm64: dts: hi3660: add pcie node
>
> On Thu, May 18, 2017 at 03:49:46PM +0800, Song Xiaowei wrote:
>> Add PCIe node for hi3660, and add binding documentation.
>>
>> Cc: Guodong Xu <guodong.xu@linaro.org>
>> Signed-off-by: Song Xiaowei <songxiaowei@hisilicon.com>
>> ---
>>  .../devicetree/bindings/pci/hisilicon-pcie.txt     | 52 ++++++++++++++++++++++
>>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi          | 31 +++++++++++++

[...]

>> +  "config": PCIe configuration space registers.
>> +- reset-gpio: perst assert/deassert gpio
>
> reset-gpios
> [songxiaowei] rest-gpio is used to signal 'pcie perst': high level refers to deassert
>              and low level refers to assert. So, I think ' reset-gpio: creates perst assert/deassert signal '
>                         would be a better choice.

What I was saying is the name should be reset-gpios, not reset-gpio.

Rob
