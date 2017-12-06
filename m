From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt: bindings: as3645a: Fix the example node
Date: Wed, 6 Dec 2017 15:52:04 -0600
Message-ID: <20171206215204.7qyjjd2oue7n7l37@rob-hp-laptop>
References: <20171205133637.30022-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171205133637.30022-1-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 05, 2017 at 07:36:37AM -0600, Dan Murphy wrote:
> Fix the address-cells and size-cells example node
> to reflect to the correct representation.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/leds/ams,as3645a.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> index fdc40e354a64..8a49ccfec29b 100644
> --- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> +++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> @@ -59,8 +59,8 @@ Example
>  =======
>  
>  	as3645a@30 {
> -		#address-cells: 1
> -		#size-cells: 0
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  		reg = <0x30>;
>  		compatible = "ams,as3645a";

Convention is also we put compatible first.

>  		flash@0 {
> -- 
> 2.15.0.124.g7668cbc60
> 
