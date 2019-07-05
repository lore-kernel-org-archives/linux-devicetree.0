From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 3/4] net: dsa: vsc73xx: add support for parallel mode
Date: Fri, 5 Jul 2019 08:37:12 -0700
Message-ID: <f40b8651-05b5-3e1d-6f6a-2d9f5cf2d2d3@gmail.com>
References: <20190704222907.2888-1-paweldembicki@gmail.com>
 <20190704222907.2888-4-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190704222907.2888-4-paweldembicki@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linus.walleij@linaro.org, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 7/4/2019 3:29 PM, Pawel Dembicki wrote:
> This patch add platform part of vsc73xx driver.
> It allows to use chip connected to a parallel memory bus and work in
> memory-mapped I/O mode. (aka PI bus in chip manual)
> 
> By default device is working in big endian mode.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
