From: Bastian Stender <bst@pengutronix.de>
Subject: Re: [PATCH v13 3/6] fpga manager: Add altera-ps-spi driver for Altera
 FPGAs
Date: Wed, 23 Aug 2017 15:54:12 +0200
Message-ID: <e63152d3-ef91-55d2-4af3-d6e27dab7168@pengutronix.de>
References: <03e591707dc72f4c2b5e63a1272060956294ea51.1497047816.git.stillcompiling@gmail.com>
 <aadca281de183aa8b0471dc3e6c850012c775a9c.1497047816.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <aadca281de183aa8b0471dc3e6c850012c775a9c.1497047816.git.stillcompiling@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Clayton <stillcompiling@gmail.com>, Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, Anatolij Gustschin <agust@denx.de>, Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-fpga@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06/10/2017 12:39 AM, Joshua Clayton wrote:
> altera-ps-spi loads FPGA firmware over SPI, using the "passive serial"
> interface on Altera Arria 10, Cyclone V or Stratix V FPGAs.
> 
> This is one of the simpler ways to set up an FPGA at runtime.
> The signal interface is close to unidirectional SPI with lsb first.
> 
> Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>

Tested-by: Bastian Stender <bst@pengutronix.de>

I tested the whole series with an Altera Arria 10 and it's working as 
expected. Thanks again!

Bastian

-- 
Pengutronix e.K.
Industrial Linux Solutions
http://www.pengutronix.de/
Peiner Str. 6-8, 31137 Hildesheim, Germany
Amtsgericht Hildesheim, HRA 2686
