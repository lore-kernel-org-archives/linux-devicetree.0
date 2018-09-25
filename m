Return-Path: <robherring2@gmail.com>
Date: Tue, 25 Sep 2018 13:34:29 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: i2c: fix typo in brcm,bcm2835-i2c.txt
Message-ID: <20180925183429.GA3550@bogus>
References: <20180901152300.1895-1-semtax33@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180901152300.1895-1-semtax33@gmail.com>
To: sim manseop <semtax33@gmail.com>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat, Sep 01, 2018 at 03:23:00PM +0000, sim manseop wrote:
> Fix typo in brcm,bcm2835-i2c.txt between dts unit address and register start address mismatch.

Wrap long lines at <75 char.

> 
> Signed-off-by: manseop sim <semtax33@gmail.com>

As pointed out in other patches, your author and S-o-b names don't 
match.

> 
> ---
> Changes in v2:
> - modify subject
> - modify commit message
> ---
>  Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
> index e9de3756752b..ec78f84893ec 100644
> --- a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
> @@ -11,7 +11,7 @@ Recommended properties:
>  
>  Example:
>  
> -i2c@20205000 {
> +i2c@7e205000 {
>  	compatible = "brcm,bcm2835-i2c";
>  	reg = <0x7e205000 0x1000>;
>  	interrupts = <2 21>;
> -- 
> 2.17.1
> 
