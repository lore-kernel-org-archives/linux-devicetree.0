From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: How to handle software controlled bus switches in the device tree?
Date: Wed, 06 Apr 2011 09:08:12 -0700
Message-ID: <4D9C8FEC.8020602@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

I have some boards that have I2C controlled switches that are used to 
control the connection of Ethernet PHY devices to their MDIO busses.

There are two MDIO busses, and the PHY can be attached to one or the 
other based on the setting of the switch.

I can describe the presence of the switch on the I2C bus, but boot 
software or an operating system needs to set the switch to realize a 
PHY/MDIO bus topology.

Currently we are hard-coding the switch initialization in the bootloader 
and then assuming a fixed PHY topology based on that initialization.

It would be nice to somehow be able to specify the configuration in the 
device tree, but there are some dependencies.

The I2C bus and switch driver would have to be initialized to set the 
switches to the proper values before the MDIO/PHY drivers were started.

Any ideas about how to approach this problem?

Thanks in advance,
David Daney
