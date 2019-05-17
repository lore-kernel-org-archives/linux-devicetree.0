From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: Introduce the NXP LS1021A-TSN board
Date: Fri, 17 May 2019 21:26:02 +0800
Message-ID: <20190517132600.GD15856@dragon>
References: <20190506010800.2433-1-olteanv@gmail.com>
 <20190517010450.GT15856@dragon>
 <CA+h21hos=kHRGq089=3Js2pPnW71BBv02rqiMqPcZFe_bzBUHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+h21hos=kHRGq089=3Js2pPnW71BBv02rqiMqPcZFe_bzBUHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Oltean <olteanv@gmail.com>
Cc: leoyang.li@nxp.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2019 at 03:05:59PM +0300, Vladimir Oltean wrote:
> Hi Shawn,
> 
> Thanks for the feedback!
> Do you want a v2 now (will you merge it for 5.2) or should I send it
> after the merge window closes?

It's a 5.3 material.

Shawn

> The "nxp,sja1105t" compatible is not undocumented but belongs to
> drivers/net/dsa/sja1105/ which was recently merged into mainline via
> the netdev tree (hence it's not in your tree yet).
> The situation with "ad7924" is more funny. The compatible is indeed
> undocumented but belongs to drivers/iio/adc/ad7923.c. I don't know why
> it lacks an entry in Documentation/devicetree/bindings/iio/adc/.
> However I mistook the chip and it's not a Analog Devices AD7924 ADC
> with a SPI interface, but a TI ADS7924 ADC with an I2C interface. I
> can remove it from v2 since it does not have a Linux driver as far as
> I can tell.
> 
> -Vladimir
