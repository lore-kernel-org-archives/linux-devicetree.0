From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] DT: mailbox: add binding doc for the ARM SMC mailbox
Date: Tue, 9 Jul 2019 07:31:01 -0600
Message-ID: <CAL_JsqK+YK0mNiNK_wuoGcor6aKVx-hQYy_awc2AQg9jQe6iVQ@mail.gmail.com>
References: <20190603083005.4304-1-peng.fan@nxp.com> <20190603083005.4304-2-peng.fan@nxp.com>
 <20190708221947.GA13552@bogus> <AM0PR04MB44816C38C43A3C8E09E8FFF588F10@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR04MB44816C38C43A3C8E09E8FFF588F10@AM0PR04MB4481.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "van.freenix@gmail.com" <van.freenix@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 8, 2019 at 7:40 PM Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Rob,
>
> > Subject: Re: [PATCH V2 1/2] DT: mailbox: add binding doc for the ARM SMC
> > mailbox
> >
> > On Mon, Jun 03, 2019 at 04:30:04PM +0800, peng.fan@nxp.com wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > The ARM SMC mailbox binding describes a firmware interface to trigger
> > > actions in software layers running in the EL2 or EL3 exception levels.
> > > The term "ARM" here relates to the SMC instruction as part of the ARM
> > > instruction set, not as a standard endorsed by ARM Ltd.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >
> > > V2:
> > > Introduce interrupts as a property.
> > >
> > > V1:
> > > arm,func-ids is still kept as an optional property, because there is
> > > no defined SMC funciton id passed from SCMI. So in my test, I still
> > > use arm,func-ids for ARM SIP service.
> > >
> > >  .../devicetree/bindings/mailbox/arm-smc.txt        | 101
> > +++++++++++++++++++++
> > >  1 file changed, 101 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/mailbox/arm-smc.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/mailbox/arm-smc.txt
> > > b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
> > > new file mode 100644
> > > index 000000000000..401887118c09
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
> > > @@ -0,0 +1,101 @@
> > > +ARM SMC Mailbox Interface
> > > +=========================
> > > +
> > > +This mailbox uses the ARM smc (secure monitor call) instruction to
> > > +trigger a mailbox-connected activity in firmware, executing on the
> > > +very same core as the caller. By nature this operation is synchronous
> > > +and this mailbox provides no way for asynchronous messages to be
> > > +delivered the other way round, from firmware to the OS, but
> > > +asynchronous notification could also be supported. However the value
> > > +of r0/w0/x0 the firmware returns after the smc call is delivered as a
> > > +received message to the mailbox framework, so a synchronous
> > > +communication can be established, for a asynchronous notification, no
> > > +value will be returned. The exact meaning of both the action the
> > > +mailbox triggers as well as the return value is defined by their users and is
> > not subject to this binding.
> > > +
> > > +One use case of this mailbox is the SCMI interface, which uses shared
> > > +memory to transfer commands and parameters, and a mailbox to trigger
> > > +a function call. This allows SoCs without a separate management
> > > +processor (or when such a processor is not available or used) to use
> > > +this standardized interface anyway.
> > > +
> > > +This binding describes no hardware, but establishes a firmware interface.
> > > +Upon receiving an SMC using one of the described SMC function
> > > +identifiers, the firmware is expected to trigger some mailbox connected
> > functionality.
> > > +The communication follows the ARM SMC calling convention[1].
> > > +Firmware expects an SMC function identifier in r0 or w0. The
> > > +supported identifiers are passed from consumers, or listed in the the
> > > +arm,func-ids properties as described below. The firmware can return
> > > +one value in the first SMC result register, it is expected to be an
> > > +error value, which shall be propagated to the mailbox client.
> > > +
> > > +Any core which supports the SMC or HVC instruction can be used, as
> > > +long as a firmware component running in EL3 or EL2 is handling these calls.
> > > +
> > > +Mailbox Device Node:
> > > +====================
> > > +
> > > +This node is expected to be a child of the /firmware node.
> > > +
> > > +Required properties:
> > > +--------------------
> > > +- compatible:              Shall be "arm,smc-mbox"
> > > +- #mbox-cells              Shall be 1 - the index of the channel needed.
> > > +- arm,num-chans            The number of channels supported.
> > > +- method:          A string, either:
> > > +                   "hvc": if the driver shall use an HVC call, or
> > > +                   "smc": if the driver shall use an SMC call.
> > > +
> > > +Optional properties:
> > > +- arm,func-ids             An array of 32-bit values specifying the function
> > > +                   IDs used by each mailbox channel. Those function IDs
> > > +                   follow the ARM SMC calling convention standard [1].
> > > +                   There is one identifier per channel and the number
> > > +                   of supported channels is determined by the length
> > > +                   of this array.
> > > +- interrupts               SPI interrupts may be listed for notification,
> > > +                   each channel should use a dedicated interrupt
> > > +                   line.
> > > +
> > > +Example:
> > > +--------
> > > +
> > > +   sram@910000 {
> > > +           compatible = "mmio-sram";
> > > +           reg = <0x0 0x93f000 0x0 0x1000>;
> > > +           #address-cells = <1>;
> > > +           #size-cells = <1>;
> > > +           ranges = <0 0x0 0x93f000 0x1000>;
> > > +
> > > +           cpu_scp_lpri: scp-shmem@0 {
> > > +                   compatible = "arm,scmi-shmem";
> > > +                   reg = <0x0 0x200>;
> > > +           };
> > > +
> > > +           cpu_scp_hpri: scp-shmem@200 {
> > > +                   compatible = "arm,scmi-shmem";
> > > +                   reg = <0x200 0x200>;
> > > +           };
> > > +   };
> > > +
> > > +   smc_mbox: mailbox {
> >
> > This should be a child of 'firmware' node at least and really a child of the
> > firmware component that implements the feature.
>
> I checked other mbox driver, including the mbox used by ti sci, mbox used by
> i.MX8QXP. both mbox dts node not a child a firmware node,

Because those are actual h/w blocks and not implemented in firmware calls?

> I am not sure why put mbox node into a child a firmware node here.

If it is an interface provided by firmware, then it goes under /firmware.

Rob
