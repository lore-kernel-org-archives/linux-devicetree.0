From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 09/16] dt-bindings: dma: ti: Add document for K3 UDMA
Date: Fri, 14 Jun 2019 07:20:57 -0600
Message-ID: <CAL_JsqJNMkKL_FubZfjKY6jLebMetmgR24EoendHoPM2ckrUQA@mail.gmail.com>
References: <20190506123456.6777-1-peter.ujfalusi@ti.com> <20190506123456.6777-10-peter.ujfalusi@ti.com>
 <20190613181626.GA7039@bogus> <e0d6a264-96b5-31a6-e70b-3b1c2d863988@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e0d6a264-96b5-31a6-e70b-3b1c2d863988@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Vinod <vkoul@kernel.org>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Dan Williams <dan.j.williams@intel.com>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 2:33 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>
> Rob,
>
> On 13/06/2019 21.16, Rob Herring wrote:
> >> +Remote PSI-L endpoint
> >> +
> >> +Required properties:
> >> +--------------------
> >> +- ti,psil-base:             PSI-L thread ID base of the endpoint
> >> +
> >> +Within the PSI-L endpoint node thread configuration subnodes must present with:
> >> +ti,psil-configX naming convention, where X is the thread ID offset.
> >
> > Don't use vendor prefixes on node names.
>
> OK.
>
> >> +
> >> +Configuration node Required properties:
> >> +--------------------
> >> +- linux,udma-mode:  Channel mode, can be:
> >> +                    - UDMA_PKT_MODE: for Packet mode channels (peripherals)
> >> +                    - UDMA_TR_MODE: for Third-Party mode
> >
> > This is hardly a common linux thing. What determines the value here.
>
> Unfortunately it is.

No, it's a feature of your h/w and in no way is something linux
defined which is the point of 'linux' prefix.

> Each channel can be configured to Packet or TR mode. For some
> peripherals it is true that they only support packet mode, these are the
> newer PSI-L native peripherals.
> For these channels a udma-mode property would be correct.
>
> But we have legacy peripherals as well and they are serviced by PDMA
> (which is a native peripheral designed to talk to the given legacy IP).
> We can use either packet or TR mode in UDMAP to talk to PDMAs, it is in
> most cases clear what to use, but for example for audio (McASP) channels
> Linux is using TR channel because we need cyclic DMA while for example
> RTOS is using Packet mode as it fits their needs better.
>
> Here I need to prefix the udma-mode with linux as the mode is used by
> Linux, but other OS might opt to use different channel mode.

So you'd need <os>,udma-mode? That doesn't work... If the setting is
per OS, then it belongs in the OS because the same dtb should work
across OS's.

> The reason why this needs to be in the DT is that when the channel is
> requested we need to configure the mode and it can not be swapped
> runtime easily between Packet and TR mode.

So when the client makes the channel request, why doesn't it specify the mode?

Rob
