From: David Miller <davem@davemloft.net>
Subject: Re: [net-next RFC/PATCH] net: nixge: Make mdio child node optional
Date: Mon, 04 Feb 2019 09:14:04 -0800 (PST)
Message-ID: <20190204.091404.1919705205267977389.davem@davemloft.net>
References: <20190202025048.14772-1-mdf@kernel.org>
        <20190204145854.GD22111@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204145854.GD22111@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch
Cc: mdf@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, alex.williams@ni.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>
Date: Mon, 4 Feb 2019 15:58:54 +0100

> On Fri, Feb 01, 2019 at 06:50:48PM -0800, Moritz Fischer wrote:
>> Make MDIO child optional and only instantiate the
>> MDIO bus if the child is actually present.
>> 
>> There are currently no (in-tree) users of this
>> binding; all (out-of-tree) users use overlays that
>> get shipped together with the FPGA images that contain
>> the IP.
>> 
>> This will significantly increase maintainabilty
>> of future revisions of this IP.
>> 
>> Signed-off-by: Moritz Fischer <mdf@kernel.org>
>> Cc: Andrew Lunn <andrew@lunn.ch>
>> Cc: Rob Herring <robh+dt@kernel.org>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Moritz, please repost without the RFC tag and with Andrew's tag added.

Thanks.
