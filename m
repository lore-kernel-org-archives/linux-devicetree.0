From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] clk: renesas: cpg-mssr: add R8A77980 support
Date: Mon, 5 Feb 2018 00:08:45 -0600
Message-ID: <20180205060845.ksaczxkdil7wuir6@rob-hp-laptop>
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
 <9008a12c-e5c8-9289-c47b-50ea9e049c67@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9008a12c-e5c8-9289-c47b-50ea9e049c67@cogentembedded.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 11:31:05PM +0300, Sergei Shtylyov wrote:
> Add R-Car V3H (R8A77980) Clock Pulse Generator / Module Standby and
> Software Reset support,  using the CPG/MSSR driver core and the common
> R-Car Gen3 code.
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt |    5 

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/clk/renesas/Kconfig                                  |    5 
>  drivers/clk/renesas/Makefile                                 |    1 
>  drivers/clk/renesas/r8a77980-cpg-mssr.c                      |  227 +++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c                       |    6 
>  drivers/clk/renesas/renesas-cpg-mssr.h                       |    1 
>  6 files changed, 243 insertions(+), 2 deletions(-)
