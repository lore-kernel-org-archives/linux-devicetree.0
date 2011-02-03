From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH TIP 03/14] x86/dtb: Add a device tree for CE4100
Date: Thu, 03 Feb 2011 11:32:45 -1000
Message-ID: <4D4B1EFD.4060305@firmworks.com>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>	<1295843342-1122-4-git-send-email-bigeasy@linutronix.de>	<20110127050027.GB23443@yookeroo>	<20110127091147.GA9770@www.tglx.de>
	<20110203205928.GH6180@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110203205928.GH6180-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2/3/2011 10:59 AM, Grant Likely wrote:
> On Thu, Jan 27, 2011 at 02:41:47PM +0530, Sebastian Andrzej Siewior wrote:
>> * David Gibson | 2011-01-27 15:00:27 [+1000]:
>>>> +					>;
>>>> +
>>>> +				i2c-controller@15a00,0,0 {
>>>
>>> Uh.. that unit address does not look right.  The encoding of PCI
>>> 3-cell addresses into a unit address string is not simply comma
>>> separated cells.  I forget the details, so you'll need to check the OF
>>> PCI binding.
>>
>> Grant wrote [0]:
>> |You'll also note that I added ',0,0' to the end of the address.
>> |That's because the node address reflects the parent bus address format
>> |which uses 3 cells in this case.
>
> It is quite possible I was mistaken on this point.  The PCI binding is
> not my area of strength.


In real OF, the unit address of a PCI device is the first entry in the 
reg property, which is the config space address.  For the config space 
address, only the most significant of the three cells is significant; 
the other two must be 0.

The numerical representation of that cell in binary is 
0000.0000.0000.0000.dddd.dfff.0000.0000, where d is the device number on 
its bus segment and fff is the function number.

The text representation is "D,F" , where D is the hexadecimal ASCII 
representation of the binary number ddddd and F is the hexadecimal ASCII 
representation of the binary number fff .  So "show-devs" will display 
names like  "/pci/ethernet@12,e" - device number 0x12, function number 
0xe.

(In the general case, there are more fields in both the numerical and 
text representations, but the unit address usage is restricted to just 
the device and function numbers.  Bus numbers are handled by the 
hierarchy of PCI-to-PCI bridges.)

In real OF, there are "encode-unit" and "decode-unit" methods in the 
parent (PCI bus) node to convert between the numerical and text 
representations.

I don't know how this plays out in the flattened DT world, but the above 
is a summary of what the PCI bus binding stipulates.

>
> g.
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
