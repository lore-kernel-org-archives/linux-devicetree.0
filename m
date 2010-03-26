From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Fri, 26 Mar 2010 08:48:31 -1000
Message-ID: <4BAD017F.6090109@firmworks.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
	<4BAA4C8A.70104@freescale.com>
	<65327.84.105.60.153.1269481760.squirrel@gate.crashing.org>
	<4BAB7E67.6040707@freescale.com> <4BAB816F.5060405@firmworks.com>
	<fa686aa41003250916t3d0839e5m42d7f7f6540e821a@mail.gmail.com>
	<4BAB9120.1060600@freescale.com>
	<fa686aa41003251826m16ea94dfy422fae14fec81204@mail.gmail.com>
	<4BACD011.5050609@freescale.com>
	<fa686aa41003261120o15fea3cev8ca625f389bc8664@mail.gmail.com>
	<4BACFF7B.3010002@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4BACFF7B.3010002-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Timur Tabi wrote:
> Grant Likely wrote:
>   
>>> Without the compatible property, the only way I'd know that the child node contains a firmware is to look at the actual name of the child node, which (as Scott and I believe) is not better than a compatible property.
>>>       
>> If it is always a child of a qe node, then I've got no objections.
>>     
>
> I have no problem with putting the firmware node as a child of the QE node and skipping the phandle property, but only as long as there's only one QE node.  Would you agree that this is bad:
>
> qe1: qe@e0080000 {
>         compatible = "fsl,qe";
>         qefw: fsl,qe_firmware {
>                 compatible="fsl,qe-firmware";
>                 fsl,firmware = /bininc/("firmware-blob.bin");
>                 fsl,qe-firmware-eccr = <0x00000000 0x00001230>;
>         }
>         ...
> }
>
> qe2: qe@e0090000 {
>         compatible = "fsl,qe";
> 	fsl,firmware-phandle = <&qefw>;
>         ...
> }
>
>   

It not any worse than having the firmware blob anywhere else that is not 
hierarchically related.

If one insists on purity of hierarchy, one could introduce a node above 
qe1 and qe2 and put the firmware blob in that parent node.  That 
captures the assertion that the two qe devices are in fact identical so 
the same firmware is suitable for both.
