From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: RFD: OF device tree vs. PHY flags.
Date: Fri, 15 Oct 2010 21:39:49 -0600
Message-ID: <20101016033949.GA21170@angua.secretlab.ca>
References: <4CB89AD8.7020200@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4CB89AD8.7020200@caviumnetworks.com>
Sender: netdev-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: devicetree-discuss@lists.ozlabs.org, Netdev <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Fri, Oct 15, 2010 at 11:18:00AM -0700, David Daney wrote:
> I am in the process of planning a conversion of Octeon SOC platform
> code to use the OF device tree in the Linux kernel.
> 
> One issue that I have encountered, is that for some boards, we need
> to pass a non-zero flags argument to the phy_attach_direct() method.
> The value of the flags is board dependent, so it would make some
> sense to encode its value in the device tree itself.  The flags I am
> interested in control the configuration of clocking modes and status
> LED connections.
> 
> I would suggest the following:
> 
> o Add a new property to "ethernet-phy" dts bindings called
> "linux,flags".  It would contain a comma separated string of flag
> names.  Something like "led-mode1,clock-mode2".  The semantics of
> the flag names would be interpreted by the PHY driver...

It does make sense to encode board-specific properties into the device
tree.  However, it is a very bad idea to do it in this form because it
encodes Linux-specific implementation details into the hardware
description.  Instead, figure out what needs to be described about the
*hardware* and write a binding that encodes that information.  Let the
driver take care of translating the hardware description into the set
of flags that it needs to use.

Otherwise you'll end up in the situation where the phylib
implementation changes and the data in the device tree will no longer
make sense.  That is the path of pain.

> o Add a new function pointer to struct phy_driver: u32
> (*of_parse_flags)(struct phy_device *phydev).  This would parse and
> return the flags value for the "linux,flags" property from the
> device_node associated with the particular PHY device in question.

I'm not clear why a new hook is needed.  What prevents the phy driver
from parsing the device tree data at .probe() time?  The caller of
phy_attach_direct() would then never need to be exposed to the parsing
of the tree data.

> o Modify of_phy_connect() to do something like the following:
> 
> .
> .
> .
> 	if (phy->driver && phy->driver->of_parse_flags)
> 		flags |= phy->driver->of_parse_flags(phy);
> .
> .
> .
> 
> o Perhaps add some helper functions to of_mdio.c to assist in
> parsing the "linux,flags" properties string.
> 
> o Any extra code in the PHY drivers and struct phy_driver would be
> protected by #ifdef CONFIG_OF

Yes.

