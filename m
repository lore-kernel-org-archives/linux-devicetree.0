From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: specifying MAC address location in device tree
Date: Mon, 09 Feb 2009 08:44:37 -1000
Message-ID: <49907995.3050508@firmworks.com>
References: <499042EC.6050103@ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <499042EC.6050103-JJi787mZWgc@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Renaud Barbier <renaud.barbier-JJi787mZWgc@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Assuming that a MAC address ( or list of MAC addresses or any board 
> data)  is located in an I2C (or flash),
> how would you specify the data location in the device tree?
>
> For an I2C, should I specify the specific device containing the data 
> under the I2C node?
>

The standard way to communicate MAC address information to the OS is via 
properties in the node for the network interface.  "local-mac-address" 
is the MAC address that was factory-assigned to the interface and 
"mac-address" is the actual address that is being used for the device 
(in case the factory-assigned address was overridden by some policy 
choice).  The value is the mac address itself (6 bytes), not the 
"address" of the mac address.

The reason I put "address" in quotes is because the devices that are 
used to store MAC addresses are often not "addressable" in any 
convenient sense.  You often have to run some device-specific driver 
code to extract the information.  It's the firmware's responsibility to 
do that, extracting the information and creating the properties 
described above.

Strictly speaking, a MAC address is an attribute of a network interface; 
the association of a MAC address with a mainboard is meaningless, or at 
least there is no standard that I know of that assigns a specific 
interpretation.  That said, it's fairly common to store a MAC address on 
a mainboard EEPROM as a surrogate for a nonexistent EEPROM that is 
supposed to be attached to the network interface hardware.  In that 
case, the mainboard firmware is supposed to know that and do whatever is 
necessary to move the data into the device node for the corresponding.
