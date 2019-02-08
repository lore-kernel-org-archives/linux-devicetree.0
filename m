From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH net-next v2 0/6] Add comphy support for Armada 38x
Date: Fri, 8 Feb 2019 14:52:26 +0530
Message-ID: <295924f0-1007-4b39-189b-1b21e4bf1b86@ti.com>
References: <20190207161825.ueinmyf6ygjiqzzy@shell.armlinux.org.uk>
 <20190207.181049.1229639710283404215.davem@davemloft.net>
 <20190208085821.7556a18d@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190208085821.7556a18d@windsurf>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, David Miller <davem@davemloft.net>
Cc: linux@armlinux.org.uk, andrew@lunn.ch, gregory.clement@bootlin.com, jason@lakedaemon.net, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, netdev@vger.kernel.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 08/02/19 1:28 PM, Thomas Petazzoni wrote:
> Hello David,
> 
> On Thu, 07 Feb 2019 18:10:49 -0800 (PST)
> David Miller <davem@davemloft.net> wrote:
> 
>> From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
>> Date: Thu, 7 Feb 2019 16:18:25 +0000
>>
>>> This series adds support for the comphy for Armada 38x, which allows
>>> these SoCs to use 2500BASE-X mode with appropriate SFP modules.
>>>
>>> Tested on SolidRun Clearfog after updating for the 5.0 merge window
>>> changes.  
>>
>> Series applied, thanks Russell.
> 
> This series contained:
> 
>  - Device Tree bindings that had not been ACKed by the DT bindings
>    maintainers, one of which should have been merged through the
>    drivers/phy maintainer tree.
> 
>  - A brand new drivers/phy driver that had not been ACKed by the
>    drivers/phy maintainer.

The PHY driver looks good to me. But I think it might still be better to take
it via PHY tree since there are other Marvell drivers that are getting merged
and will result in conflicts in Kconfig and Makefile.

Thanks
Kishon
