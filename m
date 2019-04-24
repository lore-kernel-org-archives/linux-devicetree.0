Return-Path: <SRS0=Lf4w=S2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:28100 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbfDXIWP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 24 Apr 2019 04:22:15 -0400
Subject: Re: [PATCH 0/4] Add TPU support for R-Car H3/M3-W/M3-N
References: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
 <CAMuHMdV42AY-ihUpfoOYraTWn6Pf=b6W15pq5sp97OdeZSGebw@mail.gmail.com>
From: Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <6f5f130c-9599-fec9-daf9-c047368f4b9c@jinso.co.jp>
Date: Wed, 24 Apr 2019 17:22:11 +0900
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV42AY-ihUpfoOYraTWn6Pf=b6W15pq5sp97OdeZSGebw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>, Hoan Nguyen An <na-hoan@jinso.co.jp>
List-ID: <devicetree@vger.kernel.org>

Dear Geert-san,

On 2019/04/24 16:49, Geert Uytterhoeven wrote:
> Hi Cao,
>
> On Tue, Apr 16, 2019 at 3:56 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
>> This series adds tpu support for r8a7795/r8a7796/r8a77965 SoCs.
>> Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.
>>
>> For test: After booting, I found the device was registered in the boot log.
> Thanks for your series!
>
>> Cao Van Dong (4):
>>    arm64: dts: renesas: r8a7795: Add TPU support
>>    arm64: dts: renesas: r8a7796: Add TPU support
>>    arm64: dts: renesas: r8a77965: Add TPU support
>>    dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings
>>
>>   Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt |  3 +++
>>   arch/arm64/boot/dts/renesas/r8a7795.dtsi                  | 11 +++++++++++
>>   arch/arm64/boot/dts/renesas/r8a7796.dtsi                  | 11 +++++++++++
>>   arch/arm64/boot/dts/renesas/r8a77965.dtsi                 | 11 +++++++++++
>>   drivers/clk/renesas/r8a7795-cpg-mssr.c                    |  1 +
>>   drivers/clk/renesas/r8a7796-cpg-mssr.c                    |  1 +
>>   drivers/clk/renesas/r8a77965-cpg-mssr.c                   |  1 +
>>   7 files changed, 39 insertions(+)
> Please split off the clock driver changes into separate patches, as DTS and
> clock driver changes go in through different subsystem/maintainer paths.
Thanks for your feedback!
I will separate them and re-submit it with the v2 mask.

Thank you,
Dong
> Gr{oetje,eeting}s,
>
>                          Geert
>
