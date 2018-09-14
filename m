From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 3/7] net: phy: mscc: split config_init in two
 functions for VSC8584
Date: Fri, 14 Sep 2018 10:57:08 -0700
Message-ID: <bc31175f-52eb-cb7d-669e-192aec79ac5c@gmail.com>
References: <cover.b921b010b6d6bde1c11e69551ae38f3b2818645b.1536916714.git-series.quentin.schulz@bootlin.com>
 <5daa7f3e467b218410238ef0fb97f01779f8f49f.1536916714.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5daa7f3e467b218410238ef0fb97f01779f8f49f.1536916714.git-series.quentin.schulz@bootlin.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>, alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, andrew@lunn.ch
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, antoine.tenart@bootlin.com
List-Id: devicetree@vger.kernel.org

On 09/14/2018 02:44 AM, Quentin Schulz wrote:
> Part of the config init is common between the VSC8584 and the VSC8574,
> so to prepare the upcoming support for VSC8574, separate config_init
> PHY-specific code to config_pre_init function which is set in the probe
> function of the PHY and used in config_init.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  drivers/net/phy/mscc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/mscc.c b/drivers/net/phy/mscc.c
> index b450489..69cc3cf 100644
> --- a/drivers/net/phy/mscc.c
> +++ b/drivers/net/phy/mscc.c
> @@ -355,6 +355,7 @@ struct vsc8531_private {
>  	u64 *stats;
>  	int nstats;
>  	bool pkg_init;
> +	int (*config_pre_init)(struct mii_bus *bus, int phy);

Is not this overkill given that you have a reference to the phy_device,
you could check for the for phy_id to know which exact type you have and
call the appropriate pre_init function?

unsigned int phy might be more appropriate.
-- 
Florian
