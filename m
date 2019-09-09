From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 1/2] net: phy: dp83867: Add documentation for SGMII
 mode type
Date: Mon, 9 Sep 2019 09:56:58 -0700
Message-ID: <a606a302-03f3-7533-1e11-0f5590ca34fe@gmail.com>
References: <1568026945-3857-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1568047940-14490-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1568047940-14490-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1568047940-14490-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>, davem@davemloft.net, robh+dt@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Trent Piepho <tpiepho@impinj.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 9/9/19 9:52 AM, Vitaly Gaiduk wrote:
> Add documentation of ti,sgmii-ref-clock-output-enable
> which can be used to select SGMII mode type (4 or 6-wire).
> 
> Signed-off-by: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
> ---
>  Documentation/devicetree/bindings/net/ti,dp83867.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.txt b/Documentation/devicetree/bindings/net/ti,dp83867.txt
> index db6aa3f..c98c682 100644
> --- a/Documentation/devicetree/bindings/net/ti,dp83867.txt
> +++ b/Documentation/devicetree/bindings/net/ti,dp83867.txt
> @@ -37,6 +37,10 @@ Optional property:
>  			      for applicable values.  The CLK_OUT pin can also
>  			      be disabled by this property.  When omitted, the
>  			      PHY's default will be left as is.
> +	- ti,sgmii-ref-clock-output-enable - This denotes the fact which
> +				    SGMII configuration is used (4 or 6-wire modes).
> +				    Some MACs work with differential SGMII clock.
> +				    See data manual for details.

The wording is a bit odd here, I would just omit "the fact" to make the
sentence more readable. With that:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
