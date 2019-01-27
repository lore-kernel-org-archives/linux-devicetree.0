From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: Re: [PATCH 3/4] Irqchip: Ingenic: Add support for the X1000.
Date: Sun, 27 Jan 2019 22:51:52 +0800
Message-ID: <5C4DC588.6040702@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1548517123-60058-4-git-send-email-zhouyanjie@zoho.com>
 <86pnsiwgnx.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86pnsiwgnx.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, mark.rutland@arm.com, jason@lakedaemon.net, tglx@linutronix.de, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: devicetree@vger.kernel.org

Thanks for your suggestions, It will be deleted in the v2.

On 2019=E5=B9=B401=E6=9C=8827=E6=97=A5 18:14, Marc Zyngier wrote:
> On Sat, 26 Jan 2019 15:38:42 +0000,
> Zhou Yanjie <zhouyanjie@zoho.com> wrote:
>> Add support for probing the irq-ingenic driver on the X1000 Soc.
>> X1000 is a 1.0GHz processor for IoT. It has MIPS32 XBurst RISC core
>> with double precision hardware float point unit.
> I don't think we need the marketing spiel, as none of the advertised
> target market, ISA or feature set of this SoC is relevant for this
> patch. Put it in the cover letter if you must.
>
> Instead, explaining that it behaves just like any of the other "2chip"
> Ingenic SoCs makes is much more relevant.
>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>   drivers/irqchip/irq-ingenic.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic=
.c
>> index 69be219..0b643c7 100644
>> --- a/drivers/irqchip/irq-ingenic.c
>> +++ b/drivers/irqchip/irq-ingenic.c
>> @@ -177,3 +177,4 @@ static int __init intc_2chip_of_init(struct device_n=
ode *node,
>>   IRQCHIP_DECLARE(jz4770_intc, "ingenic,jz4770-intc", intc_2chip_of_init=
);
>>   IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc", intc_2chip_of_init=
);
>>   IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc", intc_2chip_of_init=
);
>> +IRQCHIP_DECLARE(x1000_intc, "ingenic,x1000-intc", intc_2chip_of_init);
>> --=20
>> 2.7.4
>>
>>
> Thanks,
>
> =09M.
>
