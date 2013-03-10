From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH 24/32] pci: PCIe driver for Marvell Armada 370/XP systems
Date: Sat, 09 Mar 2013 19:04:51 -1000
Message-ID: <513C1473.60600@firmworks.com>
References: <20130212223511.GB31555@obsidianresearch.com>
 <20130306105441.4d24033e@skate>
 <20130306121118.GA17079@avionic-0098.mockup.avionic-design.de>
 <20130306180946.GA2433@obsidianresearch.com>
 <20130307080832.GD3451@avionic-0098.mockup.avionic-design.de>
 <20130307174955.GC20840@obsidianresearch.com>
 <20130307194830.GA1811@avionic-0098.mockup.avionic-design.de>
 <20130307200235.GB20695@obsidianresearch.com>
 <20130307204726.GB1811@avionic-0098.mockup.avionic-design.de>
 <51392B4D.9040404@gmail.com>
 <20130308071443.GA5772@avionic-0098.mockup.avionic-design.de>
 <513A7044.1020700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <513A7044.1020700-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 3/8/2013 1:12 PM, Rob Herring wrote:
> On 03/08/2013 01:14 AM, Thierry Reding wrote:
>> On Thu, Mar 07, 2013 at 06:05:33PM -0600, Rob Herring wrote:
>>> On 03/07/2013 02:47 PM, Thierry Reding wrote:
>> [...]
>>>> In a nutshell (since some of the context isn't quoted anymore) the
>>>> problem that we're trying to solve is that some of the embedded SoCs
>>>> require per-root-port registers for configuration. The PCI DT
>>>> specification doesn't make any provisions for this. A few alternatives
>>>> have been discussed so far:
>>>
>>> I'm not sure I follow. This is different than the host controller
>>> registers? Why would this not just be multiple entries in the reg property?
>>
>> Well the register regions are per root-port. On Tegra20 there's 2 of
>> them, Tegra30 has 3 and if I understand correctly Marvell can have up to
>> 10 (!). Adding all of them to the reg property of the host controller
>> could work but it needs some way to match the reg entry to the root port
>> similar to option 1 below.
> 
> The compatible property of the PCI host controller can imply what each
> index of the reg property entries is for.
> 
>>
>> Adding a property in the root port nodes seems like a cleaner and more
>> accurate representation of the hardware to me, but if that's not
>> acceptable perhaps we need to bite the bullet and add the code to look
>> the registers up from the parent's reg property.
> 
> What I don't like is a new property defined to describe mmio addresses.
> We already have a property for that and it is "reg". But I think I'm
> still missing something:


As stated in my recent reply to Jason, I thing the correct property is
"ranges".  "Ranges" translates mappable child address space addresses
into parent addresses, and that is exactly what is going on.  A specific
subset of config addresses is mappable into parent MMIO space.

When done that way, there is no need for the multi-entry reg property at
the top level, and the correspondence between specific root port DT
nodes and their MMIO addresses is easily determined by matching child
reg properties to parent ranges entries.

> 
>>>> 			pci@0,1 {
>>>> 				...
>>>> 				reg = <0x00000800 0 0 0 0>;
> 
> Is this a PCI bus address?
> 
>>>> 				regs = <0x80000000 0x00001000>;
>>>> 			};
> 
> Rob
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
