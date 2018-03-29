From: Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [net-next PATCH v2 08/10] net: netcp: ethss: use
 of_get_phy_mode() to support different RGMII modes
Date: Thu, 29 Mar 2018 16:03:27 -0400
Message-ID: <1b12754d-38b5-d03a-3ba8-90135ad3ead0@ti.com>
References: <1522168309-12338-1-git-send-email-m-karicheri2@ti.com>
 <1522168309-12338-9-git-send-email-m-karicheri2@ti.com>
 <20180327173509.GQ5862@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180327173509.GQ5862@lunn.ch>
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

On 03/27/2018 01:35 PM, Andrew Lunn wrote:
>> +	} else if (slave->link_interface == RGMII_LINK_MAC_PHY) {
>> +		has_phy = true;
>> +		phy_mode = of_get_phy_mode(slave->node);
>> +		/* if phy-mode is not present, default to
>> +		 * PHY_INTERFACE_MODE_RGMII
>> +		 */
>> +		if (phy_mode < 0)
>> +			phy_mode = PHY_INTERFACE_MODE_RGMII;
> 
> Can only do RGMII? Maybe add a call here to
> phy_interface_mode_is_rgmii() and return -EINVAL if DT contains
> something which is not RGMII?
> 
Ok. Make sense.

> 	  Andrew
> 


-- 
Murali Karicheri
Linux Kernel, Keystone
