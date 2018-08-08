From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Subject: Re: [PATCH] media: dt: adv7604: Fix slave map documentation
Date: Wed, 8 Aug 2018 09:48:00 +0200
Message-ID: <505904fb-7bfc-c455-740e-b72a14731eb9@ysoft.com>
References: <20180807155452.797-1-kieran.bingham@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807155452.797-1-kieran.bingham@ideasonboard.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, mchehab@kernel.org, linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 7.8.2018 17:54, Kieran Bingham wrote:
Hi Kieran,
> The reg-names property in the documentation is missing an '='. Add it.
> 
> Fixes: 9feb786876c7 ("media: dt-bindings: media: adv7604: Extend
> bindings to allow specifying slave map addresses")
> 

"dt-bindings: media: " is preferred for the subject.

I think you should also add device tree maintainers to the recipients.

Best regards,
Michal

> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   Documentation/devicetree/bindings/media/i2c/adv7604.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> index dcf57e7c60eb..b3e688b77a38 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> @@ -66,7 +66,7 @@ Example:
>   		 * other maps will retain their default addresses.
>   		 */
>   		reg = <0x4c>, <0x66>;
> -		reg-names "main", "edid";
> +		reg-names = "main", "edid";
>   
>   		reset-gpios = <&ioexp 0 GPIO_ACTIVE_LOW>;
>   		hpd-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
> 
