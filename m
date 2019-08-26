From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 00/19] Enhance CP110 COMPHY support
Date: Mon, 26 Aug 2019 17:21:55 +0530
Message-ID: <8c91e2e3-2a83-a6f0-c98a-d0dbfcddfee3@ti.com>
References: <20190731122126.3049-1-miquel.raynal@bootlin.com>
 <4e1c4d27-3676-5efa-1126-8149a8635eb5@ti.com> <20190824135414.5c490337@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190824135414.5c490337@xps13>
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
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Matt Pelland <mpelland@starry.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 24/08/19 5:24 PM, Miquel Raynal wrote:
> Hi Kishon,
> 
> + Matt Pelland
> 
> Kishon Vijay Abraham I <kishon@ti.com> wrote on Fri, 23 Aug 2019
> 08:46:14 +0530:
> 
>> On 31/07/19 5:51 PM, Miquel Raynal wrote:
>>> Armada CP110 have a COMPHY IP which supports configuring SERDES lanes
>>> in one mode, either:
>>> - SATA
>>> - USB3 host
>>> - PCIe (several width)
>>> - Ethernet (several modes)
>>>
>>> As of today, only a few Ethernet modes are supported and the code is
>>> embedded in the Linux driver. A more complete COMPHY driver that can
>>> be used by both Linux and U-Boot is embedded in the firmware and can
>>> be run through SMC calls.
>>>
>>> First the current COMPHY driver is updated to use SMC calls but
>>> fallbacks to the already existing functions if the firmware is not
>>> up-to-date. Then, more Ethernet modes are added (through SMC calls
>>> only). SATA, USB3H and PCIe modes are also supported one by one.
>>>
>>> There is one subtle difference with the PCIe functions: we must tell
>>> the firmware the number of lanes to configure (x1, x2 or x4). This
>>> parameter depends on the number of entries in the 'phys' property
>>> describing the PCIe PHY. We use the "submode" parameter of the generic
>>> PHY API to carry this value. The Armada-8k PCIe driver has been
>>> updated to follow this idea and this change has been merged already:
>>> http://patchwork.ozlabs.org/patch/1072763/  
>>
>> Some of the patches are not applying cleanly. Care to resend the series after
>> rebasing to phy -next?
> 
> Besides two conflicts that I can fix very easily about missing
> of_node_put() calls, you just merged in phy-next this patch:
> 
> phy: marvell: phy-mvebu-cp110-comphy: implement RXAUI support
> 
> Which totally conflicts with my series while I also add RXAUI support
> in patch 5. Please note that even the third version of my series
> was contributed before this patch.
> 
> There is one difference to note though: in the patch from Matt Peland,
> RXAUI support is embedded in the driver while I do SMC calls.
> 
> Anyway, would it be possible to change the order of application if
> you want both methods in the driver because it will be much easier
> to add Matt's patch on top of my series than the opposite. I can
> even do it myself if you wish.

I've resolved this. Can you review in phy -next if the changes looks okay?

Thanks
Kishon
