From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v4 00/11] mscc: ocelot: add support for SerDes
 muxing configuration
Date: Fri, 05 Oct 2018 14:39:24 -0700 (PDT)
Message-ID: <20181005.143924.1849227852256176976.davem@davemloft.net>
References: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: quentin.schulz@bootlin.com
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

From: Quentin Schulz <quentin.schulz@bootlin.com>
Date: Thu,  4 Oct 2018 14:21:57 +0200

> The Ocelot switch has currently an hardcoded SerDes muxing that suits only
> a particular use case. Any other board setup will fail to work.
> 
> To prepare for upcoming boards' support that do not have the same muxing,
> create a PHY driver that will handle all possible cases.
> 
> A SerDes can work in SGMII, QSGMII or PCIe and is also muxed to use a
> given port depending on the selected mode or board design.
> 
> The SerDes configuration is in the middle of an address space (HSIO) that
> is used to configure some parts in the MAC controller driver, that is why
> we need to use a syscon so that we can write to the same address space from
> different drivers safely using regmap.
> 
> This breaks backward compatibility but it's fine because there's only one
> board at the moment that is using what's modified in this patch series.
> This will break git bisect.
> 
> Even though this patch series is about SerDes __muxing__ configuration, the
> DT node is named serdes for the simple reason that I couldn't find any
> mention to SerDes anywhere else from the address space handled by this
> driver.

Series applied to net-next, thanks.
