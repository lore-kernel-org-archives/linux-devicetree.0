From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: standard property to convey device dma address width?
Date: Tue, 17 Aug 2010 15:55:04 -0500
Message-ID: <366D8D84-D210-4BC1-8FC1-4E0A9E06C433@kernel.crashing.org>
References: <5A878376-AFCC-4CB0-A0E9-F2F497066FD5@kernel.crashing.org>
	<4C699CC6.1060507@firmworks.com>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4C699CC6.1060507-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Yoder Stuart-B08248 <b08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Aug 16, 2010, at 3:17 PM, Mitch Bradley wrote:

> Kumar Gala wrote:
>> Do we or should we have a standard property to convey that address width a device is capable of?
>>  
> 
> What is the context?  When Open Firmware was first developed, the only bus with partial addresses was ISA.  The ISA bus binding has a "dma" property that describes some of the legacy DMA characteristics, but address width isn't one of them, for reasons that I don't remember.
> 
> I thought at the time (perhaps wishfully) that partial addresses would not be consideration for future buses, because
> 
> a) The transition to large-scale integration had already made logic gates nearly "free", so there was no motivation to skimp on address register bits.
> 
> b) Although packages were - and still are - pin-limited, partial address bus connections were not feasible because of uneven bus loading problems.
> 
> c) Address and data buses were usually multiplexed onto the same pins, further reducing the motivation for partial addresses.
> 
> Obviously, since you are asking the question, there is some case where address width could be variable.  I'd be interested to learn the details.
> 
> If I had to describe a partial address, I'd consider a property name like "dma-address-mask", whose value is a bitmap of implemented bits, corresponding to the bits in a unit address for the parent bus.  Low-order bits might be zero if the DMA addressing hardware had alignment restrictions.

As I said to Stuart.  On the Freescale SOCs we have different device blocks w/varying dma address capabilities.  Some are limited to 32-bits some are capable of 36-bits on the same SOC.

- k
