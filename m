From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/2] net: phy: dp83867: Add documentation for SGMII mode
 type
Date: Sat, 7 Sep 2019 17:39:19 +0200
Message-ID: <20190907153919.GC21922@lunn.ch>
References: <1567700761-14195-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Sender: netdev-owner@vger.kernel.org
To: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
Cc: davem@davemloft.net, robh+dt@kernel.org, f.fainelli@gmail.com, Mark Rutland <mark.rutland@arm.com>, Trent Piepho <tpiepho@impinj.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 07:26:00PM +0300, Vitaly Gaiduk wrote:
> Add documentation of ti,sgmii-type which can be used to select
> SGMII mode type (4 or 6-wire).
> 
> Signed-off-by: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
> ---
>  Documentation/devicetree/bindings/net/ti,dp83867.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.txt b/Documentation/devicetree/bindings/net/ti,dp83867.txt
> index db6aa3f2215b..18e7fd52897f 100644
> --- a/Documentation/devicetree/bindings/net/ti,dp83867.txt
> +++ b/Documentation/devicetree/bindings/net/ti,dp83867.txt
> @@ -37,6 +37,7 @@ Optional property:
>  			      for applicable values.  The CLK_OUT pin can also
>  			      be disabled by this property.  When omitted, the
>  			      PHY's default will be left as is.
> +	- ti,sgmii-type - This denotes the fact which SGMII mode is used (4 or 6-wire).

Hi Vitaly

You probably want to make this a Boolean. I don't think SGMII type is
a good idea. This is about enabling the receive clock to be passed to
the MAC. So how about ti,sgmii-ref-clock-output-enable.

    Andrew
