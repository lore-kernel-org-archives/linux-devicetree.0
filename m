From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [net-next PATCH v2 03/10] net: netcp: ethss: make call to
 gbe_sgmii_config() conditional
Date: Tue, 27 Mar 2018 19:18:17 +0200
Message-ID: <20180327171817.GO5862@lunn.ch>
References: <1522168309-12338-1-git-send-email-m-karicheri2@ti.com>
 <1522168309-12338-4-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1522168309-12338-4-git-send-email-m-karicheri2@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, malat@debian.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, w-kwok2@ti.com, robh+dt@kernel.org, ssantosh@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 27, 2018 at 12:31:42PM -0400, Murali Karicheri wrote:
> As a preparatory patch to add support for 2u cpsw hardware found on
> K2G SoC, make call to gbe_sgmii_config() conditional. This is required
> since 2u uses RGMII interface instead of SGMII and to allow for driver
> re-use.
> 
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> ---
>  drivers/net/ethernet/ti/netcp_ethss.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
> index 56dbc0b..1dea891 100644
> --- a/drivers/net/ethernet/ti/netcp_ethss.c
> +++ b/drivers/net/ethernet/ti/netcp_ethss.c
> @@ -2271,7 +2271,8 @@ static int gbe_slave_open(struct gbe_intf *gbe_intf)
>  
>  	void (*hndlr)(struct net_device *) = gbe_adjust_link;
>  
> -	gbe_sgmii_config(priv, slave);
> +	if ((priv->ss_version == GBE_SS_VERSION_14) || IS_SS_ID_NU(priv))
> +		gbe_sgmii_config(priv, slave);

Or maybe:

   if (slave->phy_node == PHY_INTERFACE_MODE_SGMII)
   	gbe_sgmii_config(priv, slave);

	Andrew
