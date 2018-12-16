From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/2] net: dsa: ksz9477: add I2C managed mode support
Date: Sun, 16 Dec 2018 09:15:42 +0100
Message-ID: <20181216081542.GB18287@lunn.ch>
References: <20181216075741.13827-1-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20181216075741.13827-1-sergio.paracuellos@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Woojung.Huh@microchip.com, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, driverdev-devel@linuxdriverproject.org, UNGLinuxDriver@microchip.com, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Sun, Dec 16, 2018 at 08:57:40AM +0100, Sergio Paracuellos wrote:
> +static int ksz_i2c_read_reg(struct i2c_client *client, u32 reg, u8 *val,
> +			    unsigned int len)
> +{
> +	struct i2c_adapter *adapter = client->adapter;
> +	struct i2c_msg msg[2];
> +	u8 txd[2];

Hi Sergio

I'm not sure that having the TX buffer on the stack is safe. If the
i2c bus master is using DMA, you then DMA from the stack, which some
architectures memory models do no allow. You have to use memory which
comes from an alloc function.

> +	int ret;
> +
> +	txd[0] = (u8)(reg >> 8);
> +	txd[1] = (u8)reg;
> +
> +	msg[0].addr = client->addr;
> +	msg[0].flags = 0;
> +	msg[0].len = 2;
> +	msg[0].buf = txd;
> +
> +	msg[1].addr = client->addr;
> +	msg[1].flags = I2C_M_RD;
> +	msg[1].len = len;
> +	msg[1].buf = val;

You potentially have the same issue with val.

    Andrew
