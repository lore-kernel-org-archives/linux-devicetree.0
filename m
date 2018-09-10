Return-Path: <robherring2@gmail.com>
Date: Mon, 10 Sep 2018 14:58:38 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: i2c: Fix SMBus typo
Message-ID: <20180910195838.GA14500@bogus>
References: <20180901094912.2403-1-semtax33@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180901094912.2403-1-semtax33@gmail.com>
To: sim manseop <semtax33@gmail.com>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat, Sep 01, 2018 at 09:49:12AM +0000, sim manseop wrote:
> Fix typo 'SMbus' to 'SMBus'
> 
> Signed-off-by: manseop sim <semtax33@gmail.com>

checkpatch.pl complains that author name and signoff don't match.

> 
> ---
> Changes in v3:
> - modifing subject
> 
> ---
> Changes in v2:
> - modifing subject
> - changed commit message
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index 11263982470e..44efafdfd7f5 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -84,7 +84,7 @@ Binding may contain optional "interrupts" property, describing interrupts
>  used by the device. I2C core will assign "irq" interrupt (or the very first
>  interrupt if not using interrupt names) as primary interrupt for the slave.
>  
> -Alternatively, devices supporting SMbus Host Notify, and connected to
> +Alternatively, devices supporting SMBus Host Notify, and connected to
>  adapters that support this feature, may use "host-notify" property. I2C
>  core will create a virtual interrupt for Host Notify and assign it as
>  primary interrupt for the slave.
> -- 
> 2.17.1
> 
