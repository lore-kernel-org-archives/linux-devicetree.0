From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Device Tree questions WRT MIPS/Octeon SOCs.
Date: Thu, 14 Oct 2010 17:17:23 -0700
Message-ID: <4CB79D93.6090500@caviumnetworks.com>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Prasun Kapoor <prasun.kapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, linux-mips <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant,

I have been following your MIPS device tree patches and have begun to 
experiment with them.  If you could give some feedback on my ideas, I 
would appreciate it.

Background:

The Octeon is a MIPS64 based SOC family.  The various members of the 
Octeon family have several Ethernet ports of different types, one or 
more MDIO and I2C busses and other miscellaneous devices.  People put 
the SOCs on boards that have a wide variety of PHYs, I2C devices all 
connected in different ways.

Currently we have ad hoc code throughout the drivers and platform 
initialization code that specify how everything is connected.

Plan:

I want to convert this to use the device tree and related functions.

Since none of the existing hardware has an existing device tree I plan 
on taking a two pronged approach.

Modify platform drivers to get configuration information from the device 
tree.  Then:

1) Load and use a dtb blob as specified on the kernel command line.

2) If no command line dtb specified, use a default dtb embedded in the 
kernel image and then edit or patch it using of_attach_node(), 
of_detach_node(), prom_remove_property(), and prom_add_property() based 
on some of the the same ad hoc code we currently use.

Q: As a very high level plan does this make any sense?

Would you recommend something else?

Thanks in advance,
David Daney
