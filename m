Return-Path: <robherring2@gmail.com>
Date: Wed, 30 Jan 2019 10:57:23 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: document open-drain property
Message-ID: <20190130165723.GA22934@bogus>
References: <20190127203911.8696-1-martin@martingkelly.com>
 <20190127203911.8696-5-martin@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190127203911.8696-5-martin@martingkelly.com>
To: Martin Kelly <martin@martingkelly.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun, Jan 27, 2019 at 12:39:09PM -0800, Martin Kelly wrote:
> From: Martin Kelly <martin@martingkelly.com>
> 
> We have added an optional boolean property for configuring a BMI160
> interrupt pin as open-drain, as opposed to the default push-pull, so
> document this.
> 
> Signed-off-by: Martin Kelly <martin@martingkelly.com>
> ---
>  Documentation/devicetree/bindings/iio/imu/bmi160.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/bmi160.txt b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
> index 1aec19997fb5..7eb4b6016404 100644
> --- a/Documentation/devicetree/bindings/iio/imu/bmi160.txt
> +++ b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
> @@ -12,6 +12,8 @@ Optional properties:
>   - interrupts : interrupt mapping for IRQ
>   - interrupt-names : set to "INT1" if INT1 pin should be used as interrupt
>     input, set to "INT2" if INT2 pin should be used instead
> +- bmi160,open-drain : set if the specified interrupt pin should be configured as
> +  open drain. If not set, defaults to push-pull.

Use 'drive-open-drain' like others.

>  
>  Examples:
>  
> -- 
> 2.11.0
> 
