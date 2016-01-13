From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH V2 2/6] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Wed, 13 Jan 2016 11:11:35 +0100
Message-ID: <20160113101135.GI3367@piout.net>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com>
 <1452590273-16421-3-git-send-email-ldewangan@nvidia.com>
 <56959E9A.3060903@samsung.com>
 <5696122A.6000509@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5696122A.6000509@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Chaitanya Bandi <bandik@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 13/01/2016 at 14:30:26 +0530, Laxman Dewangan wrote :
> In my 3rd patch, I tried to align it little more where is possible. But I
> feel that all these indenting is more over individual choice. Example, I
> added one more indent in below example to look better.
> 
> 
>         ret = max77620_reg_update(chip->dev, MAX77620_PWR_SLAVE,
> -               MAX77620_REG_ONOFFCNFG2, MAX77620_ONOFFCNFG2_WK_EN0,
> -               MAX77620_ONOFFCNFG2_WK_EN0);
> +                       MAX77620_REG_ONOFFCNFG2, MAX77620_ONOFFCNFG2_WK_EN0,
> +                       MAX77620_ONOFFCNFG2_WK_EN0);
> 
> 

You should probably use checkpatch.pl --strict, it requires that you
align on the open parenthesis.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
