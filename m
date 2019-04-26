Return-Path: <SRS0=BEIL=S4=verge.net.au=horms@kernel.org>
Date: Fri, 26 Apr 2019 11:41:12 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/5] Add TPU support for R-Car H3/M3-W/M3-N
Message-ID: <20190426094112.r6nyvpnhcb2j4qv6@verge.net.au>
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be, broonie@kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Hi,

On Thu, Apr 25, 2019 at 10:25:12AM +0900, Cao Van Dong wrote:
> This series adds tpu support for r8a7795/r8a7796/r8a77965 SoCs.
> Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.
> For test, after booting, I found the device was registered in the booting log.

Could you clarify some details of this test.

Looking at the DTS patches I see 'status = "disabled";' for each
of the newly added devices. So I would not expect them to be probed
at run-time without some extra tweaking.

> 
> Cao Van Dong (5):
>   clk: renesas: r8a779{5|6|65}: Add TPU clock
>   arm64: dts: renesas: r8a7795: Add TPU support
>   arm64: dts: renesas: r8a7796: Add TPU support
>   arm64: dts: renesas: r8a77965: Add TPU support
>   dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings
> 
>  Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt |  3 +++
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi                  | 11 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi                  | 11 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi                 | 11 +++++++++++
>  drivers/clk/renesas/r8a7795-cpg-mssr.c                    |  1 +
>  drivers/clk/renesas/r8a7796-cpg-mssr.c                    |  1 +
>  drivers/clk/renesas/r8a77965-cpg-mssr.c                   |  1 +
>  7 files changed, 39 insertions(+)
> 
> -- 
> 2.7.4
> 
