Return-Path: <robherring2@gmail.com>
Date: Tue, 14 May 2019 15:33:55 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] devicetree: document the BCM63XX gated clock bindings
Message-ID: <20190514203355.GA31623@bogus>
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-2-jonas.gorski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502122657.15577-2-jonas.gorski@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu,  2 May 2019 14:26:55 +0200, Jonas Gorski wrote:
> Add binding documentation for the gated clock controller found on MIPS
> based BCM63XX SoCs.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  .../bindings/clock/brcm,bcm63xx-clocks.txt         | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
