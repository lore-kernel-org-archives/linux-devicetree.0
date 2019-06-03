From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH V2 1/2] DT: mailbox: add binding doc for the ARM SMC
 mailbox
Date: Mon, 3 Jun 2019 17:56:51 +0100
Message-ID: <20190603165651.GA12196@e107155-lin>
References: <20190603083005.4304-1-peng.fan@nxp.com>
 <20190603083005.4304-2-peng.fan@nxp.com>
 <ae4c79f0-4aec-250e-e312-20aba5554665@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ae4c79f0-4aec-250e-e312-20aba5554665@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: peng.fan@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, jassisinghbrar@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com, shawnguo@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.przywara@arm.com, van.freenix@gmail.com, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 03, 2019 at 09:22:16AM -0700, Florian Fainelli wrote:
> On 6/3/19 1:30 AM, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The ARM SMC mailbox binding describes a firmware interface to trigger
> > actions in software layers running in the EL2 or EL3 exception levels.
> > The term "ARM" here relates to the SMC instruction as part of the ARM
> > instruction set, not as a standard endorsed by ARM Ltd.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >
> > V2:
> > Introduce interrupts as a property.
> >
> > V1:
> > arm,func-ids is still kept as an optional property, because there is no
> > defined SMC funciton id passed from SCMI. So in my test, I still use
> > arm,func-ids for ARM SIP service.
> >
> >  .../devicetree/bindings/mailbox/arm-smc.txt        | 101 +++++++++++++++++++++
> >  1 file changed, 101 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/arm-smc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mailbox/arm-smc.txt b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
> > new file mode 100644
> > index 000000000000..401887118c09
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/arm-smc.txt
> > @@ -0,0 +1,101 @@

[...]

> > +Optional properties:
> > +- arm,func-ids		An array of 32-bit values specifying the function
> > +			IDs used by each mailbox channel. Those function IDs
> > +			follow the ARM SMC calling convention standard [1].
> > +			There is one identifier per channel and the number
> > +			of supported channels is determined by the length
> > +			of this array.
> > +- interrupts		SPI interrupts may be listed for notification,
> > +			each channel should use a dedicated interrupt
> > +			line.
>
> I would not go about defining a specific kind of interrupt, since SPI is
> a GIC terminology, this firmware interface could be used in premise with
> any parent interrupt controller, for which the concept of a SPI/PPI/SGI
> may not be relevant.
>

While I agree the binding document may not contain specifics, I still
don't see how to use SGI with this. Also note it's generally reserved
for OS future use(IPC) and using this for other than IPC may be bit
challenging IMO. It opens up lots of questions.

--
Regards,
Sudeep
