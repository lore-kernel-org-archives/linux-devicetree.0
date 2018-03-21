Return-Path: <SRS0=MhuY=GL=gmail.com=f.fainelli@kernel.org>
Subject: Re: [PATCH net-next RFC V1 2/5] net: phy: Move time stamping
 interface into the generic mdio layer.
References: <cover.1521656774.git.richardcochran@gmail.com>
 <b032dcdb34684e3831530da1bb198c764e61968b.1521656774.git.richardcochran@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e6c7b4e1-9449-58be-f670-4b6a8aa4b526@gmail.com>
Date: Wed, 21 Mar 2018 12:10:07 -0700
MIME-Version: 1.0
In-Reply-To: <b032dcdb34684e3831530da1bb198c764e61968b.1521656774.git.richardcochran@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On 03/21/2018 11:58 AM, Richard Cochran wrote:
> There are different ways of obtaining hardware time stamps on network
> packets.  The ingress and egress times can be measured in the MAC, in
> the PHY, or by a device listening on the MII bus.  Up until now, the
> kernel has support for MAC and PHY time stamping, but not for other
> MII bus devices.
> 
> This patch moves the PHY time stamping interface into the generic
> mdio device in order to support MII time stamping hardware.
> 
> Signed-off-by: Richard Cochran <richardcochran@gmail.com>
> ---
>  drivers/net/phy/dp83640.c | 29 ++++++++++++++++++++---------
>  drivers/net/phy/phy.c     |  4 ++--
>  include/linux/mdio.h      | 23 +++++++++++++++++++++++
>  include/linux/phy.h       | 23 -----------------------
>  net/core/ethtool.c        |  4 ++--
>  net/core/timestamping.c   |  8 ++++----
>  6 files changed, 51 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/net/phy/dp83640.c b/drivers/net/phy/dp83640.c
> index 654f42d00092..79aeb5eb471a 100644
> --- a/drivers/net/phy/dp83640.c
> +++ b/drivers/net/phy/dp83640.c
> @@ -215,6 +215,10 @@ static LIST_HEAD(phyter_clocks);
>  static DEFINE_MUTEX(phyter_clocks_lock);
>  
>  static void rx_timestamp_work(struct work_struct *work);
> +static  int dp83640_ts_info(struct mdio_device *m, struct ethtool_ts_info *i);
> +static  int dp83640_hwtstamp(struct mdio_device *m, struct ifreq *i);
> +static bool dp83640_rxtstamp(struct mdio_device *m, struct sk_buff *s, int t);
> +static void dp83640_txtstamp(struct mdio_device *m, struct sk_buff *s, int t);
>  
>  /* extended register access functions */
>  
> @@ -1162,6 +1166,12 @@ static int dp83640_probe(struct phy_device *phydev)
>  		list_add_tail(&dp83640->list, &clock->phylist);
>  
>  	dp83640_clock_put(clock);
> +
> +	phydev->mdio.ts_info = dp83640_ts_info;
> +	phydev->mdio.hwtstamp = dp83640_hwtstamp;
> +	phydev->mdio.rxtstamp = dp83640_rxtstamp;
> +	phydev->mdio.txtstamp = dp83640_txtstamp;

Why is this implemented a the mdio_device level and not at the
mdio_driver level? This looks like the wrong level at which this is done.
--
Florian
