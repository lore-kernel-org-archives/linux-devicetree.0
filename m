From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: dt: mailbox: Add TI Message Manager
Date: Thu, 11 Feb 2016 09:53:29 +0530
Message-ID: <CABb+yY3nSZCbF7G1LP_7cGkKJpdJ1fko_6d3UkrF_vNpHk4uBg@mail.gmail.com>
References: <1454690044-2560-1-git-send-email-nm@ti.com>
	<1454690044-2560-2-git-send-email-nm@ti.com>
	<CABb+yY3kGq_R49Xx4fK3UMqtuFiuv-pXJWvjkEFLPL9xRu5T4A@mail.gmail.com>
	<56B9DC30.5040806@ti.com>
	<CABb+yY24XzsWaSGLMCE4_nvgWx0OhhQmcaP41g06FxdjQYFchg@mail.gmail.com>
	<CAGo_u6qGaQj9Qvjwrm7cD=cr2UjLN+62tcquXYPsQrRjYD=UCw@mail.gmail.com>
	<20160209181031.GA23603@kahuna>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160209181031.GA23603@kahuna>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 9, 2016 at 11:40 PM, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org> wrote:
> On 09:43-20160209, Nishanth Menon wrote:
>> On Tue, Feb 9, 2016 at 8:54 AM, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> [..]
>> Let me prototype this as part of of_xlate and see if I can pull the
>> qinst data back out.. obviously one negative will be that I will
>> register *all* valid channels as part of probe.. at least based on
>> initial code i wrote today morning..
>
> OK - I believe I have it working now. How does the following look? If
> this looks fine to you, then I will post a v2 including the driver
> update.
> Changes here:
>         - dropped the generic message-manager compatible
>         - dropped child nodes
>         - moved the valid queue information to driver (no longer in dts)
>         - rx interrupts per SoC are explicitly named list in binding(and
>           dts)
>
> Texas Instruments' Message Manager Driver
> ========================================
>
> The Texas Instruments' Message Manager is a mailbox controller that has
> configurable queues selectable at SoC(System on Chip) integration. The Message
> manager is broken up into queues in different address regions that are called
> "proxies" - each instance is unidirectional and is instantiated at SoC
> integration level to indicate receive or transmit path.
>
> Message Manager Device Node:
> ===========================
> Required properties:
> --------------------
> - compatible:           Shall be: "ti,k2g-message-manager"
> - reg-names             queue_proxy_region - Map the queue proxy region.
>                         queue_state_debug_region - Map the queue state debug
>                         region.
> - reg:                  Contains the register map per reg-names.
> - #mbox-cells           Shall be 2. Contains the queue ID and proxy ID in that
>                         order referring to the transfer path.
> - interrupt-names:      Contains interrupt names matching the rx transfer path
>                         for a given SoC. Receive interrupts shall be of the
>                         format: "rx_<QID>_<PID>".
>                         For ti,k2g-message-manager, this shall contain:
>                                 "rx_005_002", "rx_057_002"
> - interrupts:           Contains the interrupt information corresponding to
>                         interrupt-names property.
>
> Example(K2G):
> ------------
>
>         msgmgr: msgmgr@02a00000 {
>                 compatible = "ti,k2g-message-manager";
>                 #mbox-cells = <2>;
>                 reg-names = "queue_proxy_region", "queue_state_debug_region";
>                 reg = <0x02a00000 0x400000>, <0x028c3400 0x400>;
>                 interrupt-names = "rx_005_002",
>                                   "rx_057_002";
>
Looking at figure in page-1445, it seems QID is the h/w channel id,
while proxy is its programming parameter. So maybe we need to list all
the ARM irq's as a list here, matched only by the qid asked by the
consumer ... assuming no two channels could have the same qid (?).

  interrupt-names = "irq_005", "irq_037", "irq_049", "irq_057",
"perr", "ferr", "eerr";

I may be slightly off, but the idea remains to not have to encode any
consumer specific info in the provider node.

>         pmmc: pmmc {
>                 [...]
>                 mbox-names = "rx", "tx";
>                 # RX queue ID is 5, proxy ID is 2
>                 # TX queue ID is 0, proxy ID is 0
>                 mboxes= <&msgmgr 5 2>,
>                         <&msgmgr 0 0>;
>                 [...]
>         };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
