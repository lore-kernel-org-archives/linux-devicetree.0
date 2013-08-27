From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V2 2/2] of: add vendor prefix for Microchip Technology
 Inc
Date: Tue, 27 Aug 2013 15:17:06 +0100
Message-ID: <20130827141706.GM19893@e106331-lin.cambridge.arm.com>
References: <1377510385-8149-1-git-send-email-larsi@wh2.tu-dresden.de>
 <1377510385-8149-2-git-send-email-larsi@wh2.tu-dresden.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1377510385-8149-2-git-send-email-larsi@wh2.tu-dresden.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <larsi@wh2.tu-dresden.de>
Cc: "poeschel@lemonage.de" <poeschel@lemonage.de>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "rob@landley.net" <rob@landley.net>, "arnd@arndb.de" <arnd@arndb.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 26, 2013 at 10:46:25AM +0100, Lars Poeschel wrote:
> From: Lars Poeschel <poeschel@lemonage.de>
> 
> Trivial patch to add Microchip Technology Inc. to the list
> of devicetree vendor prefixes.
> 
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>

Acked-by: Mark Rutland <mark.rutland@arm.com>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 366ce9b..4cdfbe8 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -36,6 +36,7 @@ linux	Linux-specific binding
>  lsi	LSI Corp. (LSI Logic)
>  marvell	Marvell Technology Group Ltd.
>  maxim	Maxim Integrated Products
> +microchip	Microchip Technology Inc.
>  mosaixtech	Mosaix Technologies, Inc.
>  national	National Semiconductor
>  nintendo	Nintendo
> -- 
> 1.7.10.4
> 
> 
