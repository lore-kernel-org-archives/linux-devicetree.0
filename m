From: Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [net-next PATCH v2 03/10] net: netcp: ethss: make call to
 gbe_sgmii_config() conditional
Date: Thu, 29 Mar 2018 12:27:40 -0400
Message-ID: <24d6d476-1c04-c9be-e32f-4d024be649f2@ti.com>
References: <1522168309-12338-1-git-send-email-m-karicheri2@ti.com>
 <1522168309-12338-4-git-send-email-m-karicheri2@ti.com>
 <20180327171817.GO5862@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180327171817.GO5862@lunn.ch>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, malat@debian.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, w-kwok2@ti.com, robh+dt@kernel.org, ssantosh@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 03/27/2018 01:18 PM, Andrew Lunn wrote:
> On Tue, Mar 27, 2018 at 12:31:42PM -0400, Murali Karicheri wrote:
>> As a preparatory patch to add support for 2u cpsw hardware found on
>> K2G SoC, make call to gbe_sgmii_config() conditional. This is required
>> since 2u uses RGMII interface instead of SGMII and to allow for driver
>> re-use.
>>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> ---
>>  drivers/net/ethernet/ti/netcp_ethss.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
>> index 56dbc0b..1dea891 100644
>> --- a/drivers/net/ethernet/ti/netcp_ethss.c
>> +++ b/drivers/net/ethernet/ti/netcp_ethss.c
>> @@ -2271,7 +2271,8 @@ static int gbe_slave_open(struct gbe_intf *gbe_intf)
>>  
>>  	void (*hndlr)(struct net_device *) = gbe_adjust_link;
>>  
>> -	gbe_sgmii_config(priv, slave);
>> +	if ((priv->ss_version == GBE_SS_VERSION_14) || IS_SS_ID_NU(priv))
>> +		gbe_sgmii_config(priv, slave);
> 
> Or maybe:
> 
>    if (slave->phy_node == PHY_INTERFACE_MODE_SGMII)
>    	gbe_sgmii_config(priv, slave);
> 
> 	Andrew
> Actually, on specific cpsw hardware, driver supports specific interface. Driver also
uses link-interface DT property to configure this and link-interface can be without phy
as well. So essentially the above code looks good IMO.

I need to change this as 

if (IS_SS_ID_VER_14(priv) || IS_SS_ID_NU(priv))
    gbe_sgmii_config(priv, slave);

Based on the link-interface, driver selects the phy mode and pass it to of_phy_connect().

I will update the above in v3.
-- 
Murali Karicheri
Linux Kernel, Keystone
