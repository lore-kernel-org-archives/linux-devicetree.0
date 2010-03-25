From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Thu, 25 Mar 2010 11:50:11 -0500
Message-ID: <4BAB9443.6050107@freescale.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<fa686aa41003232307s39af071bn6377800951d6615c@mail.gmail.com>
	<ed82fe3e1003240505h59d29c83x6948f8b3b70c4570@mail.gmail.com>
	<90D93687-940F-47FB-8CEA-F3C065EA611D@kernel.crashing.org>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
	<4BAA4C8A.70104@freescale.com>
	<65327.84.105.60.153.1269481760.squirrel@gate.crashing.org>
	<4BAB7E67.6040707@freescale.com> <4BAB816F.5060405@firmworks.com>
	<fa686aa41003250916t3d0839e5m42d7f7f6540e821a@mail.gmail.com>
	<4BAB9120.1060600@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4BAB9120.1060600-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Timur Tabi wrote:
> Grant Likely wrote:
>> On Thu, Mar 25, 2010 at 9:29 AM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
>>> It seems to me that there are plausible use cases for both direct-inclusion
>>> and indirection.  I don't see any real problems with either, so I would vote
>>> for specifying both alternatives.
>> Ugh.  Then this one driver would need to implement both binding for
>> little, if any, actual benefit. 
> 
> Although I agree that I don't like supporting both bindings, we could
> encapsulate the locating of the firmware node in a function.  The
> function will first look for a child firmware node, and if it doesn't
> find it, look for a fsl,firmware property.  It will return a pointer
> to the firmware node regardless.
> 
>> I'm sure we can come to an agreement
>> on one method if the firmware absolutely has to be in the tree.
> 
> If we have to pick one, then I think the only viable choice is have a
> separate firmware node and a phandle pointer to it.  Otherwise, I
> just don't see how we can handle multiple devices needing the same
> firmware.

You would duplicate the firmware.  I vote for supporting both -- a few 
lines in the binding code is not that big of a deal, and it would 
provide more flexibility for the tree to describe the structure of 
things -- but either way is usable.

>> Personally, my vote lies with direct-inclusion.  However, if
>> indirection is used, then I think it would be wise to define where
>> data-only nodes like this should live.  Under /chosen perhaps?  
> 
> I personally don't care that much; /chosen is okay with me, but ....
> 
>> It
>> wouldn't be good to place it somewhere where it will be confused for
>> an actual device node.
> 
> ... what's wrong with the root node?  

Nothing, IMHO.  It shouldn't get confused for anything in the absence of 
some code specifically looking for that name or compatible -- any more 
than /chosen itself is mistaken for a device.

-Scott
