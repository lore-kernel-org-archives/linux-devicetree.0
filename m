From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v3 04/11] net: mscc: ocelot: move the HSIO header
 to include/soc
Date: Fri, 14 Sep 2018 19:24:49 -0700
Message-ID: <17213365-dac5-1dc4-b5a6-96560455c426@gmail.com>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
 <45bc0a8bd6a1dfc35adcedc3581124879fdb5a07.1536912834.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <45bc0a8bd6a1dfc35adcedc3581124879fdb5a07.1536912834.git-series.quentin.schulz@bootlin.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>, alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org



On 09/14/18 01:16, Quentin Schulz wrote:
> Since HSIO address space can be used by different drivers (PLL, SerDes
> muxing, temperature sensor), let's move it somewhere it can be included
> by all drivers.
> 
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Nothing wrong with the patch, you likely would have wanted to use git
format-patch -M such that the diff would have been showing that the file
was renamed.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
