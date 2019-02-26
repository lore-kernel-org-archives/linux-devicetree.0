Return-Path: <SRS0=4wRd=RB=linux.intel.com=jarkko.nikula@kernel.org>
Subject: Re: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
Date: Tue, 26 Feb 2019 16:54:27 +0200
MIME-Version: 1.0
In-Reply-To: <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Gareth Williams <gareth.williams.jx@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Luis Oliveira <Luis.Oliveira@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

Hi

+ Luis from Synopsys.

Sorry the delay, I was out of office last week. Comment below.

On 2/21/19 6:10 PM, Gareth Williams wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> The driver requires an undocumented clock property, so detail it.
> Add documentation for a separate, optional, peripheral clock.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v4:
>   - Updated commit message to reference "peripheral clock" instead of
>     "bus clock"
>   - Added Wolfram's Acked-by
> v3:
>   - Changed clocks and clock-names sections to use term "peripheral clock"
>     (pclk) instead of "bus clock" (busclk).
...
>   Optional properties :
> +
> + - clock-names : Contains the names of the clocks:
> +    "ic_clk", for the core clock used to generate the external I2C clock.
> +    "pclk", the peripheral clock, required for register accesses.
> +

Actually it looks there is need to revert back to bus clock (or better) 
in comments but keep the "pclk" property.

The specification I have tells the ic_clk is the peripheral clock which 
runs the logic and the pclk (exactly pclk) is for bus interface and 
where registers are.

Luis: did I interpret it right?

-- 
Jarkko
