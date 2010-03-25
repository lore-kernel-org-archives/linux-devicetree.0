From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Thu, 25 Mar 2010 11:34:57 -0500
Message-ID: <4BAB90B1.9080603@freescale.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<fa686aa41003232307s39af071bn6377800951d6615c@mail.gmail.com>
	<ed82fe3e1003240505h59d29c83x6948f8b3b70c4570@mail.gmail.com>
	<90D93687-940F-47FB-8CEA-F3C065EA611D@kernel.crashing.org>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
	<4BAA4C8A.70104@freescale.com>	<65327.84.105.60.153.1269481760.squirrel@gate.crashing.org>
	<ed82fe3e1003250742t5affee7dudca651ab3352bc16@mail.gmail.com>
	<fa686aa41003250910n437e4e73p34645f5627d25784@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41003250910n437e4e73p34645f5627d25784-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> [cc'd David Gibson]
> 
> On Thu, Mar 25, 2010 at 8:42 AM, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> The initrd thing is a good idea, but it doesn't help non-Linux
>> operating systems.  Then again, those OS's might not have any GPL
>> issues, so it could be a moot point.
> 
> The more I think about it, the more I think that the initrd is the
> better approach.  Non-GPL firmware blobs are not a new problem, other
> drivers have the same issue and the kernel already has a facility for
> handling them.  Consistency is worth something here.  As you say, the
> ideal solution would be to link the blob into the kernel and be done
> with it.  <grumble>

It would be nice to not have to provide separate copies of the firmware 
to u-boot and Linux -- not from a space perspective, but support. 
Instead of having to make sure people have the right firmware in one 
place, we'd have to make sure they have it in both places.

It would also be nice to not require an initrd if one wants an NFS root. 
  That's a lot more complexity than a not-strictly-necessary phandle. :-P

And as Timur pointed out, the device tree is not just for Linux.  I 
don't think the lack of GPL makes it a moot point, as there's still some 
maintenance and support benefit to keeping it in one place -- especially 
since the appropriate firmware version often depends on the specific 
hardware revision that you have.

>>>  With real OF it is trivial to not have
>>> multiple copies of the data if you want a few properties with
>>> the same data.  There is no reason this could not be done in DTB
>>> as well (and some way in DTS to express that, or maybe the tools
>>> could auto-detect it, whatever).
>> So you're suggesting a change to DTC to support an enhanced syntax?
> 
> It isn't a problem to change dtc if we've got a good use-case for
> doing so.  I've cc'd David Gibson.  He's probably got some insight on
> the best way to handle this without an incompatible .dtb file format
> change.

What Segher suggested sounds like it's fundamentally a .dtb file format 
change.

-Scott
