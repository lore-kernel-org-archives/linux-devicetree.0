Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Apr 2018 08:41:44 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] clk: renesas: Add r8a77990 CPG Core Clock
 Definitions
Message-ID: <20180427134144.kxqsmefmulewotne@rob-hp-laptop>
References: <1524227264-24896-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524227264-24896-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524227264-24896-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, mark.rutland@arm.com, geert+renesas@glider.be, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 20, 2018 at 09:27:43PM +0900, Yoshihiro Shimoda wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds all R-Car E3 Clock Pulse Generator Core Clock Outputs.
> 
> Note that internal CPG clocks (S0, S1, S2, S3, SDSRC) are not included,
> as they are used as internal clock sources only, and never referenced
> from DT.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [shimoda: add SPDX-License-Identifier]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  include/dt-bindings/clock/r8a77990-cpg-mssr.h | 62 +++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 include/dt-bindings/clock/r8a77990-cpg-mssr.h

Reviewed-by: Rob Herring <robh@kernel.org>
