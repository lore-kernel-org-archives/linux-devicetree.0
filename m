From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 01/17] dt-bindings: vendor-prefixes: Add PLX Technology
Date: Thu, 03 Mar 2016 16:02:15 +0100
Message-ID: <1457017335.3425.72.camel@pengutronix.de>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
	 <1457005210-18485-2-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457005210-18485-2-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 03.03.2016, 12:39 +0100 schrieb Neil Armstrong:
> Add PLX Technology vendor prefix.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 72e2c5a..03970fb 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -178,6 +178,7 @@ picochip	Picochip Ltd
>  plathome	Plat'Home Co., Ltd.
>  plda	PLDA
>  pixcir  PIXCIR MICROELECTRONICS Co., Ltd
> +plxtech	PLX Technology, Inc.

The PLX Technology NASDAQ symbol used to be PLXT.
Personally, I prefer the more verbose name, just pointing out that
"plxt," might also be an option.

regards
Philipp
