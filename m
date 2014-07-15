From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: added missing semicolon in at25 dts example
Date: Tue, 15 Jul 2014 08:36:47 -0700
Message-ID: <53C54A8F.8080909@infradead.org>
References: <1405430449-21283-1-git-send-email-samarthp@ymail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1405430449-21283-1-git-send-email-samarthp@ymail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Samarth Parikh <samarthp@ymail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

[adding dt bindings people + list]

On 07/15/14 06:20, Samarth Parikh wrote:
> Added a missing semicolon ";" in device tree structure
> example of "EEPROMs (SPI) compatible with Atmel at25" in
> documentation of device tree bindings.
> 
> Signed-off-by: Samarth Parikh <samarthp@ymail.com>
> ---
>  Documentation/devicetree/bindings/misc/at25.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/at25.txt b/Documentation/devicetree/bindings/misc/at25.txt
> index 1d34471..cf830bd 100644
> --- a/Documentation/devicetree/bindings/misc/at25.txt
> +++ b/Documentation/devicetree/bindings/misc/at25.txt
> @@ -24,7 +24,7 @@ Additional compatible properties are also allowed.
>  Example:
>  	at25@0 {
>  		compatible = "atmel,at25", "st,m95256";
> -		reg = <0>
> +		reg = <0>;
>  		spi-max-frequency = <5000000>;
>  		spi-cpha;
>  		spi-cpol;
> 


-- 
~Randy
