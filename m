From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v3] dt-bindings: media: adv748x: Document re-mappable
 addresses
Date: Thu, 16 Aug 2018 10:36:58 +0200
Message-ID: <20180816083658.GP1635@bigcity.dyn.berto.se>
References: <20180809192944.7371-1-kieran.bingham@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180809192944.7371-1-kieran.bingham@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thanks for your patch.

On 2018-08-09 20:29:44 +0100, Kieran Bingham wrote:
> The ADV748x supports configurable slave addresses for its I2C pages.
> Document the page names, and provide an example for setting each of the
> pages explicitly.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> ---
> v2:
>  - Fix commit message
>  - Extend documentation for the "required property" reg:
> 
> v3
>  - Fix missing comment from Laurent.
>  - correct the reg descrption
> ---
>  .../devicetree/bindings/media/i2c/adv748x.txt    | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> index 21ffb5ed8183..25a02496f4ba 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> @@ -10,7 +10,11 @@ Required Properties:
>      - "adi,adv7481" for the ADV7481
>      - "adi,adv7482" for the ADV7482
>  
> -  - reg: I2C slave address
> +  - reg: I2C slave addresses
> +    The ADV748x has up to twelve 256-byte maps that can be accessed via the
> +    main I2C ports. Each map has it own I2C address and acts as a standard
> +    slave device on the I2C bus. The main address is mandatory, others are
> +    optional and remain at default values if not specified.
>  
>  Optional Properties:
>  
> @@ -18,6 +22,11 @@ Optional Properties:
>  		     "intrq3". All interrupts are optional. The "intrq3" interrupt
>  		     is only available on the adv7481
>    - interrupts: Specify the interrupt lines for the ADV748x
> +  - reg-names : Names of maps with programmable addresses.
> +		It shall contain all maps needing a non-default address.
> +		Possible map names are:
> +		  "main", "dpll", "cp", "hdmi", "edid", "repeater",
> +		  "infoframe", "cbus", "cec", "sdp", "txa", "txb"
>  
>  The device node must contain one 'port' child node per device input and output
>  port, in accordance with the video interface bindings defined in
> @@ -47,7 +56,10 @@ Example:
>  
>  	video-receiver@70 {
>  		compatible = "adi,adv7482";
> -		reg = <0x70>;
> +		reg = <0x70 0x71 0x72 0x73 0x74 0x75
> +		       0x60 0x61 0x62 0x63 0x64 0x65>;
> +		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
> +			    "infoframe", "cbus", "cec", "sdp", "txa", "txb";
>  
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
