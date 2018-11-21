Return-Path: <SRS0=W0ze=OA=verge.net.au=horms@kernel.org>
Date: Wed, 21 Nov 2018 11:24:21 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
Message-ID: <20181121102421.yxndb3dyfxput25f@verge.net.au>
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 26, 2018 at 09:25:07AM +0100, Biju Das wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch is tested against renesas-dev
> 
> I have executed on inconsistency-check, nanosleep and clocksource_switch
> selftests on this arm64 SoC. The inconsistency-check and nanosleep tests
> are working fine.The clocksource_switch asynchronous test is failing due
> to inconsistency-check failure on "arch_sys_counter".
> 
> But if i skip the clocksource_switching of "arch_sys_counter", the
> asynchronous test is passing for CMT0/1/2/3 timer.
> 
> Has any one noticed this issue?

I am reluctant to apply this patch until there is a better understanding
of the issue above.
