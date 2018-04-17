From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 2/3] net: phy: Change the array size to 32 for
 device_ids
Date: Tue, 17 Apr 2018 11:18:49 -0700
Message-ID: <9e676fae-6c96-08a5-d27a-478d91416cb4@gmail.com>
References: <20180417090233.21548-1-vicentiu.galanopulo@nxp.com>
 <20180417090233.21548-3-vicentiu.galanopulo@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417090233.21548-3-vicentiu.galanopulo@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: vicentiu.galanopulo@nxp.com, andrew@lunn.ch, robh@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, davem@davemloft.net, marcel@holtmann.org, devicetree@vger.kernel.org
Cc: alexandru.marginean@nxp.com, madalin.bucur@nxp.com
List-Id: devicetree@vger.kernel.org

On 04/17/2018 02:02 AM, Vicentiu Galanopulo wrote:
> In the context of enabling the discovery of the PHYs
> which have the C45 MDIO address space in a non-standard
> address:  num_ids in get_phy_c45_ids, has the
> value 8 (ARRAY_SIZE(c45_ids->device_ids)), but the
> u32 *devs can store 32 devices in the bitfield.
> 
> If a device is stored in *devs, in bits 32 to 9
> (bit counting in lookup loop starts from 1), it will
> not be found.
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
