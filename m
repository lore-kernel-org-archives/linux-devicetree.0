From: Andrii Anisov <andrii_anisov-uRwfk40T5oI@public.gmane.org>
Subject: Re: Duplicated memory node in the Device-Tree (WAS [XEN] Re:
 Duplicated memory nodes cause the BUG())
Date: Tue, 25 Jul 2017 19:51:51 +0300
Message-ID: <6e9456a3-7f0f-72e5-b4be-2bd51939d850@epam.com>
References: <835d808c-9d5e-2dc0-6cf9-8fbecdc49914@epam.com>
 <6d1fb061-03b0-3b58-e70a-3c0e0777d8d7@arm.com>
 <c77f71a3-edd9-3700-001b-feee05165454@epam.com>
 <7c1c8267-a065-f8ee-7e20-147d722c59be@arm.com>
 <b454b264-1f04-7446-fe0b-fafa82954353@epam.com>
 <eb0fbb83-a6de-d06e-f230-d06c615b0f88@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eb0fbb83-a6de-d06e-f230-d06c615b0f88-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Cooper <andrew.cooper3-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Julien Grall <julien.grall-5wv7dgnIgG8@public.gmane.org>, xen-devel <xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org>
Cc: Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Jackson <ian.jackson-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Wei Liu <wei.liu2-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-IBi9RG/b67k@public.gmane.org>, Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, George Dunlap <george.dunlap-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tim Deegan <tim-LM2mM/qkH7s@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Andrew,


On 25.07.17 19:23, Andrew Cooper wrote:
> As a general rule, Xen needs to be able to tolerate and cope with any
> quantity of crap described by the firmware.  On the x86 side, we have
> large quantities of workarounds for buggy ACPI/MP/SMBIOS tables.
That approach somehow covered with early mentioned options:

On 25.07.17 15:24, Andrii Anisov wrote:
> * ignore next duplicating (overlapping) memory node in favor of one 
> already in a memory banks list
> * merge duplicating (overlapping), even neighboring, memory banks 

On 25.07.17 19:23, Andrew Cooper wrote:
> It might be the case that the best Xen can do is give up, but it should
> do so with a clear error message identifying what the firmware has done
> which is sufficiently crazy to prevent further booting.
We have one more option to choose for the case:

* BUG() with clear notification at the moment we are trying to add 
overlapping memory bank

So what to choose?

ps:
> Hitting a BUG()
Actually silently dying without earlyprintk enabled in this case. It 
happens pretty early.

-- 

*Andrii Anisov*


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
