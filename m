From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Please revert commit dc9372808412edbc653a675a526c2ee6c0c14a91
Date: Tue, 22 Nov 2011 17:36:41 -0600
Message-ID: <4ECC3209.9080106@gmail.com>
References: <1321999910.14573.11.camel@pasglop>
 <CACxGe6tydq8yGnEMea-cL2Et_vWEBrmpE_Xn9U-rb1nZskxztQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6tydq8yGnEMea-cL2Et_vWEBrmpE_Xn9U-rb1nZskxztQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/22/2011 04:43 PM, Grant Likely wrote:
> On Tue, Nov 22, 2011 at 3:11 PM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>> Hi Linus !
>>
>> Please, revert commit dc9372808412edbc653a675a526c2ee6c0c14a91
>>
>> "of/irq: of_irq_find_parent: check for parent equal to child"
>>
>> This breaks some powerpc platforms at least. The practice of having a
>> node provide an explicit "interrupt-parent" property pointing to itself
>> is an old trick that we've used in the past to allow a device-node to
>> have interrupts routed to different controllers.
>>
>> In that case, the node also contains an interrupt-map, so the node is
>> its own parent, the interrupt resolution hits the map, which then can
>> route each individual interrupt to a different parent.
> 
> Ah, nuts, yes that is broken then.  Yes, please revert the commit and
> Rob & I will come up with a better solution.
> 
> Rob, I think it can be done by explicitly checking for np ==
> desc->interrupt_parent in of_irq_init() instead of relying on
> of_irq_find_parent() returning NULL.

Okay. I'll prepare a patch to do that.

Rob
