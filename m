From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] LED: Fix missing semicolon in OF documentation
Date: Thu, 05 Jul 2012 11:08:49 -0500
Message-ID: <4FF5BC11.2070901@gmail.com>
References: <1340476877-2704-1-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1340476877-2704-1-git-send-email-marex@denx.de>
Sender: linux-doc-owner@vger.kernel.org
To: Marek Vasut <marex@denx.de>
Cc: linux-doc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 06/23/2012 01:41 PM, Marek Vasut wrote:
> Trivial fix
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Rob Landley <rob@landley.net>
> Cc: devicetree-discuss@lists.ozlabs.org
> Cc: linux-doc@vger.kernel.org
> ---

Applied for 3.6.

Rob


>  Documentation/devicetree/bindings/gpio/led.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/led.txt b/Documentation/devicetree/bindings/gpio/led.txt
> index fd2bd56..9bb308a 100644
> --- a/Documentation/devicetree/bindings/gpio/led.txt
> +++ b/Documentation/devicetree/bindings/gpio/led.txt
> @@ -55,4 +55,4 @@ run-control {
>  		gpios = <&mpc8572 7 0>;
>  		default-state = "on";
>  	};
> -}
> +};
> 

