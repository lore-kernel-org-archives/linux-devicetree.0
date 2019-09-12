From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Thu, 12 Sep 2019 03:05:39 +0000
Message-ID: <AM0PR04MB4481538B358440C42EC4041B88B00@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1567004515-3567-1-git-send-email-peng.fan@nxp.com>
 <1567004515-3567-2-git-send-email-peng.fan@nxp.com>
 <20190909164208.6605054e@donnerap.cambridge.arm.com>
 <CABb+yY2rppSOgqMy+R294d94xwi5UPR55Eo-WB8KA6m11nG3iQ@mail.gmail.com>
 <20190911160308.30878cc3@donnerap.cambridge.arm.com>
 <CABb+yY1oZxvX+mRNmObAHsGoBfN0F4GO+9PSj06EFaF3DsnstA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY1oZxvX+mRNmObAHsGoBfN0F4GO+9PSj06EFaF3DsnstA@mail.gmail.com>
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
To: Jassi Brar <jassisinghbrar@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the ARM
> SMC/HVC mailbox
> 
> On Wed, Sep 11, 2019 at 10:03 AM Andre Przywara
> <andre.przywara@arm.com> wrote:
> >
> > On Tue, 10 Sep 2019 21:44:11 -0500
> > Jassi Brar <jassisinghbrar@gmail.com> wrote:
> >
> > Hi,
> >
> > > On Mon, Sep 9, 2019 at 10:42 AM Andre Przywara
> <andre.przywara@arm.com> wrote:
> > > >
> > > > On Wed, 28 Aug 2019 03:02:58 +0000 Peng Fan <peng.fan@nxp.com>
> > > > wrote:
> > > >
> > [ ... ]
> > > >
> > > > > +
> > > > > +  arm,func-ids:
> > > > > +    description: |
> > > > > +      An array of 32-bit values specifying the function IDs used by
> each
> > > > > +      mailbox channel. Those function IDs follow the ARM SMC
> calling
> > > > > +      convention standard [1].
> > > > > +
> > > > > +      There is one identifier per channel and the number of
> supported
> > > > > +      channels is determined by the length of this array.
> > > >
> > > > I think this makes it obvious that arm,num-chans is not needed.
> > > >
> > > > Also this somewhat contradicts the driver implementation, which allows
> the array to be shorter, marking this as UINT_MAX and later on using the first
> data item as a function identifier. This is somewhat surprising and not
> documented (unless I missed something).
> > > >
> > > > So I would suggest:
> > > > - We drop the transports property, and always put the client provided
> data in the registers, according to the SMCCC. Document this here.
> > > >   A client not needing those could always puts zeros (or garbage) in
> there, the respective firmware would just ignore the registers.
> > > > - We drop "arm,num-chans", as this is just redundant with the length of
> the func-ids array.
> > > > - We don't impose an arbitrary limit on the number of channels. From
> the firmware point of view this is just different function IDs, from Linux' point
> of view just the size of the memory used. Both don't need to be limited
> artificially IMHO.
> > > >
> > > Sounds like we are in sync.
> > >
> > > > - We mark arm,func-ids as required, as this needs to be fixed, allocated
> number.
> > > >
> > > I still think func-id can be done without. A client can always pass
> > > the value as it knows what it expects.
> >
> > I don't think it's the right abstraction. The mailbox *controller* uses a
> specific func-id, this has to match the one the firmware expects. So this is a
> property of the mailbox transport channel (the SMC call), and the *client*
> should *not* care about it. It just sees the logical channel ID (if we have one),
> which the controller translates into the func-ID.
> >
> arg0 is special only to the client/protocol, otherwise it is simply the first
> argument for the arm_smccc_smc *instruction* controller.
> arg[1,7] are already provided by the client, so it is only neater if
> arg0 is also taken from the client.
> 
> But as I said, I am still ok if func-id is passed from dt and arg0 from client is
> ignored because we have one channel per controller design and we don't have
> to worry about number of channels there can be dedicated to specific
> functions.

Ok, so I'll make it an optional property.

> 
> > So it should really look like this (assuming only single channel controllers):
> > mailbox: smc-mailbox {
> >     #mbox-cells = <0>;
> >     compatible = "arm,smc-mbox";
> >     method = "smc";
> >
> Do we want to do away with 'method' property and use different 'compatible'
> properties instead?
>  compatible = "arm,smc-mbox";     or    compatible = "arm,hvc-mbox";

I am ok, just need add data in driver to differentiate smc/hvc.
Andre, are you ok?

Thanks,
Peng.

> 
> >     arm,func-id = <0x820000fe>;
> > };
> > scmi {
> >     compatible = "arm,scmi";
> >     mboxes = <&smc_mbox>;
> >     mbox-names = "tx"; /* rx is optional */
> >     shmem = <&cpu_scp_hpri>;
> > };
> >
> > If you allow the client to provide the function ID (and I am not saying this is
> a good idea): where would this func ID come from? It would need to be a
> property of the client DT node, then. So one way would be to use the func ID
> as the Linux mailbox channel ID:
> > mailbox: smc-mailbox {
> >     #mbox-cells = <1>;
> >     compatible = "arm,smc-mbox";
> >     method = "smc";
> > };
> > scmi {
> >     compatible = "arm,scmi";
> >     mboxes = <&smc_mbox 0x820000fe>;
> >     mbox-names = "tx"; /* rx is optional */
> >     shmem = <&cpu_scp_hpri>;
> > };
> >
> > But this doesn't look desirable.
> >
> > And as I mentioned this before: allowing some mailbox clients to provide
> the function IDs sound scary, as they could use anything they want, triggering
> random firmware actions (think PSCI_CPU_OFF).
> >
> That paranoia is unwarranted. We have to keep faith in kernel-space code
> doing the right thing.
> Either the illegitimate function request should be rejected by the firmware or
> client driver be called buggy.... just as we would call a block device driver
> buggy if it messed up the sector numbers in a write request.
> 
> thnx.
