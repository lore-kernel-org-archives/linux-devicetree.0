From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 3/5] dt-bindings: arm: Document Socionext MB86S71 and
 Fujitsu F-Cue
Date: Sat, 4 Nov 2017 23:30:59 +0800
Message-ID: <3327258c-b222-248b-9550-7620a57328f5@suse.de>
References: <20170625170020.11791-1-afaerber@suse.de>
 <20170625170020.11791-4-afaerber@suse.de>
 <20170628164605.2gnvrv4g7jluzyrm@rob-hp-laptop>
 <CAK7LNATqjOMUajUCYVq=L6wWVTUEc1M7Po+KQ3M3Z=A7+FHX5w@mail.gmail.com>
 <51221840-b08e-45f1-5601-937fb15f3947@suse.de>
 <CAK7LNASYvdWq5rV6q5Xf4Zqjso3H+XQY9Z6byJgcgfN7wT6fog@mail.gmail.com>
 <a39e3d09-4182-ee54-c855-3817498b306a@suse.de>
 <CAKv+Gu8fkOhQCx-BsyTkottkk63dohzSqa8RhAgTDcMVcmFbxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKv+Gu8fkOhQCx-BsyTkottkk63dohzSqa8RhAgTDcMVcmFbxQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Satoru OKAMOTO <okamoto.satoru-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 04.11.2017 um 22:57 schrieb Ard Biesheuvel:
> On 4 November 2017 at 13:44, Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org> wrote:
>> Hi everyone,
>>
>> The non-building clk driver has been removed for 4.14, but this patchset
>> seems stuck on matters of naming and maintenance...
>>
>> Am 30.06.2017 um 01:18 schrieb Masahiro Yamada:
>>> Hi Andreas,
>>>
>>> 2017-06-29 21:53 GMT+09:00 Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>:
>>>> Hi Masahiro-san,
>>>>
>>>> Am 29.06.2017 um 14:18 schrieb Masahiro Yamada:
>>>>> 2017-06-29 1:46 GMT+09:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>>>>>> On Sun, Jun 25, 2017 at 07:00:18PM +0200, Andreas Färber wrote:
>>>>>>> For consistency with existing SoC bindings, use "fujitsu,mb86s71" but
>>>>>>> socionext.txt.
>>>>>>>
>>>>>>> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
>>>>>>> ---
>>>>>>>  Documentation/devicetree/bindings/arm/socionext.txt | 17 +++++++++++++++++
>>>>>>>  1 file changed, 17 insertions(+)
>>>>>>>  create mode 100644 Documentation/devicetree/bindings/arm/socionext.txt
>>>>>>
>>>>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>>>> --
>>>>>
>>>>> I do not mind this, but
>>>>> please note there are multiple product lines in Socionext
>>>>> because Socionext merged LSI divisions from Panasonic and Fujitsu.
>>>>>
>>>>> I maintain documents for Socionext UniPhier SoC family
>>>>> (which inherits SoC architecture of Panasonic)
>>>>> in Documentation/devicetree/bindings/arm/uniphier/.
>>>>
>>>> Actually you seemed to be lacking bindings beyond the cache controller
>>>> for Uniphier:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/arm/uniphier
>>>>
>>>> The SoC compatible, e.g. "socionext,uniphier-ld11", needs to be defined
>>>> somewhere too, as done here. A git-grep for that particular compatible
>>>> only finds derived clk and reset bindings.
>>>
>>> I can care to send a patch later, but it is off-topic here.
>>
>> [The relevance was that had there been any bindings precedence from
>> UniPhier, it would've influenced my naming choices.]
>>
>>>> Using socionext.txt allows you to add those bindings to a shared file;
>>>> if you prefer to host them separately below uniphier/ or as uniphier.txt
>>>
>>> I was thinking of this way.
>>>
>>> For example, TI has omap/, keystone/, davinci.txt, etc.
>>> in this directory level.
>>>
>>>
>>>> do you have a better name suggestion for this one? I was trying to keep
>>>> our options open to later add SC2A11 in socionext.txt, and I also saw
>>>> some mb8ac300 or so (MB86S7x predecessor?) in downstream sources, so I
>>>> don't know a good common name for the non-Panasonic parts. And if we
>>>> take fujitsu.txt for MB86S7x to match the vendor prefix then we will
>>>> need a separate file for the new SC2A11 IIUC.
>>>
>>> I have no idea.
>>> Actually, I am not familiar with those SoCs.
>>>
>>> I am not sure if there exists a common name for those Fujitsu-derived SoCs.
>>> I think a SoC family name will be helpful to avoid proliferating
>>> arch/arm/mach-{mb86s7x,mb8ac300, ...}.
>>>
>>> I see some Socionext guys CC'ed in this mail,
>>> somebody might have information about this.
>>>
>>> As I said before, I do not mind adding socionext.txt
>>> and it seems reasonable enough
>>> if there is no common name for those SoCs.
>>>
>>>
>>>
>>>> Also if you can tell us where the cut between Fujitsu and Socionext
>>>> should be done, we can certainly adapt. NXP is still adding all their
>>>> new SoCs in fsl.txt, it seems.
>>>> (A similar naming issue exists for my not-yet-submitted FM4 patches,
>>>> where it changed owners from Fujitsu to Spansion and then to Cypress.)
>>>>
>>>
>>> Right, vendor names are not future-proof in some cases.
>>>
>>> We use "uniphier" because it is convenient to
>>> make a group of SoCs with similar architecture,
>>> and it will work even if UniPhier product lines are sold again in the
>>> future.  :-)
>>
>> Summarizing: Masahiro-san only wants to maintain the UniPhier family of
>> Socionext SoCs, not this MB86S71. No one from Socionext or Linaro has
>> volunteered as maintainer for these F-Cue MB86S71 patches - that seems
>> to indicate I'll again have to set up a new repository and start
>> maintaining it myself.
>>
>> Naming it linux-socionext.git wouldn't quite be right due to UniPhier
>> also being Socionext.
>>
>> It's also unclear whether and by whom there may be SC2A11 patches - I
>> hear for now Linaro are maintaining a SynQuacer DT in EDK2, rebelling
>> against linux.git.
>>
> 
> Eh, wait, what? "Rebelling against linux.git"? What is that supposed
> to mean exactly?

Bindings must be submitted to the devicetree mailing list, acked by Rob
and merged into the Linux tree before compatible strings may be used in
Linux drivers or in-tree .dts[i] files. checkpatch.pl checks for that.

U-Boot only allows import of new .dts files from Linux, too.

So Linus' linux.git is the location to merge any vendor prefixes and
device tree bindings, as well as the central location for device trees.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts

If you're unfamiliar with that, talk to your Linaro colleagues please!

Regards,
Andreas

> 
> 
>> So... what about naming it linux-fujitsu.git? Then we could keep the
>> "fujitsu," vendor prefix and document compatibles in a fujitsu.txt for
>> consistency (instead of this v1's socionext.txt), and I could later add
>> non-Socionext FM4 (Spansion/Cypress) to the same tree and bindings file.
>>
>> That still leaves conflict potential with the upcoming Fujitsu Post-K
>> chip, but we could still worry about that if it ever results in DT
>> bindings patches rather than just ACPI tables.
>>
>> Objections, suggestions?
>>
>> Thanks,
>> Andreas
>>
>> --
>> SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
>> GF: Felix Imendörffer, Jane Smithard, Graham Norton
>> HRB 21284 (AG Nürnberg)
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
