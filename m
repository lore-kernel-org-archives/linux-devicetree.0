From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] clk: vc5: Add bindings for IDT VersaClock
 5P49V5923 and 5P49V5933
Date: Wed, 18 Jan 2017 15:28:13 -0600
Message-ID: <20170118212813.fhvzntoxxppfuyp2@rob-hp-laptop>
References: <20170112010324.28068-1-marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170112010324.28068-1-marek.vasut@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2017 at 02:03:23AM +0100, Marek Vasut wrote:
> Add bindings for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips.
> These are I2C clock generators with optional clock source from
> either XTal or dedicated clock generator and, depending on the
> model, two or more clock outputs.
> 
> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add mapping between the clock specifier and physical pins of the chip
> ---
>  .../devicetree/bindings/clock/idt,versaclock5.txt  | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/idt,versaclock5.txt

Acked-by: Rob Herring <robh@kernel.org>
