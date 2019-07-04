From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 2/4] net: dsa: vsc73xx: Split vsc73xx driver
Date: Thu, 4 Jul 2019 13:24:12 -0700
Message-ID: <3f4eb7c2-512b-777e-39c4-5fb18f9e4226@gmail.com>
References: <20190703171924.31801-1-paweldembicki@gmail.com>
 <20190703171924.31801-3-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703171924.31801-3-paweldembicki@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linus.walleij@linaro.org, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 7/3/2019 10:19 AM, Pawel Dembicki wrote:
> This driver (currently) only takes control of the switch chip over
> SPI and configures it to route packages around when connected to a
> CPU port. But Vitesse chip support also parallel interface.
> 
> This patch split driver into two parts: core and spi. It is required
> for add support to another managing interface.
> 
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
