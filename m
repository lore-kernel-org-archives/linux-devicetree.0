Return-Path: <SRS0=4gC5=RE=linux.intel.com=jarkko.nikula@kernel.org>
Subject: Re: [PATCH v5 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
References: <1551361930-24434-1-git-send-email-gareth.williams.jx@renesas.com>
 <1551361930-24434-2-git-send-email-gareth.williams.jx@renesas.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <71fabf45-b438-c2a7-ccb3-4b3c95f6d5d8@linux.intel.com>
Date: Fri, 1 Mar 2019 16:57:18 +0200
MIME-Version: 1.0
In-Reply-To: <1551361930-24434-2-git-send-email-gareth.williams.jx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Gareth Williams <gareth.williams.jx@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 2/28/19 3:52 PM, Gareth Williams wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> The driver requires an undocumented clock property, so detail it.
> Add documentation for a separate, optional, interface clock.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v5:
>   - Changed clocks and clock-names sections to use term "interface
>     clock" instead of "peripheral clock".
>   - Updated commit message to reference "interface clock" instead of
>     "peripheral clock".
> v4:
>   - Updated commit message to reference "peripheral clock" instead of
>     "bus clock".
> v3:
>   - Changed clocks and clock-names sections to use term "peripheral clock"
>     (pclk) instead of "bus clock" (busclk).
> v2:
>   - No changes.
> v1:
>   - Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/i2c/i2c-designware.txt | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
