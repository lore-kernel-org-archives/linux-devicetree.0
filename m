Return-Path: <SRS0=SV2Q=QT=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH v2 0/5] Add CMT/TMU support for RZ/G2E
References: <1549272007-33471-1-git-send-email-biju.das@bp.renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <86c16302-8f7e-52b6-d183-5a90c8a0fc85@linaro.org>
Date: Tue, 12 Feb 2019 11:03:28 +0100
MIME-Version: 1.0
In-Reply-To: <1549272007-33471-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 04/02/2019 10:20, Biju Das wrote:
> This patch series aims to add CMT/TMU timer support for RZ/G2E SoC.
> 
> This patch series is tested against renesas-dev and linux-next.

Do you want me to take the patch 1/5 and 4/5 through my tree ?

> -----
> V1 -->V2 Incoporated Geert's review comment for TMU clock
> 
> Biju Das (5):
>   dt-bindings: timer: renesas, cmt: Document r8a774c0 CMT support
>   arm64: dts: renesas: r8a774c0: Add CMT device nodes
>   clk: renesas: r8a774c0: Add TMU clock
>   dt-bindings: timer: renesas: tmu: Document r8a774c0 bindings
>   arm64: dts: renesas: r8a774c0: Add TMU device nodes
> 
>  .../devicetree/bindings/timer/renesas,cmt.txt      |   2 +
>  .../devicetree/bindings/timer/renesas,tmu.txt      |   1 +
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi          | 135 +++++++++++++++++++++
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c            |   5 +
>  4 files changed, 143 insertions(+)
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
