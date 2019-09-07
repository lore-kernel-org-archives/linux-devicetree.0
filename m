From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 14/19] MIPS: Loongson64: Add generic dts
Date: Sat, 7 Sep 2019 11:14:09 +0800
Message-ID: <182a271e-6a66-ed71-2d68-509d8e85d857@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
 <20190905144316.12527-15-jiaxun.yang@flygoat.com>
 <CAAhV-H7jzUZr9fGHF_=F3pri9F3zN3ygHhd3xWZevOugaStcfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAhV-H7jzUZr9fGHF_=F3pri9F3zN3ygHhd3xWZevOugaStcfA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: "open list:MIPS" <linux-mips@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.co>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 2019/9/7 上午10:53, Huacai Chen wrote:
> On Thu, Sep 5, 2019 at 10:47 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> Add generic device dts for Loongson-3 devices.
>> They seems identical but will be different later.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Hi, Jiaxun,
>
> I'm very glad to see that dts files become less in this version, but I
> think we also don't need to distinguish cpu types (i.e.,
> 3a1000/3b1500/3a2000/3a3000). Then, we only need three dts files
> (loongson3_ls2h.dts, loongson3_ls7a.dts, loongson3_rs780.dts) which is
> the same as in our own git repository. If we really need to
> distinguish cpu type, PRID or CPUCFG in Loongson-3A4000 is more
> suitable than dts. In other words, I want dts only do as minimal as
> possible.

Hi Huacai,

I have the  same consideration with you. However, the reason why I split 
this dts is that these chips have significant differences.

For example, 3B1x00 have different memory and config registers layout, 
Their HT config space is a delicate node, HTMSI interrupts is not 
functional until 3A3000, and their syscon registers are not identical.

You may say they can be identified by PRID, but I'm not intend to spread 
PRID all the way in other subsystems, thus I think dts is still the best 
way to tell these differences.

Thanks

--

Jiaxun Yang

>
> Huacai
>
