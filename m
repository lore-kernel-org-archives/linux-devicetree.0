From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: add Hi6220 mailbox node
Date: Thu, 27 Aug 2015 16:54:49 +0100
Message-ID: <55DF32C9.8040302@linaro.org>
References: <20150821184059.GB2000@svinekod>
 <20150824091845.GA28290@leoy-linaro> <20150824095144.GA7139@leverpostej>
 <1440411596.3517.12.camel@linaro.org>
 <20150824114903.GT10728@bivouac.eciton.net>
 <1440490427.10987.29.camel@linaro.org>
 <20150825094630.GU10728@bivouac.eciton.net>
 <1440497710.10987.42.camel@linaro.org> <20150825104256.GB13471@leverpostej>
 <1440510194.10987.52.camel@linaro.org> <20150825160030.GA3774@leoy-linaro>
 <1440552341.10987.53.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440552341.10987.53.camel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>, Leo Yan <leo.yan@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bintian Wang <bintian.wang@huawei.com>, Yiping Xu <xuyiping@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "guodong.xu@linaro.org" <guodong.xu@linaro.org>, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, kongfei@hisilicon.c
List-Id: devicetree@vger.kernel.org

On 26/08/15 02:25, Haojian Zhuang wrote:
>> Option 1:
>>
>> 	memory@0 {
>> 		device_type = "memory";
>> 		reg = <0x00000000 0x00000000 0x00000000 0x05e00000>,
>> 		      <0x00000000 0x05f00000 0x00000000 0x00eff000>,
>> 		      <0x00000000 0x06e00000 0x00000000 0x0060f000>,
>> 		      <0x00000000 0x07410000 0x00000000 0x38bf0000>;
>> 	};
>>
>> [snip]
 >>
>> Option 2:
>>
>> 	memory@0 {
>> 		device_type = "memory";
>> 		reg = <0x0 0x0 0x0 0x40000000>;
>> 	};
>>
 >> [snip]
 >>
>
> I prefer the second one. From my view, memory node should only describe
> the hardware information of memory.

Haven't we already established that, to avoid the risk of UEFI 
applications accessing inappropriate memory locations, a (correct) UEFI 
implementation must use, and pass to the kernel, a memory map that looks 
like option 1?

That being the case why would we want u-boot (or any other similar 
bootloader) to pass a memory map that is gratuitously different to the 
one supplied by UEFI?


Daniel.
