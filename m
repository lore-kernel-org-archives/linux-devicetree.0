From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the
 ARM SMC/HVC mailbox
Date: Wed, 11 Sep 2019 16:03:08 +0100
Message-ID: <20190911160308.30878cc3@donnerap.cambridge.arm.com>
References: <1567004515-3567-1-git-send-email-peng.fan@nxp.com>
        <1567004515-3567-2-git-send-email-peng.fan@nxp.com>
        <20190909164208.6605054e@donnerap.cambridge.arm.com>
        <CABb+yY2rppSOgqMy+R294d94xwi5UPR55Eo-WB8KA6m11nG3iQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY2rppSOgqMy+R294d94xwi5UPR55Eo-WB8KA6m11nG3iQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, 10 Sep 2019 21:44:11 -0500
Jassi Brar <jassisinghbrar@gmail.com> wrote:

Hi,

> On Mon, Sep 9, 2019 at 10:42 AM Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > On Wed, 28 Aug 2019 03:02:58 +0000
> > Peng Fan <peng.fan@nxp.com> wrote:
> >
[ ... ]
> >  
> > > +
> > > +  arm,func-ids:
> > > +    description: |
> > > +      An array of 32-bit values specifying the function IDs used by each
> > > +      mailbox channel. Those function IDs follow the ARM SMC calling
> > > +      convention standard [1].
> > > +
> > > +      There is one identifier per channel and the number of supported
> > > +      channels is determined by the length of this array.  
> >
> > I think this makes it obvious that arm,num-chans is not needed.
> >
> > Also this somewhat contradicts the driver implementation, which allows the array to be shorter, marking this as UINT_MAX and later on using the first data item as a function identifier. This is somewhat surprising and not documented (unless I missed something).
> >
> > So I would suggest:
> > - We drop the transports property, and always put the client provided data in the registers, according to the SMCCC. Document this here.
> >   A client not needing those could always puts zeros (or garbage) in there, the respective firmware would just ignore the registers.
> > - We drop "arm,num-chans", as this is just redundant with the length of the func-ids array.
> > - We don't impose an arbitrary limit on the number of channels. From the firmware point of view this is just different function IDs, from Linux' point of view just the size of the memory used. Both don't need to be limited artificially IMHO.
> >  
> Sounds like we are in sync.
> 
> > - We mark arm,func-ids as required, as this needs to be fixed, allocated number.
> >  
> I still think func-id can be done without. A client can always pass
> the value as it knows what it expects.

I don't think it's the right abstraction. The mailbox *controller* uses a specific func-id, this has to match the one the firmware expects. So this is a property of the mailbox transport channel (the SMC call), and the *client* should *not* care about it. It just sees the logical channel ID (if we have one), which the controller translates into the func-ID.

So it should really look like this (assuming only single channel controllers):
mailbox: smc-mailbox {
    #mbox-cells = <0>;
    compatible = "arm,smc-mbox";
    method = "smc";
    arm,func-id = <0x820000fe>;
};
scmi {
    compatible = "arm,scmi";
    mboxes = <&smc_mbox>;
    mbox-names = "tx"; /* rx is optional */
    shmem = <&cpu_scp_hpri>;
};

If you allow the client to provide the function ID (and I am not saying this is a good idea): where would this func ID come from? It would need to be a property of the client DT node, then. So one way would be to use the func ID as the Linux mailbox channel ID:
mailbox: smc-mailbox {
    #mbox-cells = <1>;
    compatible = "arm,smc-mbox";
    method = "smc";
};
scmi {
    compatible = "arm,scmi";
    mboxes = <&smc_mbox 0x820000fe>;
    mbox-names = "tx"; /* rx is optional */
    shmem = <&cpu_scp_hpri>;
};

But this doesn't look desirable.

And as I mentioned this before: allowing some mailbox clients to provide the function IDs sound scary, as they could use anything they want, triggering random firmware actions (think PSCI_CPU_OFF).

So I think we should have a required "arm,func-id" property, with exactly one 32-bit value (again assuming single channel controllers).

Cheers,
Andre.
