From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] arm,
 davinci: configure davinci aemif chipselects through OF
Date: Thu, 08 Dec 2011 10:06:47 +0100
Message-ID: <4EE07E27.8090602@denx.de>
References: <1322991679-20947-1-git-send-email-hs@denx.de>
 <DF0F476B391FA8409C78302C7BA518B603EFB2@DBDE01.ent.ti.com>
 <4EE06B79.7070804@denx.de>
 <DF0F476B391FA8409C78302C7BA518B6040A03@DBDE01.ent.ti.com>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <DF0F476B391FA8409C78302C7BA518B6040A03-Er742YJ7I/eIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: "Hilman, Kevin" <khilman-l0cyMroinI0@public.gmane.org>, "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Nori,

Nori, Sekhar wrote:
> On Thu, Dec 08, 2011 at 13:17:05, Heiko Schocher wrote:
> 
>>>> diff --git a/Documentation/devicetree/bindings/arm/davinci/aemif.txt b/Documentation/devicetree/bindings/arm/davinci/aemif.txt
>>>> new file mode 100644
>>>> index 0000000..c9ed551
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/arm/davinci/aemif.txt
>>>> @@ -0,0 +1,85 @@
>>>> +* Texas Instruments Davinci AEMIF
>>>> +
>>>> +This file provides information, what the device node for the
>>>> +davinci aemifa interface contain.
>>>            ^^^^^^
>>>            aemif
>> fixed, thanks.
>>
>>>> +
>>>> +Required properties:
>>>> +- compatible: "ti,davinci-emifa";
>> Shouldn't this also be "ti,davinci-aemif" ?
> 
> Yes, makes sense.

Ok, change this.

>> [...]
>>>> diff --git a/arch/arm/mach-davinci/aemif.c b/arch/arm/mach-davinci/aemif.c
>>>> index 1ce70a9..12c559f 100644
>>>> --- a/arch/arm/mach-davinci/aemif.c
>>>> +++ b/arch/arm/mach-davinci/aemif.c
>>>> @@ -13,12 +13,14 @@
>>>>  #include <linux/err.h>
>>>>  #include <linux/clk.h>
>>>>  #include <linux/module.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/of_address.h>
>>>>  #include <linux/time.h>
>>>>  
>>>>  #include <mach/aemif.h>
>>>>  
>>>>  /* Timing value configuration */
>>>> -
>>>> +#define ASIZE(x)	(x)
>>>>  #define TA(x)		((x) << 2)
>>>>  #define RHOLD(x)	((x) << 4)
>>>>  #define RSTROBE(x)	((x) << 7)
>>>> @@ -26,7 +28,10 @@
>>>>  #define WHOLD(x)	((x) << 17)
>>>>  #define WSTROBE(x)	((x) << 20)
>>>>  #define WSETUP(x)	((x) << 26)
>>>> +#define EW(x)		((x) << 30)
>>>> +#define SS(x)		((x) << 31)
>>> You are adding support for additional configuration
>>> parameters which should be done in a separate patch.
>> Hmm.. they are only used in the OF case ... is this split
>> really needed?
> 
> But they should also be useful in the non-OF case, no?
> Why restrict their usage to the OF case?

I thought there is no need, because nobody needed this yet ...
Ok, I change this too, so I have to fix this files:

$ grep -lr davinci_aemif_timing .
./arch/arm/mach-davinci/board-dm644x-evm.c
./arch/arm/mach-davinci/board-dm646x-evm.c
./arch/arm/mach-davinci/board-da850-evm.c
./arch/arm/mach-davinci/include/mach/aemif.h
./arch/arm/mach-davinci/include/mach/nand.h
./arch/arm/mach-davinci/board-da830-evm.c
./drivers/mtd/nand/davinci_nand.c

I do not know the values for this boards for the new parameters.
How to proceed? Do you know this values? Or is it Ok, if I add in
arch/arm/mach-davinci/include/mach/aemif.h
a "#define AEMIF_VALUE_NOT USED 0xff" and if the new value is set to
this I don't change this setting in the register?

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
