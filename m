From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 3/5] dt-bindings: arm: Document Socionext MB86S71 and
 Fujitsu F-Cue
Date: Thu, 29 Jun 2017 14:53:21 +0200
Message-ID: <51221840-b08e-45f1-5601-937fb15f3947@suse.de>
References: <20170625170020.11791-1-afaerber@suse.de>
 <20170625170020.11791-4-afaerber@suse.de>
 <20170628164605.2gnvrv4g7jluzyrm@rob-hp-laptop>
 <CAK7LNATqjOMUajUCYVq=L6wWVTUEc1M7Po+KQ3M3Z=A7+FHX5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNATqjOMUajUCYVq=L6wWVTUEc1M7Po+KQ3M3Z=A7+FHX5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Satoru OKAMOTO <okamoto.satoru-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Masahiro-san,

Am 29.06.2017 um 14:18 schrieb Masahiro Yamada:
> 2017-06-29 1:46 GMT+09:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>> On Sun, Jun 25, 2017 at 07:00:18PM +0200, Andreas Färber wrote:
>>> For consistency with existing SoC bindings, use "fujitsu,mb86s71" but
>>> socionext.txt.
>>>
>>> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/arm/socionext.txt | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/arm/socionext.txt
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> --
> 
> I do not mind this, but
> please note there are multiple product lines in Socionext
> because Socionext merged LSI divisions from Panasonic and Fujitsu.
> 
> I maintain documents for Socionext UniPhier SoC family
> (which inherits SoC architecture of Panasonic)
> in Documentation/devicetree/bindings/arm/uniphier/.

Actually you seemed to be lacking bindings beyond the cache controller
for Uniphier:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/arm/uniphier

The SoC compatible, e.g. "socionext,uniphier-ld11", needs to be defined
somewhere too, as done here. A git-grep for that particular compatible
only finds derived clk and reset bindings.

Using socionext.txt allows you to add those bindings to a shared file;
if you prefer to host them separately below uniphier/ or as uniphier.txt
do you have a better name suggestion for this one? I was trying to keep
our options open to later add SC2A11 in socionext.txt, and I also saw
some mb8ac300 or so (MB86S7x predecessor?) in downstream sources, so I
don't know a good common name for the non-Panasonic parts. And if we
take fujitsu.txt for MB86S7x to match the vendor prefix then we will
need a separate file for the new SC2A11 IIUC.

Also if you can tell us where the cut between Fujitsu and Socionext
should be done, we can certainly adapt. NXP is still adding all their
new SoCs in fsl.txt, it seems.
(A similar naming issue exists for my not-yet-submitted FM4 patches,
where it changed owners from Fujitsu to Spansion and then to Cypress.)

Best regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
