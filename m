Return-Path: <robherring2@gmail.com>
Date: Thu, 3 Jan 2019 14:59:25 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: input: Update documentation for
 clps711x-keypad
Message-ID: <20190103205925.GA7342@bogus>
References: <20181222155520.8156-1-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181222155520.8156-1-shc_work@mail.ru>
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, Dec 22, 2018 at 06:55:20PM +0300, Alexander Shiyan wrote:
> Since the driver switched to using the syscon_regmap_lookup_by_phandle()
> function, we need to specify the phandle for the driver. This patch
> updates the driver binding documentation for these changes.

That's not a backwards compatible change. Is that okay for all users of 
this platform(s)? If so, say why.

> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  Documentation/devicetree/bindings/input/clps711x-keypad.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/clps711x-keypad.txt b/Documentation/devicetree/bindings/input/clps711x-keypad.txt
> index 3eed881..aebedc3 100644
> --- a/Documentation/devicetree/bindings/input/clps711x-keypad.txt
> +++ b/Documentation/devicetree/bindings/input/clps711x-keypad.txt
> @@ -6,6 +6,7 @@ Required Properties:
>  - poll-interval: Poll interval time in milliseconds.
>  - linux,keymap:  The definition can be found at
>                   bindings/input/matrix-keymap.txt.
> +- syscon:        Phandle that points to the CPU syscon1 node.

What does this provide? If the keypad registers are a sub-block of the 
syscon1, then you should make this node a child node.

>  
>  Optional Properties:
>  - autorepeat:    Enable autorepeat feature.
> @@ -17,6 +18,7 @@ Example:
>  		poll-interval = <120>;
>  		row-gpios = <&porta 0 0>,
>  			    <&porta 1 0>;
> +		syscon = <&syscon1>;
>  
>  		linux,keymap = <
>  			MATRIX_KEY(0, 0, KEY_UP)
> -- 
> 2.10.2
> 
