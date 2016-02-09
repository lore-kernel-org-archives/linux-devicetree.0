From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/2] Documentation: dt: mailbox: Add TI Message Manager
Date: Tue, 9 Feb 2016 20:24:07 +0530
Message-ID: <CABb+yY24XzsWaSGLMCE4_nvgWx0OhhQmcaP41g06FxdjQYFchg@mail.gmail.com>
References: <1454690044-2560-1-git-send-email-nm@ti.com>
	<1454690044-2560-2-git-send-email-nm@ti.com>
	<CABb+yY3kGq_R49Xx4fK3UMqtuFiuv-pXJWvjkEFLPL9xRu5T4A@mail.gmail.com>
	<56B9DC30.5040806@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56B9DC30.5040806@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Franklin S Cooper Jr <fcooper@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 9, 2016 at 6:01 PM, Nishanth Menon <nm@ti.com> wrote:
> On 02/08/2016 10:14 PM, Jassi Brar wrote:
>
> Thanks for the review.
>
>> On Fri, Feb 5, 2016 at 10:04 PM, Nishanth Menon <nm@ti.com> wrote:
>>> +
>>> +       msgmgr: msgmgr@02a00000 {
>>> +               compatible = "ti,k2g-message-manager", "ti,message-manager";
>>> +               #mbox-cells = <1>;
>>> +               reg-names = "queue_proxy_region", "queue_state_debug_region";
>>> +               reg = <0x02a00000 0x400000>, <0x028c3400 0x400>;
>>> +
>>> +               msgmgr_proxy_pmmc_tx_prio0: pmmc_tx_prio0 {
>>> +                       ti,queue-id = <0>;
>>> +                       ti,proxy-id = <0>;
>>> +               };
>>> +
>>> +               msgmgr_proxy_pmmc_rx: pmmc_rx {
>>> +                       ti,queue-id = <5>;
>>> +                       ti,proxy-id = <2>;
>>> +                       interrupt-names = "rx";
>>> +                       interrupts = <GIC_SPI 32I didn't respond because I think Suman got Rob's point wrong.I didn't respond because I think Suman got Rob's point wrong.4 IRQ_TYPE_EDGE_RISING>;
>>> +               };
>>> +       };
>>> +
>> I think we should get rid of consumer specifics from the provider node...
>
>
> If I get rid of the consumer nodes, how do you propose I describe the rx
> queue interrupt(s) in the msmgr dt node (Every Rx queue will have it's
> own interrupt - and it cannot be reverse computed from queue ID, proxy ID)?
>
One option is to have controller driver construct interrupt name from
queue and proxy ids like

msgmgr: msgmgr@02a00000 {
   ....
     interrupt-names = "irq_5_2", "irq_0_0";     /* irq_<queue-id>_<proxy-id> */
     interrupts = <GIC_SPI 324 IRQ_TYPE_EDGE_RISING>,
                        <GIC_SPI 325 IRQ_TYPE_EDGE_RISING>;
}

and have the consumer specify queue and proxy ids in mboxes property like
 pmmc {
       ....
       mbox-names = "tx", "rx";
       mboxes = <&msgmgr 0 0>
                          <&msgmgr 5 2>;
};


>>> +...
>>> +       pmmc {
>>> +               ...
>>> +               mbox-names = "tx", "rx";
>>> +               mboxes = <&msgmgr &msgmgr_proxy_pmmc_tx>
>>> +                        <&msgmgr &msgmgr_proxy_pmmc_rx>;
>>> +               ...
>>> +       };
>>>
>> ... and have consumers like
>>        pmmc {
>>                ...
>>                mbox-names = "tx", "rx";
>>                mboxes = <&msgmgr 0 0>
>>                         <&msgmgr 5 2>;
>>        };
>>
>> I leave the IRQ for you to decide how to specify - a 'dummy' or
>> 'valid' always provided as last cell in mboxes or some other way.
>> (I'll review other patches in detail later)
>
> What do we do with the issues that Suman pointed out in the mailbox
> framework itself? Could you respond to that thread[1] as well?
>
Phandle of provider in consumer node is quite normal and acceptable.
I think Rob (at least I am) is talking about the second cell where you
specify phandle (&msgmgr_proxy_xxx) instead of values from those child
nodes directly.
Which is what I suggest   mboxes = <&msgmgr 0 0>,  <&msgmgr 5 2>;

Cheers!
