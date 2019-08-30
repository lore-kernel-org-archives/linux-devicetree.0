From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Fri, 30 Aug 2019 02:21:32 -0500
Message-ID: <CABb+yY2TREpO7+TFcGgsgQrkmMWwFAgtuJ4GnLPPQ+GEBuh07w@mail.gmail.com>
References: <1567004515-3567-1-git-send-email-peng.fan@nxp.com>
 <1567004515-3567-2-git-send-email-peng.fan@nxp.com> <CABb+yY2tRjazjaogpM7irqgTD+PdwsfqCxk5hP-_czrET3V5xQ@mail.gmail.com>
 <AM0PR04MB4481785CABB44A8C71CFB8D788BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR04MB4481785CABB44A8C71CFB8D788BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 1:28 AM Peng Fan <peng.fan@nxp.com> wrote:

> > > +examples:
> > > +  - |
> > > +    sram@910000 {
> > > +      compatible = "mmio-sram";
> > > +      reg = <0x0 0x93f000 0x0 0x1000>;
> > > +      #address-cells = <1>;
> > > +      #size-cells = <1>;
> > > +      ranges = <0 0x0 0x93f000 0x1000>;
> > > +
> > > +      cpu_scp_lpri: scp-shmem@0 {
> > > +        compatible = "arm,scmi-shmem";
> > > +        reg = <0x0 0x200>;
> > > +      };
> > > +
> > > +      cpu_scp_hpri: scp-shmem@200 {
> > > +        compatible = "arm,scmi-shmem";
> > > +        reg = <0x200 0x200>;
> > > +      };
> > > +    };
> > > +
> > > +    firmware {
> > > +      smc_mbox: mailbox {
> > > +        #mbox-cells = <1>;
> > > +        compatible = "arm,smc-mbox";
> > > +        method = "smc";
> > > +        arm,num-chans = <0x2>;
> > > +        transports = "mem";
> > > +        /* Optional */
> > > +        arm,func-ids = <0xc20000fe>, <0xc20000ff>;
> > >
> > SMC/HVC is synchronously(block) running in "secure mode", i.e, there can
> > only be one instance running platform wide. Right?
>
> I think there could be channel for TEE, and channel for Linux.
> For virtualization case, there could be dedicated channel for each VM.
>
I am talking from Linux pov. Functions 0xfe and 0xff above, can't both
be active at the same time, right?
