Return-Path: <SRS0=LXPj=UR=verge.net.au=horms@kernel.org>
Date: Tue, 18 Jun 2019 12:31:19 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/8] dt-bindings: timer: renesas, cmt: Various updates
Message-ID: <20190618103118.xsgc5fp5d76itdwc@verge.net.au>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076216767.4736.16337667537984218274.sendpatchset@octo>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 17, 2019 at 06:02:47PM +0900, Magnus Damm wrote:
> dt-bindings: timer: renesas, cmt: Various updates
> 
> [PATCH 1/8] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
> [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
> [PATCH 3/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
> [PATCH 4/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7795
> [PATCH 5/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77965
> [PATCH 6/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77990
> [PATCH 7/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
> [PATCH 8/8] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage
> 
> This series collect the following rather trivial DT binding changes:
> - Add 32-bit CMT0234 and convert CMT1 DT binding on sh73a0 and r8a7740.
> - Add documentation for the CMT on the R-Car Gen2 V2H (r8a7792) SoC.
> - Add missing R-Car Gen3 DT bindings for H3, M3-N, E3 an D3.
> - Update the R-Car Gen3 description to reflect current usage.
> 
> Please see each individual patch for more information.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Hi Magnus,

I think this series should include the Clocksource maintainers as
recipients:

Daniel Lezcano <daniel.lezcano@linaro.org>
Thomas Gleixner <tglx@linutronix.de>

And LKML for good measure.
