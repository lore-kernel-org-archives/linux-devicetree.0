From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH] LED: Fix missing semicolon in OF documentation
Date: Sun, 24 Jun 2012 01:49:44 -0500
Message-ID: <4FE6B888.1090700@landley.net>
References: <1340476877-2704-1-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1340476877-2704-1-git-send-email-marex@denx.de>
Sender: linux-doc-owner@vger.kernel.org
To: Marek Vasut <marex@denx.de>
Cc: linux-doc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org
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

Looks good to me?

More a Grant question, really. (And probably something for his tree.)

Rob
-- 
GNU/Linux isn't: Linux=GPLv2, GNU=GPLv3+, they can't share code.
Either it's "mere aggregation", or a license violation.  Pick one.
