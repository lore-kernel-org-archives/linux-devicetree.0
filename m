From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Fri, 30 Aug 2019 07:37:41 +0000
Message-ID: <AM0PR04MB448161C632722DF10989008088BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1567004515-3567-1-git-send-email-peng.fan@nxp.com>
 <1567004515-3567-2-git-send-email-peng.fan@nxp.com>
 <CABb+yY2tRjazjaogpM7irqgTD+PdwsfqCxk5hP-_czrET3V5xQ@mail.gmail.com>
 <AM0PR04MB4481785CABB44A8C71CFB8D788BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CABb+yY2TREpO7+TFcGgsgQrkmMWwFAgtuJ4GnLPPQ+GEBuh07w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY2TREpO7+TFcGgsgQrkmMWwFAgtuJ4GnLPPQ+GEBuh07w@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

> Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the ARM
> SMC/HVC mailbox
> 
> On Fri, Aug 30, 2019 at 1:28 AM Peng Fan <peng.fan@nxp.com> wrote:
> 
> > > > +examples:
> > > > +  - |
> > > > +    sram@910000 {
> > > > +      compatible = "mmio-sram";
> > > > +      reg = <0x0 0x93f000 0x0 0x1000>;
> > > > +      #address-cells = <1>;
> > > > +      #size-cells = <1>;
> > > > +      ranges = <0 0x0 0x93f000 0x1000>;
> > > > +
> > > > +      cpu_scp_lpri: scp-shmem@0 {
> > > > +        compatible = "arm,scmi-shmem";
> > > > +        reg = <0x0 0x200>;
> > > > +      };
> > > > +
> > > > +      cpu_scp_hpri: scp-shmem@200 {
> > > > +        compatible = "arm,scmi-shmem";
> > > > +        reg = <0x200 0x200>;
> > > > +      };
> > > > +    };
> > > > +
> > > > +    firmware {
> > > > +      smc_mbox: mailbox {
> > > > +        #mbox-cells = <1>;
> > > > +        compatible = "arm,smc-mbox";
> > > > +        method = "smc";
> > > > +        arm,num-chans = <0x2>;
> > > > +        transports = "mem";
> > > > +        /* Optional */
> > > > +        arm,func-ids = <0xc20000fe>, <0xc20000ff>;
> > > >
> > > SMC/HVC is synchronously(block) running in "secure mode", i.e, there
> > > can only be one instance running platform wide. Right?
> >
> > I think there could be channel for TEE, and channel for Linux.
> > For virtualization case, there could be dedicated channel for each VM.
> >
> I am talking from Linux pov. Functions 0xfe and 0xff above, can't both be
> active at the same time, right?

If I get your point correctly,
On UP, both could not be active. On SMP, tx/rx could be both active, anyway
this depends on secure firmware and Linux firmware design.

Do you have any suggestions about arm,func-ids here?

Thanks,
Peng.
