From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 7/8] clk: vc5: Add bindings for IDT VersaClock
 5P49V6901
Date: Fri, 7 Jul 2017 08:56:19 -0500
Message-ID: <20170707135619.l6lgvfrhqvrgu2hb@rob-hp-laptop>
References: <20170701200459.11505-1-marek.vasut+renesas@gmail.com>
 <20170701200459.11505-7-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170701200459.11505-7-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Alexey Firago <alexey_firago@mentor.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 01, 2017 at 10:04:57PM +0200, Marek Vasut wrote:
> IDT VersaClock 6 5P49V6901 has 4 clock outputs, 4 fractional dividers.
> Input clock source can be taken from either external crystal or from
> external reference clock.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Alexey Firago <alexey_firago@mentor.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> ---
> V2: Edit the top of the DT binding document to mention VersaClock 6
> ---
>  .../devicetree/bindings/clock/idt,versaclock5.txt   | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> index 53d7e50ed875..115ab5f75c5d 100644
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> @@ -1,24 +1,26 @@
> -Binding for IDT VersaClock5 programmable i2c clock generator.
> +Binding for IDT VersaClock 5,6 programmable i2c clock generators.
>  
> -The IDT VersaClock5 are programmable i2c clock generators providing
> -from 3 to 12 output clocks.
> +The IDT VersaClock 5 and VersaClock 6 are programmable i2c clock
> +generators providing from 3 to 12 output clocks.
>  
>  ==I2C device node==
>  
>  Required properties:
>  - compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5933" ,
> -		"idt,5p49v5935".
> +		"idt,5p49v5935" , "idt,5p49v6901".

Please reformat to 1 per line. With that,

Acked-by: Rob Herring <robh@kernel.org>
