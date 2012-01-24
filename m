From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC PATCH 6/7] ARM: mtd: nand: davinci: add OF support for
 davinci nand controller
Date: Tue, 24 Jan 2012 13:45:02 -0600
Message-ID: <4F1F0A3E.40805@freescale.com>
References: <1327308967-8092-1-git-send-email-hs@denx.de>
 <1327308967-8092-7-git-send-email-hs@denx.de> <4F1DF465.60206@freescale.com>
 <4F1E5C82.60108@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F1E5C82.60108-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: hs-ynQEQJNshbs@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/24/2012 01:23 AM, Heiko Schocher wrote:
> Hello Scott,
> 
> Scott Wood wrote:
>> On 01/23/2012 02:56 AM, Heiko Schocher wrote:
>>> diff --git a/Documentation/devicetree/bindings/arm/davinci/nand.txt b/Documentation/devicetree/bindings/arm/davinci/nand.txt
>>> new file mode 100644
>>> index 0000000..7e8d6db
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/davinci/nand.txt
>>> @@ -0,0 +1,72 @@
>>> +* Texas Instruments Davinci NAND
>>> +
>>> +This file provides information, what the device node for the
>>> +davinci nand interface contain.
>>> +
>>> +Required properties:
>>> +- compatible: "ti,davinci-nand";
>>> +- reg : contain 2 offset/length values:
>>> +        - offset and length for the access window
>>> +        - offset and length for accessing the aemif control registers
>>> +- id: id of the controller
>>
>> What does "id of the controller" mean, specfically?  From this I can't
>> even tell if it's a number or a string, much less how to use it
>> semantically.  If it's just a "match what's in the manual" thing,
>> perhaps an alias would be better here.  Or, if it's a value with a
>> specific meaning (e.g. that you need to program into a register) use a
>> more specific name.
> 
> Ok, fix this. Id means here, which chipselect the controller uses.
> Maybe it is better to rename it to "chipselect" ?

Yes, or better "ti,chipselect" or "ti,davinci-chipselect".

>>> +Recommended properties :
>>> +- mask_ale: mask for ale
>>> +- mask_cle: mask for cle
>>> +- mask_chipsel: mask for chipselect
>>> +- ecc_mode: ECC mode, see NAND_ECC_* defines
>>> +- ecc_bits: used ECC bits
>>> +- options: nand options, defined in
>>> +           include/linux/mtd/nand.h, grep for NAND_NO_AUTOINCR
>>> +- bbt_options: NAND_BBT_* defines
>>
>> Binding-specific properties should have a vendor prefix.  Dashes are
>> preferred to underscores.
> 
> You think something like that:
> 
> davinci-mask-ale
> davinci-mask-cle
> ...

"ti,davinci-mask-ale", etc.

>> Don't specify Linux internals by reference -- they could change and
>> invalidate existing device trees and non-Linux code that accepts them
>> (e.g. U-Boot).  If you want them to line up, copy the definition here,
>> and if Linux changes, write glue code to convert.  It would probably be
>> better to define specific properties for anything that must be specified
>> here (neither deteted dynamically nor defined by compatible =
>> "ti,davinci-nand").
> 
> Ok, I add the defines here, and add also a comment in the dts.

Which options actually need to come from the device tree?

>> Do all of these properties really belong here?  I can see providing some
> 
> I think so, because this values come from existing platform code
> (grep for struct davinci_nand_pdata)

The standards are a bit stricter for the device tree, since it's a more
stable interface across components -- at least that's how we've used it
on a lot of powerpc targets.  I'm not sure if that's the intent here,
but I have seen U-Boot patches for ARM hardware using them as well.

> Comment in arch/arm/mach-davinci/include/mach/nand.h says for
> mask_ale and mask_cle:
> 
> /* NOTE:  boards don't need to use these address bits
>  * for ALE/CLE unless they support booting from NAND.
>  * They're used unless platform data overrides them.
>  */
> 
> It is used for addressing the ALE/CLE Signals through the address,
> used on the arch/arm/mach-davinci/board-dm646x-evm.c and
> arch/arm/mach-davinci/board-tnetv107x-evm.c board ... so I think,
> this should be also be setupable through OF ...

OK, if it's board logic that does the decoding, and the compatible is
not board-specific, they belong here.

-Scott
