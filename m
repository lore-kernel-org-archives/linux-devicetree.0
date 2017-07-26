From: Andrii Anisov <andrii_anisov-uRwfk40T5oI@public.gmane.org>
Subject: Re: [Xen-devel] Duplicated memory node in the Device-Tree (WAS [XEN]
 Re: Duplicated memory nodes cause the BUG())
Date: Wed, 26 Jul 2017 15:10:17 +0300
Message-ID: <54751479-f6f2-36ef-e4c1-282188c08774@epam.com>
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
 <4ca32f1c-0f6b-c6b3-4902-c25b6350a52a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4ca32f1c-0f6b-c6b3-4902-c25b6350a52a-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julien Grall <julien.grall-5wv7dgnIgG8@public.gmane.org>, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrew Cooper <andrew.cooper3-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, xen-devel <xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Liu <wei.liu2-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tim Deegan <tim-LM2mM/qkH7s@public.gmane.org>, Ian Jackson <ian.jackson-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, George Dunlap <george.dunlap-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-IBi9RG/b67k@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Julien.


On 26.07.17 12:22, Julien Grall wrote:
> It sounds like to me that a non-modified DT for Xen on R-Car is not 
> for tomorrow...
Yep, unfortunately it is not for tomorrow.

> So here, the first and only sensible option is to work with the vendor 
> to modify the device-tree.
OK, I'll move in that direction instead of pushing changes into hypervisor.

> If the vendor is not willing to do it, then we can discuss about 
> implementing a fix in Xen.
I had it in my mind as a generic stuff. Partially inspired by LK approach.

-- 

*Andrii Anisov*


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
