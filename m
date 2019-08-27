Return-Path: <robherring2@gmail.com>
Date: Tue, 27 Aug 2019 12:24:45 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clk: emev2: Rename bindings
 documentation file
Message-ID: <20190827172445.GA15211@bogus>
References: <20190821091516.16372-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821091516.16372-1-horms+renesas@verge.net.au>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, 21 Aug 2019 11:15:16 +0200, Simon Horman wrote:
> Rename the device tree clock bindings for Renesas EMMA Mobile EV2
> from emev2-clock.txt to renesas,emev2-smu.txt.
> 
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> 
> v2
> * Drop emev2 prefix from new filename, it was unintentional
>   and does not match the proposed naming scheme
> ---
>  .../devicetree/bindings/clock/{emev2-clock.txt => renesas,emev2-smu.txt}  | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{emev2-clock.txt => renesas,emev2-smu.txt} (100%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
