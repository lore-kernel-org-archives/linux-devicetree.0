From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH 24/32] pci: PCIe driver for Marvell Armada 370/XP systems
Date: Fri, 08 Mar 2013 09:43:11 -1000
Message-ID: <513A3F4F.2090501@firmworks.com>
References: <20130306121118.GA17079@avionic-0098.mockup.avionic-design.de>
 <20130306180946.GA2433@obsidianresearch.com>
 <20130307080832.GD3451@avionic-0098.mockup.avionic-design.de>
 <20130307174955.GC20840@obsidianresearch.com>
 <20130307194830.GA1811@avionic-0098.mockup.avionic-design.de>
 <20130307200235.GB20695@obsidianresearch.com>
 <20130307204726.GB1811@avionic-0098.mockup.avionic-design.de>
 <51392B4D.9040404@gmail.com>
 <20130308071443.GA5772@avionic-0098.mockup.avionic-design.de>
 <20130308165228.GB4094@obsidianresearch.com>
 <20130308191227.GA6551@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130308191227.GA6551-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 3/8/2013 9:12 AM, Thierry Reding wrote:
> On Fri, Mar 08, 2013 at 09:52:28AM -0700, Jason Gunthorpe wrote:
>> On Fri, Mar 08, 2013 at 08:14:44AM +0100, Thierry Reding wrote:
>>> On Thu, Mar 07, 2013 at 06:05:33PM -0600, Rob Herring wrote:
>>>> On 03/07/2013 02:47 PM, Thierry Reding wrote:
>>> [...]
>>>>> In a nutshell (since some of the context isn't quoted anymore) the
>>>>> problem that we're trying to solve is that some of the embedded SoCs
>>>>> require per-root-port registers for configuration. The PCI DT
>>>>> specification doesn't make any provisions for this. A few alternatives
>>>>> have been discussed so far:
>>>>
>>>> I'm not sure I follow. This is different than the host controller
>>>> registers? Why would this not just be multiple entries in the reg property?
>>>
>>> Well the register regions are per root-port. On Tegra20 there's 2 of
>>> them, Tegra30 has 3 and if I understand correctly Marvell can have up to
>>> 10 (!). Adding all of them to the reg property of the host controller
>>> could work but it needs some way to match the reg entry to the root port
>>> similar to option 1 below.
>>
>> Thomas just posted an implementation like this, please see:
>>
>> http://www.spinics.net/lists/arm-kernel/msg228749.html

The example in that posting looks messed up to me.

1) It has "reg = <0x0800 0 0 0 0>", but 0x0800 0 0  is not a valid
address in the address space defined by its parent - because the form of
the parent's ranges property indicates that it's a PCI-style address
form.  0x0800 0 0 lacks the top bits that indicate non-relocatable and
the type (I/O, memory, etc).

2) The "@0,0" and "@1,0" suffixes do not correspond to the reg values
<0x0800 0 0 0 0> and <0x1000 0 0 0 0> using any rule that I know.

What is address space represented by the pcie-controller node?  reg
properties in child nodes must contain proper addresses in some
well-defined address space.  It looks like this example is trying to put
half of the PCI bus abstraction in the pcie-controller node and the rest
in the pcie sub-nodes, with some handwaving address-space splicing
between the two.  That's not kosher.  Each level of the tree needs a
coherent address space definition, otherwise the address space
"calculus" breaks.

> 
> Oh well. I don't like it, but if that's the way it has to be, then so be
> it. Any reason why the reg-names can't match the root port's node name
> so that it can be used directly instead of going through hoops to
> construct a string from extra parameters? Like below:
> 
> 	pcie-controller {
> 		regs = <...>;
> 		reg-names = ..., "pcie@1,0", "pcie@2,0";
> 
> 		pcie@1,0 {
> 			...
> 		};
> 
> 		pcie@2,0 {
> 			...
> 		};
> 	};
> 
> Thierry
> 
> 
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
