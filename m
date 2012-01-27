From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [RFC PATCH 6/7] ARM: mtd: nand: davinci: add OF support for
 davinci nand controller
Date: Fri, 27 Jan 2012 07:40:00 +0100
Message-ID: <4F2246C0.6020905@denx.de>
References: <1327308967-8092-1-git-send-email-hs@denx.de>
 <1327308967-8092-7-git-send-email-hs@denx.de> <4F1DF465.60206@freescale.com>
 <4F1E5C82.60108@denx.de> <4F1F0A3E.40805@freescale.com>
 <4F1FAAAE.2060007@denx.de> <4F21B8AC.40002@freescale.com>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <4F21B8AC.40002-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Scott,

Scott Wood wrote:
> On 01/25/2012 01:09 AM, Heiko Schocher wrote:
>> Scott Wood wrote:
>> I found the following used options:
>>
>> ecc_mode:
>> NAND_ECC_NONE
>> NAND_ECC_SOFT
>> NAND_ECC_HW
>> NAND_ECC_HW_SYNDROME
>>
>> bbt_options:
>> NAND_BBT_USE_FLASH
>>
>> ecc_bits:
>> 1
>> 4
>>
>> options:
>> NAND_BUSWIDTH_16
>>
>>>>> Do all of these properties really belong here?  I can see providing some
>>>> I think so, because this values come from existing platform code
>>>> (grep for struct davinci_nand_pdata)
>>> The standards are a bit stricter for the device tree, since it's a more
>>> stable interface across components -- at least that's how we've used it
>>> on a lot of powerpc targets.  I'm not sure if that's the intent here,
>>> but I have seen U-Boot patches for ARM hardware using them as well.
>> Ok, so, should I introduce instead properties for the above
>> needed parameters? 
> 
> Yes.

Ok, I change this.

>> (As this are not davinci specific parameters, are there somewhere such definitions for them?)
> 
> It's controller-specific which options are changeable, and whether
> there's a better source of information.  Most controllers don't seem to
> need this.  I'd keep the definitions davinci specific for now.  If
> there's enough of a common need, a common definition could be considered.

Ok, a proposal for the properties names and values:

>> ecc_mode:
>> NAND_ECC_NONE
>> NAND_ECC_SOFT
>> NAND_ECC_HW
>> NAND_ECC_HW_SYNDROME

"ti,davinci-nand-ecc-mode" = "none", "soft", "hw" or "hw_syndrome"

>> bbt_options:
>> NAND_BBT_USE_FLASH

"ti,davinci-nand-bbt-options" = "use_flash"

>> ecc_bits:
>> 1
>> 4

"ti,davinci-nand-ecc-bits" = "1" or "4"

>> options:
>> NAND_BUSWIDTH_16

"ti,davinci-nand-options" = "buswidth-16"

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
