From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Thu, 25 Mar 2010 11:46:25 -0500
Message-ID: <4BAB9361.8090900@freescale.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<fa686aa41003232307s39af071bn6377800951d6615c@mail.gmail.com>
	<ed82fe3e1003240505h59d29c83x6948f8b3b70c4570@mail.gmail.com>
	<90D93687-940F-47FB-8CEA-F3C065EA611D@kernel.crashing.org>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
	<4BAA4C8A.70104@freescale.com>	<65327.84.105.60.153.1269481760.squirrel@gate.crashing.org>
	<ed82fe3e1003250742t5affee7dudca651ab3352bc16@mail.gmail.com>
	<fa686aa41003250910n437e4e73p34645f5627d25784@mail.gmail.com>
	<4BAB90B1.9080603@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4BAB90B1.9080603-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Scott Wood wrote:

> It would be nice to not have to provide separate copies of the firmware 
> to u-boot and Linux -- not from a space perspective, but support. 

My plan was to take the copy that U-Boot already knows about (via macros like CONFIG_SYS_QE_FW_ADDR) and have U-Boot dynamically embed that in the DTB.  That eliminates the support issue, and it allows us to continue to use the firmware that we already distribute in flash on our boards.

> It would also be nice to not require an initrd if one wants an NFS root. 

The more I think about it, the more I believe that this is how we're going to have to do it.  Whether or not Freescale can embed a non-GPL firmware into a device tree is still undecided.  It may require relicensing all of our device trees as dual bsd/gpl first.  Technically, we should probably do that anyway.

>   That's a lot more complexity than a not-strictly-necessary phandle. :-P

I agree with that.  

> And as Timur pointed out, the device tree is not just for Linux.  I 
> don't think the lack of GPL makes it a moot point, as there's still some 
> maintenance and support benefit to keeping it in one place -- especially 
> since the appropriate firmware version often depends on the specific 
> hardware revision that you have.

Our QE/Fman firmware is typically highly dependent on the specific SOC version.  So if we produce a new revision of an SOC, we typically have to release a new version of the firmware.  I can imagine a situation where our boards ship with every possible firmware in flash, and U-Boot has to find the right one.  In that case, U-Boot will embed the right one in the DTB when it boots the kernel.

This is why I'm opposed to a requirement that the firmware be in the DTS.  If that works for some other people's boards, that's great.  But it won't work for anything that Freescale ships.

>> It isn't a problem to change dtc if we've got a good use-case for
>> doing so.  I've cc'd David Gibson.  He's probably got some insight on
>> the best way to handle this without an incompatible .dtb file format
>> change.
> 
> What Segher suggested sounds like it's fundamentally a .dtb file format 
> change.

That's the impression I got, as well.

-- 
Timur Tabi
Linux kernel developer at Freescale
