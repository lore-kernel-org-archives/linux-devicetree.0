From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Fri, 26 Mar 2010 10:17:37 -0500
Message-ID: <4BACD011.5050609@freescale.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<ed82fe3e1003240505h59d29c83x6948f8b3b70c4570@mail.gmail.com>
	<90D93687-940F-47FB-8CEA-F3C065EA611D@kernel.crashing.org>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
	<4BAA4C8A.70104@freescale.com>
	<65327.84.105.60.153.1269481760.squirrel@gate.crashing.org>
	<4BAB7E67.6040707@freescale.com> <4BAB816F.5060405@firmworks.com>
	<fa686aa41003250916t3d0839e5m42d7f7f6540e821a@mail.gmail.com>
	<4BAB9120.1060600@freescale.com>
	<fa686aa41003251826m16ea94dfy422fae14fec81204@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41003251826m16ea94dfy422fae14fec81204-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

> +- fsl,firmware:
> +    Usage: Optional.
> +    Value type: <prop-encoded-array>, encoded array of bytes
> +    Definition: Contains the QUICC engine firmware blob.
> [plus any other properties needed for firmware metadata]

This would place the firmware metadata properties inside the QE node itself, which would break the QE binding.

> +Example:
> +       qe1: qe@e0080000 {
> +               compatible = "fsl,qe";
> +               fsl,firmware = /bininc/("firmware-blob.bin");  /* Or
> squirted in by firmware */
> +               ...
> +       }
> +
> +       qe@e0090000 {
> +               compatible = "fsl,qe";
> +               fsl,firmware-phandle = <&qe1>;
> +               ...
> +       }
> 
> Putting the blob into just one of the qe nodes keeps everything nicely
> contained with the device it actually applies to.  No debates about
> the best place to put device firmware blobs or new compatible values,
> and it is applicable to any device where firmware needs to be passed
> via the tree.

Except when you actually need to add metadata properties:

       qe1: qe@e0080000 {
               compatible = "fsl,qe";
               fsl,firmware = /bininc/("firmware-blob.bin"); 
               fsl,qe-firmware-eccr = <0x00000000 0x00001230>;
               ...
       }

(The ECCR is stored in the QE firmware blob, but let's pretend it isn't and I need to specify it)

Here, the fsl,qe-firmware-eccr property is associated with the QE itself.  This is why I want a compatible property for the firmware node, no matter where it is.  Then you can do this:

       qe1: qe@e0080000 {
               compatible = "fsl,qe";
               fsl,qe_firmware {
                       compatible="fsl,qe-firmware";
                       fsl,firmware = /bininc/("firmware-blob.bin"); 
                       fsl,qe-firmware-eccr = <0x00000000 0x00001230>;
               }
               ...
       }

Without the compatible property, the only way I'd know that the child node contains a firmware is to look at the actual name of the child node, which (as Scott and I believe) is not better than a compatible property.

-- 
Timur Tabi
Linux kernel developer at Freescale
