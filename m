From: Julien Grall <julien.grall-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [Xen-devel] Duplicated memory node in the Device-Tree (WAS [XEN]
 Re: Duplicated memory nodes cause the BUG())
Date: Wed, 26 Jul 2017 10:22:09 +0100
Message-ID: <4ca32f1c-0f6b-c6b3-4902-c25b6350a52a@arm.com>
References: <835d808c-9d5e-2dc0-6cf9-8fbecdc49914@epam.com>
 <6d1fb061-03b0-3b58-e70a-3c0e0777d8d7@arm.com>
 <c77f71a3-edd9-3700-001b-feee05165454@epam.com>
 <7c1c8267-a065-f8ee-7e20-147d722c59be@arm.com>
 <b454b264-1f04-7446-fe0b-fafa82954353@epam.com>
 <eb0fbb83-a6de-d06e-f230-d06c615b0f88@citrix.com>
 <6e9456a3-7f0f-72e5-b4be-2bd51939d850@epam.com>
 <alpine.DEB.2.10.1707251045140.22381@sstabellini-ThinkPad-X260>
 <041fe162-8944-5c1b-364a-940d21a3c69e@arm.com>
 <alpine.DEB.2.10.1707251109430.22381@sstabellini-ThinkPad-X260>
 <93878809-115f-b29e-2a8c-e18f87b1fb09@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <93878809-115f-b29e-2a8c-e18f87b1fb09-uRwfk40T5oI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrii Anisov <andrii_anisov-uRwfk40T5oI@public.gmane.org>, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrew Cooper <andrew.cooper3-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, xen-devel <xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Liu <wei.liu2-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tim Deegan <tim-LM2mM/qkH7s@public.gmane.org>, Ian Jackson <ian.jackson-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, George Dunlap <george.dunlap-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-IBi9RG/b67k@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 26/07/17 10:08, Andrii Anisov wrote:
> Hello,

Hi Andrii,

> On 25.07.17 21:11, Stefano Stabellini wrote:
>> On Tue, 25 Jul 2017, Julien Grall wrote:
>>> Furthermore, if you look at the wikipage for Renesas R-Car on Xen
>>> (see [1]), a
>>> specific DT for Xen is provided.
> Well, we introduced a specific DT as a faster way to get the system up
> and running. But the target is to get rid of it.
> Except that nasty issue with memory banks, there is another one: how to
> handle reserved memory regions needed for some IP's functionality (e.g.
> ADSP).
> As I already said I do cleanup remaining nits one by one.
>
>> That's true. It does not make sense to do this until we get rid of the
>> Xen specific R-Car device tree on the wiki.
> IMO, we it should appear correspondent functionality in XEN first, and
> latter get rid of specific device tree on the wiki. So that we will have
> the wiki steps adequate to the current master.

It sounds like to me that a non-modified DT for Xen on R-Car is not for 
tomorrow...

So here, the first and only sensible option is to work with the vendor 
to modify the device-tree.

If the vendor is not willing to do it, then we can discuss about 
implementing a fix in Xen.

Cheers,

-- 
Julien Grall
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
