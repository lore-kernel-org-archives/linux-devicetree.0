Return-Path: <SRS0=9qyC=BV=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Oct 2017 08:30:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [v2,5/5] dt: watchdog: Document compatibility with JZ4780
Message-ID: <20171022153018.GA20519@roeck-us.net>
References: <20170915192040.27768-1-malat@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170915192040.27768-1-malat@debian.org>
To: Mathieu Malaterre <malat@debian.org>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Wim Van Sebroeck <wim@iguana.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 15, 2017 at 09:20:40PM +0200, Mathieu Malaterre wrote:
> Suggested-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
> * Document the new compatible string
> 
>  Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt b/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt
> index e27763ef0049..1a56061bfb06 100644
> --- a/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt
> @@ -1,7 +1,7 @@
> -Ingenic Watchdog Timer (WDT) Controller for JZ4740
> +Ingenic Watchdog Timer (WDT) Controller for JZ4740 & JZ4780
>  
>  Required properties:
> -compatible: "ingenic,jz4740-watchdog"
> +compatible: "ingenic,jz4740-watchdog" or "ingenic,jz4780-watchdog"
>  reg: Register address and length for watchdog registers
>  
>  Example:
