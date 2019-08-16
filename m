From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v5 00/13] net: phy: adin: add support for Analog
 Devices PHYs
Date: Fri, 16 Aug 2019 11:57:21 -0700 (PDT)
Message-ID: <20190816.115721.2066524764941816948.davem@davemloft.net>
References: <20190816131011.23264-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816131011.23264-1-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandru.ardelean@analog.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Date: Fri, 16 Aug 2019 16:09:58 +0300

> This changeset adds support for Analog Devices Industrial Ethernet PHYs.
> Particularly the PHYs this driver adds support for:
>  * ADIN1200 - Robust, Industrial, Low Power 10/100 Ethernet PHY
>  * ADIN1300 - Robust, Industrial, Low Latency 10/100/1000 Gigabit
>    Ethernet PHY
> 
> The 2 chips are register compatible with one another. The main
> difference being that ADIN1200 doesn't operate in gigabit mode.
> 
> The chips can be operated by the Generic PHY driver as well via the
> standard IEEE PHY registers (0x0000 - 0x000F) which are supported by the
> kernel as well. This assumes that configuration of the PHY has been done
> completely in HW, according to spec, i.e. no extra SW configuration
> required.
> 
> This changeset also implements the ability to configure the chips via SW
> registers.
> 
> Datasheets:
>   https://www.analog.com/media/en/technical-documentation/data-sheets/ADIN1300.pdf
>   https://www.analog.com/media/en/technical-documentation/data-sheets/ADIN1200.pdf
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Series applied, thank you.
