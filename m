From: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/4] powerpc: Removing support for 'protected-sources'
Date: Mon, 07 Feb 2011 18:32:39 -0600
Message-ID: <4D508F27.8060307@mentor.com>
References: <1296861941-3370-1-git-send-email-meador_inge@mentor.com>	
	<1296861941-3370-2-git-send-email-meador_inge@mentor.com>	
	<1297035336.14982.14.camel@pasglop> <4D5033C9.8030407@mentor.com>
	<1297115136.14982.82.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1297115136.14982.82.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/07/2011 03:45 PM, Benjamin Herrenschmidt wrote:
>
>> In my previous reply I said that "it is not so much as a need as it is a
>> potential simplification."  After further reflection, I don't think that
>> is completely true.  As we get into AMP systems with higher core counts,
>> then implementing this functionality using the existing
>> "protected-sources" implementation versus the new "pic-no-reset" work is
>> going to be harder to maintain.
>
> I'm not arguing that your approach isn't more suitable for AMP systems,
> I just want to leave the existing protected-sources mechanism alone. I'm
> not opposing adding a new, better, mechanism for newer platforms.

Is the mechanism mentioned earlier of having "protected-sources" as a 
synonym for "pic-no-reset" not suitable?  Or would you like the current 
protected sources implementation left completely intact?

> However, I'd name it differently. "pic-no-reset" doesn't carry enough
> meaning in that case. What we want to point out here is that the PIC
> has been pre-initialized.
>
> Another option, which may be cleaner, is to stick to "no-reset" (no need
> for pic- prefix) and make it do just that (prevent the reset), and then

It originally was "no-reset", but that was considered too broad. [1] :)

> use a positive variant of "protected-sources", call it
> "allowed-sources". Maybe even make it a series of ranges. Then have the
> MPIC only access these.

That would work, but I still don't like having to mention this 
information twice in the device tree.  All the sources encoded in the 
various "interrupts" properties _are_ the allowed sources, right?

> I think this is more robust as it would also prevent "accidental" use of
> the wrong sources (bad device-tree, drivers that let you muck around
> with irq numbers, etc...).

That would be nice.  All though, it may not be as helpful as it sounds. 
  There is as much of a risk that someone will botch the 
"allowed-sources" property as there is they will botch the "interrupts" 
property.  We could perhaps still preform these checks without the extra 
property: if a source is not mentioned in an interrupts property, then 
it is not allowed.

> Cheers,
> Ben.
>

[1] http://lists.ozlabs.org/pipermail/linuxppc-dev/2011-February/088244.html

-- 
Meador Inge     | meador_inge AT mentor.com
Mentor Embedded | http://www.mentor.com/embedded-software
