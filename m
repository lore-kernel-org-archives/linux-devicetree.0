From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 4/4] net: dsa: vsc73xx: Assert reset if iCPU is enabled
Date: Thu, 4 Jul 2019 13:27:18 -0700
Message-ID: <bee690ca-64c2-c974-1658-92b986bb1b04@gmail.com>
References: <20190703171924.31801-1-paweldembicki@gmail.com>
 <20190703171924.31801-5-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190703171924.31801-5-paweldembicki@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linus.walleij@linaro.org, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 7/3/2019 10:19 AM, Pawel Dembicki wrote:
> Driver allow to use devices with disabled iCPU only.
> 
> Some devices have pre-initialised iCPU by bootloader.
> That state make switch unmanaged. This patch force reset
> if device is in unmanaged state. In the result chip lost
> internal firmware from RAM and it can be managed.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---

[snip]

> @@ -1158,6 +1143,19 @@ int vsc73xx_probe(struct vsc73xx *vsc)
>  		msleep(20);
>  
>  	ret = vsc73xx_detect(vsc);
> +	if (ret == -EAGAIN) {
> +		dev_err(vsc->dev,
> +			"Chip seams to be out of control. Assert reset and try again.\n");
> +		gpiod_set_value_cansleep(vsc->reset, 1);

s/seams/seems/

With that fixed:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
