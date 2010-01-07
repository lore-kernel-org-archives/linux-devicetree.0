From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [Power.org:parch] Re: RFC: proposal to extend the open-pic
	interrupt specifierdefinition
Date: Thu, 07 Jan 2010 11:18:39 -0600
Message-ID: <4B46176F.2040600@freescale.com>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
	<20100107005036.GB23206@yookeroo>
	<9696D7A991D0824DBA8DFAC74A9C5FA305987E61@az33exm25.fsl.freescale.net>
	<20100107045514.GF2847@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100107045514.GF2847@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org, Kumar Gala <kumar.gala-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

David Gibson wrote:
> On Wed, Jan 06, 2010 at 08:33:03PM -0700, Yoder Stuart-B08248 wrote:
>> "type" specifies the type of interrupt-- example timer, MSI,
>> etc and would define the meaning of the interrupt number
>> portion of the interrupt specifier.   A given "type" may or
>> may not have a "subtype" depending on the binding.
>>
>> As described in the proposal, "type" is a range of numbers,
>> divided between standard/architected types and implementation
>> specific types.
>>
>> We (Freescale) have at least one interrupt type "error" in the P4080
>> that would have a "sub-type" that would indicate a related bit in
>> another
>> status register.
> 
> And who is the type/subtype relevant to? 

The interrupt controller driver.

> From what you've said here,
> I don't see why it needs to be in the interrupt specifiers.

The case that this grew out of was the p4080 error interrupt, which is 
basically a cascaded interrupt controller within the mpic.  All errors 
arrive on the same mpic vector, but each has its own bit in summary and 
mask registers.  The subtype contains that bit number.

It could also be used for expressing interrupts such as IPIs and timers 
that aren't part of the numbered interrupts that start at offset 0x10000.

-Scott
