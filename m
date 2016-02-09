From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/2] Documentation: dt: mailbox: Add TI Message Manager
Date: Tue, 9 Feb 2016 09:44:20 +0530
Message-ID: <CABb+yY3kGq_R49Xx4fK3UMqtuFiuv-pXJWvjkEFLPL9xRu5T4A@mail.gmail.com>
References: <1454690044-2560-1-git-send-email-nm@ti.com>
	<1454690044-2560-2-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454690044-2560-2-git-send-email-nm@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Suman Anna <s-anna@ti.com>, Franklin S Cooper Jr <fcooper@ti.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Santosh Shilimkar <ssantosh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 5, 2016 at 10:04 PM, Nishanth Menon <nm@ti.com> wrote:
> +
> +       msgmgr: msgmgr@02a00000 {
> +               compatible = "ti,k2g-message-manager", "ti,message-manager";
> +               #mbox-cells = <1>;
> +               reg-names = "queue_proxy_region", "queue_state_debug_region";
> +               reg = <0x02a00000 0x400000>, <0x028c3400 0x400>;
> +
> +               msgmgr_proxy_pmmc_tx_prio0: pmmc_tx_prio0 {
> +                       ti,queue-id = <0>;
> +                       ti,proxy-id = <0>;
> +               };
> +
> +               msgmgr_proxy_pmmc_rx: pmmc_rx {
> +                       ti,queue-id = <5>;
> +                       ti,proxy-id = <2>;
> +                       interrupt-names = "rx";
> +                       interrupts = <GIC_SPI 324 IRQ_TYPE_EDGE_RISING>;
> +               };
> +       };
> +
I think we should get rid of consumer specifics from the provider node...

> +...
> +       pmmc {
> +               ...
> +               mbox-names = "tx", "rx";
> +               mboxes = <&msgmgr &msgmgr_proxy_pmmc_tx>
> +                        <&msgmgr &msgmgr_proxy_pmmc_rx>;
> +               ...
> +       };
>
... and have consumers like
       pmmc {
               ...
               mbox-names = "tx", "rx";
               mboxes = <&msgmgr 0 0>
                        <&msgmgr 5 2>;
       };

I leave the IRQ for you to decide how to specify - a 'dummy' or
'valid' always provided as last cell in mboxes or some other way.
(I'll review other patches in detail later)

cheers.
