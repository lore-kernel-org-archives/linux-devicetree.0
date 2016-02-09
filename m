From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: dt: mailbox: Add TI Message Manager
Date: Tue, 9 Feb 2016 21:05:20 +0530
Message-ID: <CABb+yY3cUU6VAkev57sQB7vLGPAwh0YEAb3unsZ+h=Tvm5Nr2Q@mail.gmail.com>
References: <1454690044-2560-1-git-send-email-nm@ti.com>
	<1454690044-2560-2-git-send-email-nm@ti.com>
	<CABb+yY3kGq_R49Xx4fK3UMqtuFiuv-pXJWvjkEFLPL9xRu5T4A@mail.gmail.com>
	<56B9DC30.5040806@ti.com>
	<CABb+yY24XzsWaSGLMCE4_nvgWx0OhhQmcaP41g06FxdjQYFchg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY24XzsWaSGLMCE4_nvgWx0OhhQmcaP41g06FxdjQYFchg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 9, 2016 at 8:24 PM, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Feb 9, 2016 at 6:01 PM, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org> wrote:
>> On 02/08/2016 10:14 PM, Jassi Brar wrote:
>>

>>>> +
>>> I think we should get rid of consumer specifics from the provider node...
>>
>>
>> If I get rid of the consumer nodes, how do you propose I describe the rx
>> queue interrupt(s) in the msmgr dt node (Every Rx queue will have it's
>> own interrupt - and it cannot be reverse computed from queue ID, proxy ID)?
>>
> One option is to have controller driver construct interrupt name from
> queue and proxy ids like
>
> msgmgr: msgmgr@02a00000 {
>    ....
>      interrupt-names = "irq_5_2", "irq_0_0";     /* irq_<queue-id>_<proxy-id> */
>      interrupts = <GIC_SPI 324 IRQ_TYPE_EDGE_RISING>,
>                         <GIC_SPI 325 IRQ_TYPE_EDGE_RISING>;
> }
>
> and have the consumer specify queue and proxy ids in mboxes property like
>  pmmc {
>        ....
>        mbox-names = "tx", "rx";
>        mboxes = <&msgmgr 0 0>
>                           <&msgmgr 5 2>;
> };
>
However if the queue+proxy+interrupt tuple is a hard property of a
channel (which it seems to me now), then probably your original scheme
of chile node phandle is just as fine.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
