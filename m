From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: power: supply: Add documentation for
 the VINDPM properties
Date: Thu, 13 Jun 2019 17:09:06 -0600
Message-ID: <20190613230906.GA10492@bogus>
References: <20190520180712.32405-1-angus@akkea.ca>
 <20190520180712.32405-3-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190520180712.32405-3-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 11:07:12AM -0700, Angus Ainslie (Purism) wrote:
> Add documentation on how to control VINDPM from the devicetree.
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  .../devicetree/bindings/power/supply/bq25890.txt          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/bq25890.txt b/Documentation/devicetree/bindings/power/supply/bq25890.txt
> index dc0568933359..fe8b709dd666 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq25890.txt
> +++ b/Documentation/devicetree/bindings/power/supply/bq25890.txt
> @@ -26,9 +26,15 @@ Optional properties:
>  - ti,use-ilim-pin: boolean, if present the ILIM resistor will be used and the
>      input current will be the lower between the resistor setting and the IINLIM
>      register setting;
> +- ti,use-vinmin-threshold: boolean, if present the FORCE_VINDPM bit will be set
> +    and the input voltage limit will be configured based on "ti,vinmin-threshold"

Isn't presence of ti,vinmin-threshold enough to determine whether to set 
FORCE_VINDPM or not? Just get rid of the default being 4.4V.

>  - ti,thermal-regulation-threshold: integer, temperature above which the charge
>      current is lowered, to avoid overheating (in degrees Celsius). If omitted,
>      the default setting will be used (120 degrees);
> +- ti,vinmin-threshold: integer, lower absolute threshold for VINDPM. If the
> +    voltage falls below this threshold the charge current is reduced until the
> +    input voltage rises above the input voltage limit. If omitted, the default
> +    setting will be used (4.4V);
>  
>  Example:
>  
> @@ -46,4 +52,6 @@ bq25890 {
>  
>          ti,use-ilim-pin;
>          ti,thermal-regulation-threshold = <120>;
> +        ti,use-vinmin-threshold;
> +        ti,vinmin-threshold = <3900000>;
>  };
> -- 
> 2.17.1
> 
