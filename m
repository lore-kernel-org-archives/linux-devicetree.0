From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: standard property to convey device dma address width?
Date: Tue, 17 Aug 2010 11:22:26 -1000
Message-ID: <4C6AFD92.1000700@firmworks.com>
References: <5A878376-AFCC-4CB0-A0E9-F2F497066FD5@kernel.crashing.org>
	<4C699CC6.1060507@firmworks.com>
	<366D8D84-D210-4BC1-8FC1-4E0A9E06C433@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <366D8D84-D210-4BC1-8FC1-4E0A9E06C433-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Yoder Stuart-B08248 <b08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Kumar Gala wrote:
> On Aug 16, 2010, at 3:17 PM, Mitch Bradley wrote:
>
>   
>> Kumar Gala wrote:
>>     
>>> Do we or should we have a standard property to convey that address width a device is capable of?
>>>  
>>>       
>> ...
>> If I had to describe a partial address, I'd consider a property name like "dma-address-mask", whose value is a bitmap of implemented bits, corresponding to the bits in a unit address for the parent bus.  Low-order bits might be zero if the DMA addressing hardware had alignment restrictions.
>>     
>
> As I said to Stuart.  On the Freescale SOCs we have different device blocks w/varying dma address capabilities.  Some are limited to 32-bits some are capable of 36-bits on the same SOC.
>
> - k
>
>   

The closest existing property that I know of is "dma-ranges" - see 
http://playground.sun.com/1275/proposals/Closed/Accepted/410-it.txt

That's not directly applicable, as "dma-ranges" in its current form 
applies to bus bridges, describing the translation between DMA addresses 
on a child bus to DMA addresses on a parent bus.

The case in question has some general similarities, in that the limited 
devices have an implicit 32-bit "child bus" that is translated to the 
36-bit parent bus, presumably by concatenating zeros in bits 35:32.  Is 
that correct, i.e. are the high bits implicitly 0?

The dma-ranges representation doesn't assume the "zero-extend" property, 
but rather explicitly lists child-base-address,parent-base-address,size 
triples.  I wonder if that generality is justifiable in this case?

I see several obvious representations with varying degrees of generality:

a) boolean property saying "this is one of those 32-bit only devices, 
with all the implications"
b) width in bits - assumes an implicit translation rule (e.g. zero-extend)
c) bitmask - assumes implicit translation rule, capable of representing 
alignment restrictions with low-order zeros
d) something like dma-ranges - explicitly represents translation rule, 
no representation for alignment restriction

My 2 cents: Generality is often only justified when you have a good 
collection of problem instances, so you can amortize the generality over 
several specific known examples.  Otherwise you often end up 
implementing something elaborate that never gets used.
