From: jiada <jiada_wang@mentor.com>
Subject: Re: [PATCH v1 0/2] rsnd: dts: change to use extended audio dmac
 register
Date: Fri, 22 Feb 2019 12:05:02 +0900
Message-ID: <021012f9-f522-0efd-4bb2-c56917623266@mentor.com>
References: <20190220052435.20508-1-jiada_wang@mentor.com>
 <CAMuHMdX1OqmwtCAtx8mxQtrG0D6bxkJ-trkA50qw=t16kBfdTQ@mail.gmail.com>
 <871s427ux5.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <871s427ux5.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert


On 2019/02/20 17:10, Kuninori Morimoto wrote:
> 
> Hi Geert
> 
>>> According to user reference manual for R-CAR H3 and M3-W SoCs,
>>> in order to access busif4 ~ busif7, extended audio dmac registers
>>> (PDMASAREn, PDMADAREn, PDMACHCREn)
>>> need to be used, rather than basic audio dmac registers
>>> (PDMASARn, PDMADARn, PDMACHCRn)
>>>
>>> This patch set updates H3 (= r8a7795) and M3-W (= r8a7796)
>>> to use extended audio dmac registers
>>
>> The same change should be applied for M3-N and RZ/G2M, right?
>>
Currently only H3 and M3-W support to use busif other than busif0,
I feel currently it's only necessary to use extended audio dmac register 
for these SoCs

>> R-Car E3 and RZ/G2E already use the extended register set, as they do not
>> have the basic set.
>>
>> For SoCs having both, this feels a bit like describing software policy, instead
>> of hardware, to me. Would it make sense to extend the audio bindings, and
>> allow describing both the basic and extended register sets, and let the driver
>> make the decision which one to use?
> 
> I don't think we need to use basic register.
> This means extended register only is very enough.
> I'm not sure why datasheet is indicating basic...
> 
Extended audio dmac registers covers all function of basic ones,
so there is no need to use basic registers

Thanks,
Jiada

> Best regards
> ---
> Kuninori Morimoto
> 
