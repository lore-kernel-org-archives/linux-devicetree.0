Return-Path: <SRS0=IWi0=TF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38188 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727593AbfEEX0K (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 5 May 2019 19:26:10 -0400
Subject: Re: [PATCH 1/3] devicetree: document the BCM63XX gated clock bindings
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-2-jonas.gorski@gmail.com>
 <11dc70cb-114b-fb40-1b5e-fd71b8ced1af@amsat.org>
 <CAOiHx==tzUHU1nSf9c2+EtR0wJ=HDstRhHBCBQE5j79_uwJOLQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <98402178-2576-dc91-06e2-b8b4664ef348@amsat.org>
Date: Mon, 6 May 2019 01:26:04 +0200
MIME-Version: 1.0
In-Reply-To: <CAOiHx==tzUHU1nSf9c2+EtR0wJ=HDstRhHBCBQE5j79_uwJOLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 5/5/19 8:57 PM, Jonas Gorski wrote:
> Hi Philippe,
> 
> On Fri, 3 May 2019 at 16:36, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Jonas,
>>
>> On 5/2/19 2:26 PM, Jonas Gorski wrote:
>>> Add binding documentation for the gated clock controller found on MIPS
>>> based BCM63XX SoCs.
>>
>> I'd have ordered this patch after the #2 of this series, or eventually
>> squashed both together. It is weird to document an unexistant feature
>> then implement it, while the opposite looks more natural.
>> (If you agree, maybe Paul can invert those when applying this series).
>>
>> Anyway:
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> You are documenting hardware, not a driver/feature. :-)
> 
> The binding is supposed to be a separate patch [1]. The natural order
> is to first describe the hardware (with the binding documentation),
> then add the actual driver making use of the binding. Checkpatch.pl
> will also warn if you use a compatible that isn't documented, which
> happens (shortly) if you first add the driver.

Oh, thanks for the pointer, this is my first DT review ;)

> Regards
> Jonas
> 
> [1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/submitting-patches.txt#L8
> 
