From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add Sierra Wireless
Date: Fri, 19 Aug 2016 08:48:46 -0500
Message-ID: <20160819134846.GA2414@rob-hp-laptop>
References: <1471525881-2797-1-git-send-email-narmstrong@baylibre.com>
 <1471525881-2797-2-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1471525881-2797-2-git-send-email-narmstrong@baylibre.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux@armlinux.org.uk, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 18, 2016 at 03:11:18PM +0200, Neil Armstrong wrote:
> Add Sierra Wireless as swi vendor prefix.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 1992aa9..5a8881f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -254,6 +254,7 @@ starry	Starry Electronic Technology (ShenZhen) Co., LTD
>  startek	Startek
>  ste	ST-Ericsson
>  stericsson	ST-Ericsson
> +swi	Sierra Wireless

swir is the stock ticker. Can you use that?

This is going to have some conflicts with some sorting fixes, so I plan 
to pick up this patch separately.

Rob
