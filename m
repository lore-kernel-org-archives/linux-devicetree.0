From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v3 05/11] net: mscc: ocelot: simplify register
 access for PLL5 configuration
Date: Fri, 14 Sep 2018 19:26:41 -0700
Message-ID: <c44a927b-013d-caff-0689-24d361ca4406@gmail.com>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
 <b09eb1026a2870c6cc882997ac69e25fdf7a96d8.1536912834.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b09eb1026a2870c6cc882997ac69e25fdf7a96d8.1536912834.git-series.quentin.schulz@bootlin.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>, alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org



On 09/14/18 01:16, Quentin Schulz wrote:
> Since HSIO address space can be accessed by different drivers, let's
> simplify the register address definitions so that it can be easily used
> by all drivers and put the register address definition in the
> include/soc/mscc/ocelot_hsio.h header file.
> 
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
