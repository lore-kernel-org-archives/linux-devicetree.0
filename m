From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Wed, 24 Mar 2010 12:31:54 -0500
Message-ID: <4BAA4C8A.70104@freescale.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<fa686aa41003232307s39af071bn6377800951d6615c@mail.gmail.com>
	<ed82fe3e1003240505h59d29c83x6948f8b3b70c4570@mail.gmail.com>
	<90D93687-940F-47FB-8CEA-F3C065EA611D@kernel.crashing.org>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41003241007mf6052d5s4643795f4a87cdcf-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Wed, Mar 24, 2010 at 11:00 AM, Segher Boessenkool
> <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>>>> Why the phandle redirection?  Why not just put the firmware blob into
>>>> a property in the QE node, or as a subnode?
>>>
>>> Because there might be multiple QE devices on a single chip, and each
>>> will need to upload the same firmware.  So instead of embedding the
>>> firmware multiple times, just embed it once, and have a pointer.
>>
>> You're messing up the binding because of a (perceived) deficiency in
>> the DTB format? 

Huh?  Who says anything about messing up?  I don't see anything "messed up" about including a blob of data with proper compatible properties, etc.

>> Or maybe just the DTS format.  Or maybe you shouldn't
>> even care about size here.  Or really, the device tree is the wrong
>> place to store firmware blobs at all.
> 
> That is a good question.  Why is it necessary to pass the blob via the
> tree? 

Because sometimes the firmware is needed before networking or serial I/O can function.  Today, we do one of two things on systems with QE (or QE-like microcontrollers):

1) U-Boot uploads the firmware, and may create a DTB node that provides some information about the firmware.

2) U-Boot uploads the firmware, but then gives Linux the physical address (in flash) of the firmware so that it can upload it again.

> So far we've avoided using firmware blobs in the flat trees.
> Or to ask in other words; what is the use case that requires passing
> via the device tree?

The Fman devices on the Freescale P4080 needs to have the firmware uploaded by the kernel before they will function.  I can't depend on having the firmware on the root file system, and we can't embed it in the kernel itself (because it's proprietary), so where else should I put it?  Today, we just leave it in flash and give the physical address to the Fman Linux driver via a command-line parameter.  But that doesn't work because then it means we have to have flash mapped to every partition that runs Linux.  

> Also, depending on firmware to correctly squirt the firmware blob into
> the dtb at boot is risky.  Even when firmware is buggy, there is
> resistance to upgrading firmware on working boards because it could
> result in a bricked board.

I'm not sure what you're getting at.  This has nothing to do with upgrading firmware.  The firmware is already in flash, I just need a better way of giving it to the kernel.  If you upgrade the firmware in flash, then U-Boot will automatically provide the new version to the kernel via the DTB.  I just don't see how upgrading is a factor.

>  In fact, every time we depend on firmware
> to modify the dtb at boot is risky, so it should only be done when
> strictly necessary (I would even say that to date we've probably been
> rather too liberal about getting u-boot to modify the device tree).

Embedding the firmware blob in the DTS is uglier than having U-Boot do it, IMHO.

> I would say that either the firmware should be loaded via the existing
> (non-dt) firmware loading mechanism, 

That, unfortunately, is not an option.

> or it should be built into the
> static dtb blob.  Don't try to add it at runtime.

Then how do I distribute the firmware blob?  It's not GPL, so it can't go into arch/powerpc/boot/dts/.  Are you suggesting I do this in the DTS:

/ {
	model = "MPC8323EMDS";
	compatible = "MPC8323EMDS", "MPC832xMDS", "MPC83xxMDS";
	#address-cells = <1>;
	#size-cells = <1>;

...

	qe_firmware:qe-firmware {
		compatible = "fsl,qe-firmware";
		fsl,firmware = <0x70 0xcd 0x00 0x00 0x01 0x46 0x45 0x63 ...>
	}
}

Most firmware is 8-12KB, so this will make for one ugly DTS.  Plus, there's the issue of distributing non-GPL firmware data inside a DTS, which is GPL.

-- 
Timur Tabi
Linux kernel developer at Freescale
