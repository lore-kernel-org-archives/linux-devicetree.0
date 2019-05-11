From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 5/5] net: phy: dp83867: Use unsigned variables to store
 unsigned properties
Date: Sat, 11 May 2019 12:41:31 +0200
Message-ID: <49c6afc4-6c5b-51c9-74ab-9a6e8c2460a5@gmail.com>
References: <20190510214550.18657-1-tpiepho@impinj.com>
 <20190510214550.18657-5-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510214550.18657-5-tpiepho@impinj.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

On 10.05.2019 23:46, Trent Piepho wrote:
> The variables used to store u32 DT properties were signed ints.  This
> doesn't work properly if the value of the property were to overflow.
> Use unsigned variables so this doesn't happen.
> 
In patch 3 you added a check for DT properties being out of range.
I think this would be good also for the three properties here.
The delay values are only 4 bits wide, so you might also consider
to switch to u8 or u16.

Please note that net-next is closed currently. Please resubmit the
patches once it's open again, and please annotate them properly
with net-next.

> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  drivers/net/phy/dp83867.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> index a46cc9427fb3..edd9e27425e8 100644
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c
> @@ -82,9 +82,9 @@ enum {
>  };
>  
>  struct dp83867_private {
> -	int rx_id_delay;
> -	int tx_id_delay;
> -	int fifo_depth;
> +	u32 rx_id_delay;
> +	u32 tx_id_delay;
> +	u32 fifo_depth;
>  	int io_impedance;
>  	int port_mirroring;
>  	bool rxctrl_strap_quirk;
> 
