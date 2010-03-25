From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Thu, 25 Mar 2010 17:19:56 -0500
Message-ID: <4BABE18C.4030302@freescale.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<4BAB7E67.6040707@freescale.com> <4BAB816F.5060405@firmworks.com>
	<fa686aa41003250916t3d0839e5m42d7f7f6540e821a@mail.gmail.com>
	<4BAB9120.1060600@freescale.com>
	<fa686aa41003250959v401d14e0g151aa54a57eea39@mail.gmail.com>
	<4BAB9755.2080408@freescale.com>
	<fa686aa41003251035h3574a2bahce183ca6056e5f7e@mail.gmail.com>
	<4BABBF54.3010104@freescale.com> <4BABC1CF.1000306@freescale.com>
	<fa686aa41003251454y94f787fva07c5c73fc2d7874@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41003251454y94f787fva07c5c73fc2d7874-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:

> No, this isn't off in the weeds.  I concede the point of needing to
> store firmware in a separate node, but I still don't agree with the
> argument that it needs to be anything more than an anonymous named
> blob.

I still don't understand what's so *bad* about having some kind of binding documentation and a compatible property for this node.  Yes, I understand that compatible==device argument, but do we really have to be so strict about it?  I would like to be able to use the built-in OF functions in the kernel to validate the node (e.g. of_device_is_compatible).

And yes, I just realized the irony of using a function called of_device_is_compatible to test a node for something that isn't a device.  I'd prefer if you just ... overlooked that.

>  The fact that another node references it implicitly defines the
> format the blob needs to be in.  If the blob format changes, then in
> practice the existing binding is no longer compatible because older
> drivers just won't work.

Not necessarily.  There could be a new format for the microcode, or some new instructions for how to upload the microcode, and the driver could use the compatible format to learn how to process the microcode.  This would isolate all of the microcode-isms to the blob node.

>  It probably doesn't justify creation of a
> new compatible value, but I would handle firmware in a different
> format with a different property name to reference it.

I think it would be nicer if the property name could stay the same.  Then I wouldn't need to modify the property if I'm trying to upload a different kind of firmware.  I could then do this in the DTS:

qe@e0080000 {
	compatible = "fsl,qe";
	fsl,firmware-phandle = <&qe_firmware>;
	...
}	

qe_firmware:qe-firmware {
}

See how the qe-firmware node is blank?  It's just a placeholder for the firmware.  U-Boot would then just need to update that node when it embeds the microcode.  It would not need to modify the qe@e0080000 node.

-- 
Timur Tabi
Linux kernel developer at Freescale
