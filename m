From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] clk: renesas: cpg-mssr: add R8A77980 support
Date: Mon, 5 Feb 2018 09:59:51 +0100
Message-ID: <20180205085951.vcsoqcmuqjdcqhsa@verge.net.au>
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
 <9008a12c-e5c8-9289-c47b-50ea9e049c67@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9008a12c-e5c8-9289-c47b-50ea9e049c67@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
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

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
