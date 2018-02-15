From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: eagle: specify EtherAVB PHY
 IRQ
Date: Thu, 15 Feb 2018 11:51:58 +0300
Message-ID: <9003179f-379d-0576-37bf-1b08700ebd41@cogentembedded.com>
References: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
 <0ccd631e-691a-2b15-7680-6e0c847a6ca2@cogentembedded.com>
 <CAMuHMdX3XZSwvAT74fVhWw9GoxVmpdXoqR03=u0QC3FEB==X=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdX3XZSwvAT74fVhWw9GoxVmpdXoqR03=u0QC3FEB==X=w@mail.gmail.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello!

On 2/14/2018 1:02 PM, Geert Uytterhoeven wrote:

>> Specify  EtherAVB PHY IRQ  in the Eagle board's device tree, now that we
>> have the GPIO support (previously phylib had to resort to polling).
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> You've dropped my:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

    Sorry, I was too hasty to resubmit. :-/

> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
