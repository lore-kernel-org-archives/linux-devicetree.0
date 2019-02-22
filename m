Return-Path: <robherring2@gmail.com>
Date: Fri, 22 Feb 2019 09:06:39 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
Message-ID: <20190222150639.GA19921@bogus>
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
To: Gareth Williams <gareth.williams.jx@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Wolfram Sang <wsa@the-dreams.de>, Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 21, 2019 at 04:10:58PM +0000, Gareth Williams wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> The driver requires an undocumented clock property, so detail it.
> Add documentation for a separate, optional, peripheral clock.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v4:
>  - Updated commit message to reference "peripheral clock" instead of 
>    "bus clock" 
>  - Added Wolfram's Acked-by
> v3:
>  - Changed clocks and clock-names sections to use term "peripheral clock"
>    (pclk) instead of "bus clock" (busclk).
> v2:
>  - No changes.
> v1:
>  - Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-designware.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
