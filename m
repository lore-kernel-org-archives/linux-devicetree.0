From: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: r8a7795: Add L2 cache-controller nodes
Date: Mon, 8 Feb 2016 09:54:04 +0100
Message-ID: <56B857AC.4090701@de.bosch.com>
References: <1452953856-5146-1-git-send-email-dirk.behme@gmail.com>
 <56B2370D.2010102@gmail.com> <20160205095758.GE16556@verge.net.au>
 <CAMuHMdVRhwGh2bvfNSguX0XnMW0eEgLRTCt3Y3-+KfV0Jy9WHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVRhwGh2bvfNSguX0XnMW0eEgLRTCt3Y3-+KfV0Jy9WHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08.02.2016 09:42, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Fri, Feb 5, 2016 at 10:57 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
>> On Wed, Feb 03, 2016 at 06:21:17PM +0100, Dirk Behme wrote:
>>> On 16.01.2016 15:17, Dirk Behme wrote:
>>>> From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>>>
>>>> Add device nodes for the L2 caches, and link the CPU node to its L2
>>>> cache node.
>>>>
>>>> The L2 cache for the Cortex-A57 CPU cores is 2 MiB large (organized as
>>>> 128 KiB x 16 ways).
>>>>
>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>>> Signed-off-by: Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> [snip]
>>
>>> Any further comments to this? If not, could this be applied?
>>
>> Sorry for the delay.
>>
>> This looks good; I have queued it up.
>>
>> It should appear in the next (and devel) branches of my renesas tree soon.
>> And in linux-next whenever it includes my updated next branch.
>
> So you not only dropped the (controversial) timing related properties, but
> in addition:
>
> +               cache-unified;
> +               cache-level = <2>;
>
> At least the "cache-level" property is marked as required in ePAPR.
> For "cache-unified", the wording is not that strict in ePAPR, but that property
> depends on being a unified cache in the first place.
>
> So I think these two properties should be re-added.


If I remember correctly, first, these entries are not used at all on 
ARMv8. And second, I think it was mentioned that we therefore want to 
drop them:

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/394936.html

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/arm/l2c2x0.txt?id=0bed4b7aa02c06e05121875dc443295d55b9d91d


Best regards

Dirk

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
