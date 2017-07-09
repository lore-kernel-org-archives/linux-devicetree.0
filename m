From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 2/2] dt: Add bindings for IDT VersaClock 5P49V5925
Date: Sun, 9 Jul 2017 15:31:38 +0200
Message-ID: <57a23b45-9514-00c0-aa92-00a54d68ad2e@gmail.com>
References: <1499392623-9011-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1499392677-9100-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499392677-9100-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/07/2017 03:57 AM, Vladimir Barinov wrote:
> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> 
> IDT VersaClock 5 5P49V5925 has 4 clock outputs

In 1/2 you said it has 4 FODs and 5 outputs (and it does have 5 outputs,
4 from FODs and 1 I2C_OUTB).

>, 4 fractional dividers.
> Input clock source can be taken only from external reference clock.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

You might want to rebase this on top of and retest against [1], there
are 8 patches in total fixing some stuff and adding VC6 support.

[1] https://patchwork.kernel.org/patch/9831797/

> ---
>  Documentation/devicetree/bindings/clock/idt,versaclock5.txt | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> index 53d7e50..a1ad9e0 100644
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> @@ -6,19 +6,21 @@ from 3 to 12 output clocks.
>  ==I2C device node==
>  
>  Required properties:
> -- compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5933" ,
> -		"idt,5p49v5935".
> +- compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5925" ,
> +		"idt,5p49v5933", "idt,5p49v5935".
>  - reg:		i2c device address, shall be 0x68 or 0x6a.
>  - #clock-cells:	from common clock binding; shall be set to 1.
>  - clocks:	from common clock binding; list of parent clock handles,
> -		- 5p49v5923: (required) either or both of XTAL or CLKIN
> +		- 5p49v5923 and
> +		- 5p49v5925: (required) either or both of XTAL or CLKIN
>  					reference clock.
>  		- 5p49v5933 and
>  		- 5p49v5935: (optional) property not present (internal
>  					Xtal used) or CLKIN reference
>  					clock.
>  - clock-names:	from common clock binding; clock input names, can be
> -		- 5p49v5923: (required) either or both of "xin", "clkin".
> +		- 5p49v5923 and
> +		- 5p49v5925: (required) either or both of "xin", "clkin".
>  		- 5p49v5933 and
>  		- 5p49v5935: (optional) property not present or "clkin".
>  
> @@ -37,6 +39,7 @@ clock specifier, the following mapping applies:
>  	1 -- OUT1
>  	2 -- OUT4
>  
> +5P49V5925 and
>  5P49V5935:
>  	0 -- OUT0_SEL_I2CB
>  	1 -- OUT1
> 


-- 
Best regards,
Marek Vasut
