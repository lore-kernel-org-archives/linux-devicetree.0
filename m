From: Andrii Anisov <andrii_anisov-uRwfk40T5oI@public.gmane.org>
Subject: Re: Duplicated memory node in the Device-Tree (WAS [XEN] Re:
 Duplicated memory nodes cause the BUG())
Date: Tue, 25 Jul 2017 19:02:24 +0300
Message-ID: <b454b264-1f04-7446-fe0b-fafa82954353@epam.com>
References: <835d808c-9d5e-2dc0-6cf9-8fbecdc49914@epam.com>
 <6d1fb061-03b0-3b58-e70a-3c0e0777d8d7@arm.com>
 <c77f71a3-edd9-3700-001b-feee05165454@epam.com>
 <7c1c8267-a065-f8ee-7e20-147d722c59be@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7c1c8267-a065-f8ee-7e20-147d722c59be-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julien Grall <julien.grall-5wv7dgnIgG8@public.gmane.org>, xen-devel <xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org>
Cc: Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Cooper <andrew.cooper3-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Ian Jackson <ian.jackson-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Wei Liu <wei.liu2-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-IBi9RG/b67k@public.gmane.org>, Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, George Dunlap <george.dunlap-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tim Deegan <tim-LM2mM/qkH7s@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Julien,


On 25.07.17 18:44, Julien Grall wrote:
> I have seen work on this board for the past year and it is the first 
> time I have seen a complain about memory overlap. So why this sudden 
> change?
It just an approach change. I'm cleaning up nits for the board.

> Is that a comment from the vendor or your guess?
It is my impression.
But yes, it could be worth to ask them why do they hardcode the memory 
layout in their u-boot but stuff the dts with number of memory nodes.
Actually from the beginning of our time for this board the solution was 
merging all memory description nodes in one in a dts for XEN, like [1]. 
So u-boot runtime updates to the dtb were just ignored.

> You need to differentiate the device-tree spec itself and Linux 
> implementation. memblock is something common to all architecture. It 
> does not mean it is something valid to do.
That is why I asked for an advice.

[1] 
https://github.com/xen-troops/meta-demo/blob/master/meta-rcar-gen3-xen/recipes-kernel/linux/linux-renesas/r8a7795-salvator-x-xen.dts#L61
-- 

*Andrii Anisov*


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
