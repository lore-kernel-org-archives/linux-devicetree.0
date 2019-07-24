From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] extcon: fsa9480: Support the FSA880 variant
Date: Wed, 24 Jul 2019 19:12:01 +0900
Message-ID: <2e832c87-71ea-af32-211d-a301cf58cb04@samsung.com>
References: <CGME20190723174344epcas3p4dc935720d75f93a5ca0181662bc8036f@epcas3p4.samsung.com>
        <20190723174301.31278-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723174301.31278-1-linus.walleij@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mike Lockwood <lockwood@google.com>, devicetree@vger.kernel.org, "cpgs (cpgs@samsung.com)" <cpgs@samsung.com>
List-Id: devicetree@vger.kernel.org

On 19. 7. 24. 오전 2:43, Linus Walleij wrote:
> The older compatible variant of this chip is called FSA880
> and works the same way, if we need some quirks in the future,
> it is good to let it have its own compatible string.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt | 4 +++-
>  drivers/extcon/extcon-fsa9480.c                             | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt b/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
> index d592c21245f2..624bd76f468e 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
> @@ -5,7 +5,9 @@ controlled using I2C and enables USB data, stereo and mono audio, video,
>  microphone, and UART data to use a common connector port.
>  
>  Required properties:
> - - compatible : Must be "fcs,fsa9480"
> + - compatible : Must be one of
> +   "fcs,fsa9480"
> +   "fcs,fsa880"
>   - reg : Specifies i2c slave address. Must be 0x25.
>   - interrupts : Should contain one entry specifying interrupt signal of
>     interrupt parent to which interrupt pin of the chip is connected.
> diff --git a/drivers/extcon/extcon-fsa9480.c b/drivers/extcon/extcon-fsa9480.c
> index 350fb34abfa0..8405512f5199 100644
> --- a/drivers/extcon/extcon-fsa9480.c
> +++ b/drivers/extcon/extcon-fsa9480.c
> @@ -363,6 +363,7 @@ MODULE_DEVICE_TABLE(i2c, fsa9480_id);
>  
>  static const struct of_device_id fsa9480_of_match[] = {
>  	{ .compatible = "fcs,fsa9480", },
> +	{ .compatible = "fcs,fsa880", },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, fsa9480_of_match);
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
