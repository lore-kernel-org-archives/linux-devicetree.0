From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM: at91/at91-pinctrl documentation: add missing sam9x5
 compatible string
Date: Tue, 27 Aug 2013 16:57:28 +0200
Message-ID: <521CBE58.9060402@atmel.com>
References: <1377609965-22154-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1377609965-22154-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Richard Genoud <richard.genoud@gmail.com>, Jiri Kosina <jkosina@suse.cz>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 27/08/2013 15:26, Boris BREZILLON :
> Add missing "atmel,at91sam9x5-pinctrl" compatible string to the
> documentation.
>
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> ---
>   .../bindings/pinctrl/atmel,at91-pinctrl.txt        |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> index 648d60e..cf7c7bc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> @@ -18,7 +18,7 @@ mode) this pin can work on and the 'config' configures various pad settings
>   such as pull-up, multi drive, etc.
>
>   Required properties for iomux controller:
> -- compatible: "atmel,at91rm9200-pinctrl"
> +- compatible: "atmel,at91rm9200-pinctrl" or "atmel,at91sam9x5-pinctrl"
>   - atmel,mux-mask: array of mask (periph per bank) to describe if a pin can be
>     configured in this periph mode. All the periph and bank need to be describe.
>
>


-- 
Nicolas Ferre
